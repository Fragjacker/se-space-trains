local item_sounds = require("__base__.prototypes.item_sounds")
data:extend({{
  type = "item-with-entity-data",
  name = "space-locomotive",
  icon = "__se-space-trains__/graphics/icons/space-locomotive.png",
  icon_size = 64,
  subgroup = "train-transport",
  order = "a[train-system]-f[locomotive]",
  place_result = "space-locomotive",
  stack_size = 5,
  inventory_move_sound = item_sounds.locomotive_inventory_move,
  pick_sound = item_sounds.locomotive_inventory_pickup,
  drop_sound = item_sounds.locomotive_inventory_move
}, {
  type = "item-with-entity-data",
  name = "space-cargo-wagon",
  icon = "__se-space-trains__/graphics/icons/space-cargo-wagon.png",
  icon_size = 64,
  icon_mipmaps = 4,
  subgroup = "train-transport",
  order = "a[train-system]-g[cargo-wagon]",
  place_result = "space-cargo-wagon",
  stack_size = 5,
  inventory_move_sound = item_sounds.metal_large_inventory_move,
  pick_sound = item_sounds.locomotive_inventory_pickup,
  drop_sound = item_sounds.metal_large_inventory_move
}, {
  type = "item-with-entity-data",
  name = "space-fluid-wagon",
  icon = "__se-space-trains__/graphics/icons/space-fluid-wagon.png",
  icon_size = 64,
  icon_mipmaps = 4,
  subgroup = "train-transport",
  order = "a[train-system]-h[fluid-wagon]",
  place_result = "space-fluid-wagon",
  stack_size = 5,
  inventory_move_sound = item_sounds.fluid_inventory_move,
  pick_sound = item_sounds.fluid_inventory_pickup,
  drop_sound = item_sounds.fluid_inventory_move
}})
