for _, force in pairs(game.forces) do
  force.reset_recipes()
  force.reset_technologies()

  local techs = force.technologies
  local recipes = force.recipes
  if techs["automated-deployment"].researched then
    recipes["bad-anchor"].enabled = true
  end
end