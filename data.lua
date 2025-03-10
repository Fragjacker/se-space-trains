-- -- Mod assertions
-- require(kr_data_compatibility_path .. "mod-assertions")
---------------------------------------------------------------------------
-- -- -- CONTENTS INITIALIZATION (data stage)
---------------------------------------------------------------------------
-- -- Adding new achievements
require("prototypes/entities-initialization")
require("vanilla-changes/vehicles-changes")

-- Check if elevated rails mod is active, then load the sloped sprites.
if mods["elevated-rails"] then
  require("__se-space-trains__.prototypes.elevated-rails.sloped-space-trains-updates").apply_all_base()
end
---------------------------------------------------------------------------
-- -- -- OPTIONAL CONTENTS INITIALIZATION (data stage)
---------------------------------------------------------------------------

---------------------------------------------------------------------------
-- -- -- COMPATIBILITY INITIALIZATION (data stage)
---------------------------------------------------------------------------
-- local scripts_path = "compatibility-scripts/data/"
-- require(scripts_path .. "aircraft")
-- require(scripts_path .. "early-electric-furnaces")
-- require(scripts_path .. "deadlock-beltboxes-loaders")
-- require(scripts_path .. "IndustrialRevolution")
-- require(scripts_path .. "Squeak_Through")
-- require(scripts_path .. "space-exploration")
---------------------------------------------------------------------------

data:extend(
{
  {
    type = "fuel-category",
    name = "electrical"
  },
  {
    type = "recipe-category",
    name = "electrical"
  }
})