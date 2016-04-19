data:extend(
{
  {
    type = "technology",
    name = "automated-deployment",
    icon = "__bad-chest__/bad-chest/graphics/bad-chest-technology.png",
    effects =
    {
      {
        type = "unlock-recipe",
        recipe = "bad-chest"
      }
    },
    prerequisites = { "logistic-system"},
    unit = {
      count = 200,
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