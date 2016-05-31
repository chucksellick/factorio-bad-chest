data:extend({
  {
    type = "smart-container",
    name = "blueprint-deployer",
    icon = "__recursive-blueprints__/graphics/blueprint-deployer-icon.png",
    flags = {"placeable-player", "player-creation"},
    minable = {hardness = 0.2, mining_time = 0.5, result = "blueprint-deployer"},
    max_health = 150,
    corpse = "small-remnants",
    collision_box = {{-0.35, -0.35}, {0.35, 0.35}},
    selection_box = {{-0.5, -0.5}, {0.5, 0.5}},
    fast_replaceable_group = "container",
    inventory_size = 1,
    open_sound = { filename = "__base__/sound/metallic-chest-open.ogg", volume=0.65 },
    close_sound = { filename = "__base__/sound/metallic-chest-close.ogg", volume = 0.7 },
    picture =
    {
      filename = "__recursive-blueprints__/graphics/blueprint-deployer-entity.png",
      priority = "extra-high",
      width = 39,
      height = 47,
      frame_count = 8,
      animation_speed = 0.5,
      shift = {0.1, -0.23}
    },
    circuit_wire_max_distance = 7.5
  },
  {
    type = "smart-container",
    name = "blueprint-destructive-deployer",
    icon = "__recursive-blueprints__/graphics/blueprint-deployer-icon.png",
    flags = {"placeable-player", "player-creation"},
    minable = {hardness = 0.2, mining_time = 0.5, result = "blueprint-destructive-deployer"},
    max_health = 150,
    corpse = "small-remnants",
    collision_box = {{-0.35, -0.35}, {0.35, 0.35}},
    selection_box = {{-0.5, -0.5}, {0.5, 0.5}},
    fast_replaceable_group = "container",
    inventory_size = 1,
    open_sound = { filename = "__base__/sound/metallic-chest-open.ogg", volume=0.65 },
    close_sound = { filename = "__base__/sound/metallic-chest-close.ogg", volume = 0.7 },
    picture =
    {
      filename = "__recursive-blueprints__/graphics/blueprint-deployer-entity.png",
      priority = "extra-high",
      width = 39,
      height = 47,
      frame_count = 8,
      animation_speed = 0.5,
      shift = {0.1, -0.23}
    },
    circuit_wire_max_distance = 7.5
  },
  {
    type = "simple-entity",
    name = "blueprint-anchor",
    icon = "__recursive-blueprints__/graphics/blueprint-anchor-icon.png",
    flags = {"placeable-player", "player-creation"},
    minable = {hardness = 0.2, mining_time = 0.5, result = "blueprint-anchor"},
    max_health = 150,
    corpse = "small-remnants",
    collision_box = {{-0.35, -0.35}, {0.35, 0.35}},
    selection_box = {{-0.5, -0.5}, {0.5, 0.5}},
    fast_replaceable_group = "container",
    inventory_size = 1,
    open_sound = { filename = "__base__/sound/metallic-chest-open.ogg", volume=0.65 },
    close_sound = { filename = "__base__/sound/metallic-chest-close.ogg", volume = 0.7 },
    render_layer = "object",
    picture =
    {
      filename = "__base__/graphics/entity/basic-beacon/basic-beacon-antenna.png",
      width = 54,
      height = 50,
      line_length = 8,
      frame_count = 32,
      shift = {0, 0},
      scale = 0.6,
      animation_speed = 0.5
    }
  },
  {
    type = "assembling-machine",
    name = "blueprint-printer",
    icon = "__base__/graphics/icons/assembling-machine-2.png",
    flags = {"placeable-neutral", "placeable-player", "player-creation"},
    minable = {hardness = 0.2, mining_time = 0.5, result = "blueprint-printer"},
    max_health = 250,
    corpse = "small-remnants",
    dying_explosion = "medium-explosion",
    resistances =
    {
      {
        type = "fire",
        percent = 70
      }
    },
    --[[fluid_boxes =
    {
      {
        production_type = "input",
        pipe_picture = assembler2pipepictures(),
        pipe_covers = pipecoverspictures(),
        base_area = 10,
        base_level = -1,
        pipe_connections = {{ type="input", position = {0, -2} }}
      },
      {
        production_type = "output",
        pipe_picture = assembler2pipepictures(),
        pipe_covers = pipecoverspictures(),
        base_area = 10,
        base_level = 1,
        pipe_connections = {{ type="output", position = {0, 2} }}
      },
      off_when_no_fluid_recipe = true
    },]]--
    collision_box = {{-0.35, -0.35}, {0.35, 0.35}},
    selection_box = {{-0.5, -0.5}, {0.5, 0.5}},
    fast_replaceable_group = "blueprint-deployer",
    animation =
    {
      filename = "__base__/graphics/entity/assembling-machine-2/assembling-machine-2.png",
      priority = "high",
      width = 113,
      height = 99,
      frame_count = 32,
      line_length = 8,
      shift = {0.4, -0.06},
      scale = 0.33
    },
    open_sound = { filename = "__base__/sound/machine-open.ogg", volume = 0.85 },
    close_sound = { filename = "__base__/sound/machine-close.ogg", volume = 0.75 },
    vehicle_impact_sound =  { filename = "__base__/sound/car-metal-impact.ogg", volume = 0.65 },
    working_sound =
    {
      sound = {
        {
          filename = "__base__/sound/assembling-machine-t2-1.ogg",
          volume = 0.8
        },
        {
          filename = "__base__/sound/assembling-machine-t2-2.ogg",
          volume = 0.8
        },
      },
      idle_sound = { filename = "__base__/sound/idle1.ogg", volume = 0.6 },
      apparent_volume = 1.5,
    },
    crafting_categories = {"blueprints"},
    crafting_speed = 0.75,
    energy_source =
    {
      type = "electric",
      usage_priority = "secondary-input",
      emissions = 0.04 / 2.5
    },
    energy_usage = "150kW",
    ingredient_count = 4,
    module_specification =
    {
      module_slots = 2
    },
    allowed_effects = {"consumption", "speed", "productivity", "pollution"}
  },
}
)
