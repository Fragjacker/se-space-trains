local meld = require("__core__.lualib.meld")

local updates = {}

-- updates.wheels =
-- {
--   sloped = util.sprite_load("__se-space-trains__/graphics/entity/train-wheel/train-wheel-sloped",
--     {
--       priority = "very-low",
--       direction_count = 160,
--       scale = 0.5,
--       shift = util.by_pixel(0, 8),
--       usage = "train"
--     }
--   ),
--   slope_angle_between_frames = 1.25
-- }
local corrected_train_scale = train_scale * 1.07

updates.locomotive =
{
  wheels = updates.wheels,
  pictures =
  {
    slope_angle_between_frames = 1.25,
    sloped =
    {
      layers =
      {
        util.sprite_load("__se-space-trains__/graphics/entity/elevated-rails/space-locomotive/space-locomotive-sloped",
          {
            dice = 4,
            priority = "very-low",
            direction_count = 160,
            scale = corrected_train_scale,
            usage = "train"
          }
        ),
        util.sprite_load("__se-space-trains__/graphics/entity/elevated-rails/space-locomotive/space-locomotive-sloped-mask",
          {
            dice = 4,
            priority = "very-low",
            flags = { "mask" },
            apply_runtime_tint = true,
            tint_as_overlay = true,
            direction_count = 160,
            scale = corrected_train_scale,
            usage = "train"
          }
        ),
        util.sprite_load("__se-space-trains__/graphics/entity/elevated-rails/space-locomotive/space-locomotive-sloped-shadow",
          {
            dice = 4,
            priority = "very-low",
            flags = { "shadow" },
            draw_as_shadow = true,
            direction_count = 160,
            scale = corrected_train_scale,
            usage = "train"
          }
        )
      }
    }
  },
  front_light_pictures =
  {
    slope_angle_between_frames = 1.25,
    sloped =
    {
      layers =
      {
        util.sprite_load("__se-space-trains__/graphics/entity/elevated-rails/space-locomotive/space-locomotive-sloped-lights",
          {
            dice = 4,
            priority = "very-low",
            blend_mode = "additive",
            draw_as_light = true,
            direction_count = 160,
            scale = train_scale,
            usage = "train"
          }
        )
      }
    }
  },
  elevated_rail_sound =
  {
    sound =
    {
      filename = "__elevated-rails__/sound/elevated-train-driving.ogg",
      volume = 1.0,
      modifiers = {volume_multiplier("elevation", 1.0)}
    },
    match_volume_to_activity = true,
    activity_to_volume_modifiers =
    {
      multiplier = 1.5,
      offset = 1.0,
    },
    match_speed_to_activity = true,
    activity_to_speed_modifiers =
    {
      multiplier = 0.6,
      minimum = 1.0,
      maximum = 1.15,
      offset = 0.2,
    }
  },
}

-- updates.cargo_wagon =
-- {
--   wheels = updates.wheels,
--   pictures =
--   {
--     slope_angle_between_frames = 1.25,
--     slope_back_equals_front = true,
--     sloped =
--     {
--       layers =
--       {
--         util.sprite_load("__se-space-trains__/graphics/entity/cargo-wagon/cargo-wagon-sloped",
--           {
--             dice = 4,
--             priority = "very-low",
--             back_equals_front = true,
--             direction_count = 80,
--             scale = 0.5,
--             usage = "train"
--           }
--         ),
--         util.sprite_load("__se-space-trains__/graphics/entity/cargo-wagon/cargo-wagon-sloped-mask",
--           {
--             dice = 4,
--             priority = "very-low",
--             flags = { "mask" },
--             apply_runtime_tint = true,
--             tint_as_overlay = true,
--             direction_count = 80,
--             scale = 0.5,
--             usage = "train"
--           }
--         ),
--         util.sprite_load("__se-space-trains__/graphics/entity/cargo-wagon/cargo-wagon-sloped-shadow",
--           {
--             dice = 4,
--             priority = "very-low",
--             draw_as_shadow = true,
--             direction_count = 80,
--             scale = 0.5,
--             usage = "train"
--           }
--         )
--       }
--     }
--   },
-- }

-- updates.fluid_wagon =
-- {
--   wheels = updates.wheels,
--   pictures =
--   {
--     slope_angle_between_frames = 1.25,
--     slope_back_equals_front = true,
--     sloped =
--     {
--       layers =
--       {
--         util.sprite_load("__se-space-trains__/graphics/entity/fluid-wagon/fluid-wagon-sloped",
--           {
--             dice = 4,
--             priority = "very-low",
--             direction_count = 80,
--             scale = 0.5,
--             usage = "train"
--           }
--         ),
--         util.sprite_load("__se-space-trains__/graphics/entity/fluid-wagon/fluid-wagon-sloped-shadow",
--           {
--             dice = 4,
--             priority = "very-low",
--             draw_as_shadow = true,
--             direction_count = 80,
--             scale = 0.5,
--             usage = "train"
--           }
--         )
--       }
--     }
--   },
-- }

-- updates.artillery_wagon =
-- {
--   wheels = updates.wheels,
--   pictures =
--   {
--     slope_angle_between_frames = 1.25,
--     sloped =
--     {
--       layers =
--       {
--         util.sprite_load("__se-space-trains__/graphics/entity/artillery-wagon/artillery-wagon-sloped-base",
--           {
--             dice = 4,
--             priority = "very-low",
--             direction_count = 160,
--             scale = 0.5,
--             usage = "train"
--           }
--         ),
--         util.sprite_load("__se-space-trains__/graphics/entity/artillery-wagon/artillery-wagon-sloped-base-shadow",
--           {
--             dice = 4,
--             priority = "very-low",
--             draw_as_shadow = true,
--             direction_count = 160,
--             scale = 0.5,
--             usage = "train"
--           }
--         )
--       }
--     }
--   },
--   cannon_base_pictures =
--   {
--     slope_angle_between_frames = 1.25,
--     sloped =
--     {
--       layers =
--       {
--         util.sprite_load("__se-space-trains__/graphics/entity/artillery-wagon/artillery-wagon-sloped-cannon-base",
--           {
--             priority = "very-low",
--             direction_count = 160,
--             scale = 0.5,
--             usage = "train"
--           }
--         ),
--         util.sprite_load("__se-space-trains__/graphics/entity/artillery-wagon/artillery-wagon-sloped-cannon-base-shadow",
--           {
--             priority = "very-low",
--             draw_as_shadow = true,
--             direction_count = 160,
--             scale = 0.5,
--             usage = "train"
--           }
--         )
--       }
--     }
--   },
--   cannon_barrel_pictures =
--   {
--     slope_angle_between_frames = 1.25,
--     sloped =
--     {
--       layers =
--       {
--         util.sprite_load("__se-space-trains__/graphics/entity/artillery-wagon/artillery-wagon-sloped-cannon-barrel",
--           {
--             priority = "very-low",
--             direction_count = 160,
--             scale = 0.5,
--             usage = "train"
--           }
--         ),
--         util.sprite_load("__se-space-trains__/graphics/entity/artillery-wagon/artillery-wagon-sloped-cannon-barrel-shadow",
--           {
--             priority = "very-low",
--             draw_as_shadow = true,
--             direction_count = 160,
--             scale = 0.5,
--             usage = "train"
--           }
--         )
--       }
--     }
--   },
-- }

updates.apply_all_base = function()
  meld(data.raw["locomotive"]["space-locomotive"], updates.locomotive)
  -- meld(data.raw["cargo-wagon"]["cargo-wagon"], updates.cargo_wagon)
  -- meld(data.raw["fluid-wagon"]["fluid-wagon"], updates.fluid_wagon)
  -- meld(data.raw["artillery-wagon"]["artillery-wagon"], updates.artillery_wagon)
end
return updates
