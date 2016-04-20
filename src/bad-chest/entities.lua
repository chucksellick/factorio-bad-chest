data:extend({
  {
    type = "logistic-container",
    name = "bad-chest",
    icon = "__bad-chest__/bad-chest/graphics/bad-chest-icon.png",
    flags = {"placeable-player", "player-creation"},
    minable = {hardness = 0.2, mining_time = 0.5, result = "bad-chest"},
    max_health = 150,
    corpse = "small-remnants",
    collision_box = {{-0.35, -0.35}, {0.35, 0.35}},
    selection_box = {{-0.5, -0.5}, {0.5, 0.5}},
    fast_replaceable_group = "container",
    inventory_size = 128,
    logistic_mode = "requester",
    open_sound = { filename = "__base__/sound/metallic-chest-open.ogg", volume=0.65 },
    close_sound = { filename = "__base__/sound/metallic-chest-close.ogg", volume = 0.7 },
    picture =
    {
      filename = "__bad-chest__/bad-chest/graphics/bad-chest-entity.png",
      priority = "extra-high",
      width = 39,
      height = 47,
      frame_count = 8,
      shift = {0.1, 0}
    },
    circuit_wire_max_distance = 7.5
  }
},
{
  {
    type = "logistic-container",
    name = "bad-chest-requester-proxy",
    icon = "__bad-chest__/bad-chest/graphics/bad-chest-icon.png",
    flags = {"placeable-off-grid"},
    minable = {hardness = 0.2, mining_time = 0.5, result = "bad-chest"},
    max_health = 150,
    corpse = "small-remnants",
    collision_box = {{-0.35, -0.35}, {0.35, 0.35}},
    selection_box = {{-0.5, -0.5}, {0.5, 0.5}},
    inventory_size = 128,
    logistic_mode = "requester",
    open_sound = { filename = "__base__/sound/metallic-chest-open.ogg", volume=0.65 },
    close_sound = { filename = "__base__/sound/metallic-chest-close.ogg", volume = 0.7 },
    picture =
    {
      filename = "__bad-chest__/bad-chest/graphics/bad-chest-entity.png",
      priority = "extra-high",
      width = 39,
      height = 47,
      frame_count = 8,
      shift = {0.1, 0}
    },
    circuit_wire_max_distance = 7.5
  }
}
)
