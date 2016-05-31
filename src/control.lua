require "defines"
require "lib.TickBalancer"

local mod = {}

function implode(delimiter, list)
  local len = #list
  if len == 0 then
    return ""
  end
  local string = list[1]
  for i = 2, len do
    string = string .. delimiter .. list[i]
  end
  return string
end

function mod:init()
  self.deployers = TickBalancer.setupForEntity("blueprint-deployer", "deployers", 20, function(data)
    self:checkForDeployment(data)
  end, function(entity)
    return {entity=entity}
  end)

  -- Small hack to add another entity type handled in the exact same way
  TickBalancer.entityBalancers["blueprint-destructive-deployer"] = self.deployers

  --[[
  self.printers = TickBalancer.setupForEntity("blueprint-printer", "printers", 20, function(data)
    -- noop
  end, function(entity)
    return {entity=entity, blueprint=nil}
  end)
  ]]--
end

function mod:checkForDeployment(data)
  local deployer = data.entity
  local isDestructive = (deployer.name == "blueprint-destructive-deployer")

  -- Check chest inventory for blueprint
  local deployerInventory = deployer.get_inventory(defines.inventory.chest)
  local deployerItemStack = deployerInventory[1]

  if deployerItemStack.valid_for_read then
    if data.currentBlueprint ~= deployerItemStack then
      -- Blueprint has been inserted
      data.currentBlueprint = deployerItemStack
      data.deployed = false
    else
      -- Blueprint has not been changed, but should check ghosts for expiry
      return
    end
  else
    if data.currentBlueprint ~= nil then
      -- Blueprint has been removed, reset flags
      data.currentBlueprint = nil
      data.deployed = false
    end
    -- Otherwise still waiting for a blueprint
    return
  end

  local player = game.players[1]

  if deployerItemStack.name ~= "blueprint" then
    -- TODO: Sort out player messaging
    player.print("Blueprint must be inserted into deployer")
    return
  end

  local bpEntities = deployerItemStack.get_blueprint_entities()
  local anchorEntity = nil
  for _,bpEntity in pairs(bpEntities) do
    if (bpEntity.name == "blueprint-anchor") then
      anchorEntity = bpEntity
      break
    end
  end
  if not anchorEntity then
    -- TODO: Sort out player messaging
    player.print("Cannot deploy blueprint, does not contain a Blueprint Anchor")
    return
  end
  local surface = deployer.surface
  data.ghosts = {}
  for _,bpEntity in pairs(bpEntities) do
    -- Anchor is never placed as it would conflict with the deployer itself
    if (bpEntity.name ~= "blueprint-anchor") then
      bpEntity.position = {x= bpEntity.position.x - anchorEntity.position.x + deployer.position.x, y= bpEntity.position.y - anchorEntity.position.y + deployer.position.y}
      bpEntity.force = deployer.force

      if surface.can_place_entity(bpEntity) or isDestructive then
        bpEntity.inner_name = bpEntity.name
        bpEntity.name = "entity-ghost"
        local createdGhost = surface.create_entity(bpEntity)
        table.insert(data.ghosts, createdGhost)

        -- If destructive, scan for colliding entities
        if isDestructive then
          -- Note: the following may be erroneous -- theoretically it should be the collision_box determining whether items collide with trees and therefore whether bots can place them;
          -- but this resulted in situations where trees didn't get deconstructed leaving bots unable to place the entity, however I was able to place it manually without removing the
          -- tree, and shift-placing the blueprint WOULD result in the tree getting deconstructed. Changing to selection_box fixed the problem for now but I'm not ruling out
          -- the possibility it was a mistake in how the entity placement positions are calculated WRT the blueprint and the deployer positions...
          local conflictArea = createdGhost.ghost_prototype.selection_box
          local conflicts = surface.find_entities({{bpEntity.position.x + conflictArea.left_top.x, bpEntity.position.y + conflictArea.left_top.y}, {bpEntity.position.x + conflictArea.right_bottom.x, bpEntity.position.y + conflictArea.right_bottom.y}})
          for _,conflictEntity in ipairs(conflicts) do
            if conflictEntity ~= createdGhost then
              -- Ordering deconstruction for some entities throws an error and kills the game. I've observed this applying to things like background grass, asterisks (i.e. decorative entities).
              -- There doesn't seem to be a consistent way to determine what entities can or can't be mined by your robots! (The minable property didn't fix this, apparently grass is minable!)
              -- Would be nice to have a proper test for this instead of error trapping but this works for now.
              pcall(function()
                conflictEntity.order_deconstruction(deployer.force)
              end)
            end
          end
        end
      end
    end
  end
  data.deployed = true
end

function onInit()
  mod:init()
end

script.on_init(onInit)
script.on_load(onInit)
