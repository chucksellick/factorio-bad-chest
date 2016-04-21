require "defines"

badChest = {}
badChest.openChests = {}

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

function badChest.chestDataFor(self, entity)
  global.badChestData = global.badChestData or {}
  for _,data in pairs(global.badChestData) do
    if entity == data.entity then
      return data
    end
  end
  -- Create new data since it didn't exist already
  local data = {entity=entity, x=0, y=0, rotate=0}
  table.insert(global.badChestData, data)
  return data
end

function badChest.openGuiFor(self, player_index, chest)
  if self.openChests[player_index] == chest then
    return
  end
  if self.openChests[player_index] ~= nil then
    self:closeGui(player_index)
  end

  local player_gui = game.players[player_index].gui.top

  local guiRoot = player_gui.add({type="frame", name="badChestGui", direction="vertical", style = "machine_frame_style"})
  local chestData = self.chestDataFor(self.openChests[player_index])
  guiRoot.add({ type="label", name="badChestTitle", caption="BAD Chest"})
  local guiFlow = guiRoot.add({ type="flow", name="buttonsFlow", direction="horizontal"})
  guiFlow.add({type="button", name="badChestMoveLeft", caption="<"})
  guiFlow.add({type="button", name="badChestMoveRight", caption=">"})
  guiFlow.add({type="label", name="badChestXLabel", caption=chestData.x})
  guiFlow.add({type="button", name="badChestMoveUp", caption="^"})
  guiFlow.add({type="button", name="badChestMoveDown", caption="v"})
  guiFlow.add({type="label", name="badChestYLabel", caption=chestData.y})
  guiFlow.add({type="button", name="badChestRotate", caption="R"})
  guiFlow.add({type="label", name="badChestRLabel", caption=chestData.rotate})
  self.openChests[player_index] = chest
end

function badChest.guiClicked(self, player_index, elementName)
  if not self.openChests[player_index] then
    return
  end

  local chestData = self.chestDataFor(self.openChests[player_index])
  if elementName == "badChestMoveUp" then chestData.y = chestData.y - 1
  elseif elementName == "badChestMoveDown" then chestData.y = chestData.y + 1
  elseif elementName == "badChestMoveLeft" then chestData.x = chestData.x - 1
  elseif elementName == "badChestMoveRight" then chestData.x = chestData.x + 1
  elseif elementName == "badChestRotate" then chestData.rotate = (chestData.rotate + 1) % 4
  end

  self:updateGui(player_index)
end

function badChest.updateGui(self, player_index)
  local chestData = self.chestDataFor(self.openChests[player_index])
  local guiRoot = game.players[player_index].gui.top.badChestGui

  guiRoot.buttonsFlow.badChestXLabel.caption = chestData.x;
  guiRoot.buttonsFlow.badChestYLabel.caption = chestData.y;
  guiRoot.buttonsFlow.badChestRLabel.caption = chestData.rotate;
end

function badChest.closeGui(self, player_index)
  if not self.openChests[player_index] then
    return
  end
  local guiRoot = game.players[player_index].gui.top.badChestGui
  guiRoot.destroy()
  self.openChests[player_index] = nil
end

function badChest.renderPreview(self, player_index)
  local chest = self.openChests[player_index]
  if not chest then return end

  -- Check inventory of chest for blueprint
  local chestInventory = chest.get_inventory(defines.inventory.chest)
  local chestItemStack = chestInventory[1]

  if not chestItemStack.valid_for_read then return end

  local player = game.players[player_index]

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
    if (bpEntity.name ~= "bad-anchor") then
      bpEntity.inner_name = bpEntity.name
      bpEntity.name = "entity-ghost"
      bpEntity.position = {x= bpEntity.position.x - anchorEntity.position.x + chest.position.x, y= bpEntity.position.y - anchorEntity.position.y + chest.position.y}
      bpEntity.force = chest.force
      surface.create_entity(bpEntity)
    end
  end
  player.print("Blueprint deployed")
end

script.on_event(defines.events.on_tick, function(event)
  if event.tick % 20 ~= 0 then return end
  for i,player in pairs(game.players) do
    if player.character then
      if player.opened and player.opened.name == 'bad-chest' then
        badChest:openGuiFor(i, player.opened)
        badChest:renderPreview(i)
      else
        badChest:closeGui(i)
      end
    end
  end
end)

script.on_event(defines.events.on_gui_click, function(event)
  badChest:guiClicked(event.player_index, event.element.name)
end)