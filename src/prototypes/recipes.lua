data:extend(
{
  {
    type = "recipe",
    name = "blueprint-deployer",
    enabled = false,
    ingredients =
    {
      {"smart-chest", 1},
      {"electronic-circuit", 1}
    },
    result = "blueprint-deployer"
  },
  {
    type = "recipe",
    name = "blueprint-destructive-deployer",
    enabled = false,
    ingredients =
    {
      {"smart-chest", 1},
      {"electronic-circuit", 1},
      {"deconstruction-planner", 1}
    },
    result = "blueprint-destructive-deployer"
  },
  {
    type = "recipe",
    name = "blueprint-anchor",
    enabled = false,
    ingredients =
    {
      {"iron-stick", 2},
      {"iron-plate", 2},
      {"electronic-circuit", 1}
    },
    result = "blueprint-anchor"
  },
  --[[
  {
    type = "recipe",
    name = "blueprint-printer",
    enabled = false,
    ingredients =
    {
      {"advanced-circuit", 1},
      {"electronic-circuit", 2},
      {"iron-gear-wheel", 3},
      {"iron-plate", 5}
    },
    result = "blueprint-printer"
  },
  {
    type = "recipe",
    name = "clone-blueprint",
    enabled = false,
    energy_required = 1,
    category = "blueprints",
    ingredients =
    {
      {"electronic-circuit", 2},
      {"advanced-circuit", 1},
    },
    result = "blueprint",
    result_count = 2,
    icon = "__recursive-blueprints__/graphics/clone-blueprint-icon.png",
  },
  {
    type = "recipe",
    name = "wipe-blueprint",
    enabled = false,
    energy_required = 1,
    category = "blueprints",
    ingredients =
    {
      {"advanced-circuit", 1},
      {"electronic-circuit", 1},
    },
    result = "blueprint",
    icon = "__recursive-blueprints__/graphics/wipe-blueprint-icon.png",
  },--]]
}
)