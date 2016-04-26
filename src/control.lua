require "defines"
require "lib.TickBalancer"

badChest = {}
--badChest.openChests = {}

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

function badChest:init()
  self.balancer = TickBalancer.setupForEntity("bad-chest", "badChests", 20, function(data)
    self:checkForBuild(data)
  end, function(entity)
    return {entity=entity, deployed=false}
  end)
end

function badChest:checkForBuild(data)
  if data.deployed then return end

  local chest = data.entity

  -- Check inventory of chest for blueprint
  local chestInventory = chest.get_inventory(defines.inventory.chest)
  local chestItemStack = chestInventory[1]

  if not chestItemStack.valid_for_read then return end

  local player = game.players[1]

  if chestItemStack.name ~= "blueprint" then
    player.print("BAD chest must contain blueprint")  
    return
  end

  local bpEntities = chestItemStack.get_blueprint_entities()
  local anchorEntity = nil
  for _,bpEntity in pairs(bpEntities) do
    if (bpEntity.name == "bad-anchor") then
      if anchorEntity then
        player.print("Multiple BAD Anchors in blueprint, only one is permitted")
        return
      end
      anchorEntity = bpEntity
    end
  end
  if not anchorEntity then
    player.print("Cannot deploy blueprint, does not contain a BAD Anchor")
    return
  end
  -- Now the offset position is known, place the blueprint
  local surface = chest.surface
  for _,bpEntity in pairs(bpEntities) do
    -- Anchor is never placed as it would conflict with the chest
    if (bpEntity.name ~= "blueprint-anchor") then
      bpEntity.position = {x= bpEntity.position.x - anchorEntity.position.x + chest.position.x, y= bpEntity.position.y - anchorEntity.position.y + chest.position.y}
      bpEntity.force = chest.force
      if surface.can_place_entity(bpEntity) then
        bpEntity.inner_name = bpEntity.name
        bpEntity.name = "entity-ghost"
        surface.create_entity(bpEntity)
      end
    end
  end
  data.deployed = true
end

function onInit()
  badChest:init()
end

function onDeployerTick(data)
end

function onPrinterTick(data)
  if entity.recipe.name == 
end

script.on_init(onInit)
script.on_load(onInit)
