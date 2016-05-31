data:extend(
{
  {
    type = "technology",
    name = "recursive-blueprints",
    icon = "__recursive-blueprints__/graphics/recursive-blueprints-technology.png",
    icon_size = 128,
    effects =
    {
      {
        type = "unlock-recipe",
        recipe = "blueprint-deployer"
      },
      {
        type = "unlock-recipe",
        recipe = "blueprint-destructive-deployer"
      },
      {
        type = "unlock-recipe",
        recipe = "blueprint-anchor"
      },
      --[[
      {
        type = "unlock-recipe",
        recipe = "blueprint-printer"
      },
      {
        type = "unlock-recipe",
        recipe = "clone-blueprint"
      },
      ]]--
    },
    prerequisites = {"logistic-system"},
    unit = {
      count = 250,
      ingredients = {
        {"science-pack-1", 1},
        {"science-pack-2", 1},
        {"science-pack-3", 1}
      },
      time = 30
    },
    order = "c-k-d",
  },
}
)