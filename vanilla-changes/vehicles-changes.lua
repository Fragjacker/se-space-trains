---------------------
-- -- Add Space Trains
---------------------
data:extend({{
  type = "recipe",
  name = "space-locomotive",
  energy_required = 60,
  enabled = false,
  ingredients = {
    {type="item", name="locomotive", amount=1},
    {type="item", name="processing-unit", amount=20},
  },
  results = {{type="item", name="space-locomotive", amount = 1}},
}, {
  type = "recipe",
  name = "space-cargo-wagon",
  energy_required = 60,
  enabled = false,
  ingredients = {
    {type="item", name="cargo-wagon", amount=1},
    {type="item", name="processing-unit", amount=10},
  },
  results = {{type="item", name="space-cargo-wagon", amount = 1}},
}, {
  type = "recipe",
  name = "space-fluid-wagon",
  energy_required = 60,
  enabled = false,
  ingredients = {
    {type="item", name="fluid-wagon", amount=1},
    {type="item", name="processing-unit", amount=10},
  },
  results = {{type="item", name="space-fluid-wagon", amount = 1}},
}, {
  type = "recipe",
  name = "space-train-battery-charging-station",
  energy_required = 10,
  enabled = false,
  ingredients = {
    {type="item", name="steel-plate", amount=15},
    {type="item", name="processing-unit", amount=5},
    {type="item", name="copper-cable", amount=20},
  },
  results = {{type="item", name="space-train-battery-charging-station", amount = 1}},
}, {
  type = "recipe",
  name = "space-train-battery-pack",
  category = "advanced-crafting",
  energy_required = 10,
  enabled = false,
  allow_as_intermediate = false,
  ingredients = {
    {type="item", name="steel-plate", amount=2},
    {type="item", name="battery", amount=20}
  },
  localised_name = {"recipe-name.space-train-discharged-battery-pack-desc"},
  results = {{type="item", name="space-train-discharged-battery-pack", amount = 1}},
}, {
  type = "recipe",
  name = "space-train-battery-pack-recharge",
  category = "electrical",
  hidden = true,
  energy_required = 30,
  enabled = false,
  icon = "__se-space-trains__/graphics/icons/battery.png",
  icon_size = 64,
  subgroup = "intermediate-product",
  allow_as_intermediate = false,
  ingredients = {
    {type="item", name="space-train-discharged-battery-pack", amount=1},
  },
  results = {
    {
      type = "item",
      name = "space-train-destroyed-battery-pack",
      probability = 0.01,
      amount = 1
    },
    {
      type = "item",
      name = "space-train-battery-pack",
      probability = 0.99,
      amount = 1
    }
  }
}})
