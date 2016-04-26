data:extend(
{
  {
    type = "item",
    name = "blueprint-deployer",
    icon = "__recursive-blueprints__/graphics/blueprint-deployer-icon.png",
    flags = {"goes-to-quickbar"},
    subgroup = "logistic-network",
    order = "b[storage]-c[blueprint-deployer]",
    place_result = "bad-chest",
    stack_size = 50
  },
  {
    type = "item",
    name = "blueprint-anchor",
    icon = "__recursive-blueprints__/graphics/blueprint-anchor-icon.png",
    flags = {"goes-to-quickbar"},
    subgroup = "logistic-network",
    order = "b[storage]-c[bad-anchor]",
    place_result = "bad-anchor",
    stack_size = 50
  },
  {
    type = "item",
    name = "blueprint-printer",
    icon = "__recursive-blueprints__/graphics/blueprint-printer-icon.png",
    flags = {"goes-to-quickbar"},
    subgroup = "logistic-network",
    order = "b[storage]-c[bad-anchor]",
    place_result = "bad-anchor",
    stack_size = 50
  },
}
)