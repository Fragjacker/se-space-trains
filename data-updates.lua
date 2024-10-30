------------------------------------------
-- Startup Settings handling happens here.
------------------------------------------
if settings.startup["space-locomotive-speed-setting"].value == "238 km/h (Vanilla)" then
  data.raw["locomotive"]["space-locomotive"].max_speed = 1.1
  data.raw["cargo-wagon"]["space-cargo-wagon"].max_speed = 1.1
  data.raw["fluid-wagon"]["space-fluid-wagon"].max_speed = 1.1
elseif settings.startup["space-locomotive-speed-setting"].value == "378 km/h" then
  data.raw["locomotive"]["space-locomotive"].max_speed = 1.75
  data.raw["cargo-wagon"]["space-cargo-wagon"].max_speed = 1.75
  data.raw["fluid-wagon"]["space-fluid-wagon"].max_speed = 1.75
end
if settings.startup["space-cargo-wagon-capacity-setting"].value == "40 Slots (Vanilla)" then
  data.raw["cargo-wagon"]["space-cargo-wagon"].inventory_size = 40
elseif settings.startup["space-cargo-wagon-capacity-setting"].value == "120 Slots (Extended)" then
  data.raw["cargo-wagon"]["space-cargo-wagon"].inventory_size = 120
end
if settings.startup["space-fluid-wagon-capacity-setting"].value == "50.000 (Vanilla)" then
  data.raw["fluid-wagon"]["space-fluid-wagon"].capacity = 50000
end
if settings.startup["space-battery-pack-energy-density-setting"].value == "100 MJ" then
  data.raw["assembling-machine"]["space-train-battery-charging-station"].energy_usage = "3.3MW"
  data.raw["item"]["space-train-battery-pack"].fuel_value = "100MJ"
end
if settings.startup["space-battery-decay-enable-setting"].value then
  data:extend({{
    type = "item",
    name = "space-train-destroyed-battery-pack",
    icon = "__se-space-trains__/graphics/icons/destroyed-battery.png",
    icon_size = 128,
    pictures = {
      layers = {{
        size = 128,
        filename = "__se-space-trains__/graphics/icons/destroyed-battery.png",
        scale = 0.125
      }, {
        draw_as_light = true,
        flags = {"light"},
        size = 128,
        filename = "__se-space-trains__/graphics/icons/destroyed-battery_light.png",
        scale = 0.125
      }}
    },
    burnt_result = "space-train-discharged-battery-pack",
    subgroup = "intermediate-product",
    order = "s-a[destroyed-battery-pack]",
    stack_size = 60
  }, {
    type = "recipe",
    name = "space-train-battery-pack-refurbish",
    energy_required = 10,
    enabled = false,
    category = "chemistry",
    ingredients = {
      {type="item", name="space-train-destroyed-battery-pack", amount=1},
      {type="fluid", name="sulfuric-acid", amount=20},
    },
    icon = "__se-space-trains__/graphics/icons/destroyed-battery.png",
    icon_size = 128,
    allow_as_intermediate = false,
    localised_name = {"recipe-name.space-train-battery-pack-refurbish-desc"},
    results = {{type="item", name="space-train-discharged-battery-pack", amount=1}},
  }})
else
  data.raw["recipe"]["space-train-battery-pack-recharge"].results = {{
    type = "item",
    name = "space-train-battery-pack",
    amount = 1
  }}
end
------------------------------------------
-- Handling Mod cases happens here
------------------------------------------
-- ---------------------------------------------------------------------------------------------- --
--                                           KRASTORIO 2                                          --
-- ---------------------------------------------------------------------------------------------- --
if mods["Krastorio2"] then
  data.raw["locomotive"]["space-locomotive"].equipment_grid = "kr-locomotive-grid"
  data.raw["cargo-wagon"]["space-cargo-wagon"].equipment_grid = "kr-wagons-grid"
  data.raw["fluid-wagon"]["space-fluid-wagon"].equipment_grid = "kr-wagons-grid"

  data.raw["cargo-wagon"]["space-cargo-wagon"].allow_robot_dispatch_in_automatic_mode = true
  data.raw["fluid-wagon"]["space-fluid-wagon"].allow_robot_dispatch_in_automatic_mode = true

  data.raw["recipe"]["space-locomotive"].ingredients =
    {{type="item", name="locomotive", amount=1},
    {type="item", name="processing-unit", amount=20},
    {type="item", name="electronic-components", amount=20},
    {type="item", name="steel-gear-wheel", amount=20},
    {type="item", name="rare-metals", amount=80}}
  table.insert(data.raw["recipe"]["space-cargo-wagon"].ingredients, {type="item", name="steel-gear-wheel", amount=20})
  table.insert(data.raw["recipe"]["space-fluid-wagon"].ingredients, {type="item", name="steel-gear-wheel", amount=20})
  table.insert(data.raw["recipe"]["space-train-battery-pack"].ingredients, {type="item", name="lithium-sulfur-battery", amount=10})
  if settings.startup["space-battery-decay-enable-setting"].value then
    table.insert(data.raw["recipe"]["space-train-battery-pack-refurbish"].ingredients, {type="item", name="lithium-sulfur-battery", amount=5})
  end
else
  if settings.startup["space-battery-decay-enable-setting"].value then
    table.insert(data.raw["recipe"]["space-train-battery-pack-refurbish"].ingredients, {type="item", name="battery", amount=10})
  end
end

-- ---------------------------------------------------------------------------------------------- --
--                                        SPACE EXPLORATION                                       --
-- ---------------------------------------------------------------------------------------------- --
if mods["space-exploration"] then
  table.insert(data.raw["technology"]["se-space-rail"].effects, {
    type = "unlock-recipe",
    recipe = "space-locomotive"
  })
  table.insert(data.raw["technology"]["se-space-rail"].effects, {
    type = "unlock-recipe",
    recipe = "space-fluid-wagon"
  })
  table.insert(data.raw["technology"]["se-space-rail"].effects, {
    type = "unlock-recipe",
    recipe = "space-cargo-wagon"
  })
  table.insert(data.raw["technology"]["se-space-rail"].effects, {
    type = "unlock-recipe",
    recipe = "space-train-battery-charging-station"
  })
  table.insert(data.raw["technology"]["se-space-rail"].effects, {
    type = "unlock-recipe",
    recipe = "space-train-battery-pack"
  })
  table.insert(data.raw["technology"]["se-space-rail"].effects, {
    type = "unlock-recipe",
    recipe = "space-train-battery-pack-recharge"
  })

  -- Handle Battery decay in Space Exploration.
  if settings.startup["space-battery-decay-enable-setting"].value then
    table.insert(data.raw["technology"]["se-space-rail"].effects, {
      type = "unlock-recipe",
      recipe = "space-train-battery-pack-refurbish"
    })
    data.raw["recipe"]["space-train-battery-pack-refurbish"].category = "hard-recycling"

    -- Check for the installed version of Space Exploration and handle it.
    old_version = util.split(mods["space-exploration"], ".")
    if tonumber(old_version[2]) <= 5 then -- Check if this is pre v0.6.0 SE
      data.raw["recipe"]["space-train-battery-pack-refurbish"].subgroup = "space-recycling"
    else
      data.raw["recipe"]["space-train-battery-pack-refurbish"].subgroup = "recycling"
    end
  end

  -- Add new prerequisites to the Space Train Tech to reflect the newly required ingredients.
  table.insert(data.raw["technology"]["se-space-rail"].prerequisites, "se-heat-shielding")
  table.insert(data.raw["technology"]["se-space-rail"].prerequisites, "steel-processing")
  table.insert(data.raw["technology"]["se-space-rail"].prerequisites, "processing-unit")
  -- Add new prerequisites to the Space Train Tech if Krastorio 2 is used.
  if mods["Krastorio2"] then
    table.insert(data.raw["technology"]["se-space-rail"].prerequisites, "advanced-electronics")
    table.insert(data.raw["technology"]["se-space-rail"].prerequisites, "kr-lithium-sulfur-battery")
  end

  -- Change recipes accordingly when space exploration mods are installed and used.
  table.insert(data.raw["recipe"]["space-locomotive"].ingredients, {type="item", name="se-heat-shielding", amount=20})
  table.insert(data.raw["recipe"]["space-cargo-wagon"].ingredients, {type="item", name="se-heat-shielding", amount=20})
  table.insert(data.raw["recipe"]["space-fluid-wagon"].ingredients, {type="item", name="se-heat-shielding", amount=20})
  table.insert(data.raw["recipe"]["space-train-battery-charging-station"].ingredients, {type="item", name="se-heat-shielding", amount=20})

  data.raw["assembling-machine"]["space-train-battery-charging-station"].se_allow_in_space = true

  if mods["space-exploration"] and not mods["Krastorio2"] then
    table.insert(data.raw["recipe"]["space-locomotive"].ingredients, {type="item", name="steel-plate", amount=20})
    table.insert(data.raw["recipe"]["space-cargo-wagon"].ingredients, {type="item", name="steel-plate", amount=20})
    table.insert(data.raw["recipe"]["space-fluid-wagon"].ingredients, {type="item", name="steel-plate", amount=20})
  end
-- ---------------------------------------------------------------------------------------------- --
--                                             VANILLA                                            --
-- ---------------------------------------------------------------------------------------------- --
else
  -- Handle adding a new tech for Space Trains if Space Exploration is not used.
  table.insert(data.raw["recipe"]["space-locomotive"].ingredients, {type="item", name="steel-plate", amount=20})
  table.insert(data.raw["recipe"]["space-cargo-wagon"].ingredients, {type="item", name="steel-plate", amount=20})
  table.insert(data.raw["recipe"]["space-fluid-wagon"].ingredients, {type="item", name="steel-plate", amount=20})

  data:extend({ -- TECHNOMANS
  {
    type = "technology",
    name = "tech-space-trains",
    mod = "space-trains",
    icon = "__se-space-trains__/graphics/icons/space-trains-tech.png",
    icon_size = 256,
    icon_mipmaps = 4,
    effects = {{
      type = "unlock-recipe",
      recipe = "space-locomotive"
    }, {
      type = "unlock-recipe",
      recipe = "space-fluid-wagon"
    }, {
      type = "unlock-recipe",
      recipe = "space-cargo-wagon"
    }, {
      type = "unlock-recipe",
      recipe = "space-train-battery-charging-station"
    }, {
      type = "unlock-recipe",
      recipe = "space-train-battery-pack"
    }, {
      type = "unlock-recipe",
      recipe = "space-train-battery-pack-recharge"
    }},
    prerequisites = {"steel-processing", "processing-unit", "battery", "railway", "production-science-pack"},
    unit = {
      count = 500,
      ingredients = {
      {"automation-science-pack", 1},
      {"logistic-science-pack", 11},
      {"chemical-science-pack", 11},
      {"production-science-pack", 11}
    },
      time = 60
    }
  }
})
  if settings.startup["space-battery-decay-enable-setting"].value then
    table.insert(data.raw["technology"]["tech-space-trains"].effects, {
      type = "unlock-recipe",
      recipe = "space-train-battery-pack-refurbish"
    })
  end
  if mods["Krastorio2"] then -- Change the technology spot to be behind Lithium-Sulfur Batteries
    table.insert(data.raw["technology"]["tech-space-trains"].prerequisites, "advanced-electronics")
    table.insert(data.raw["technology"]["tech-space-trains"].prerequisites, "kr-lithium-sulfur-battery")
  end
end
