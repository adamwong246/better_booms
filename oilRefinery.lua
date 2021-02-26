local explosion = table.deepcopy(data.raw["explosion"]["oil-refinery-explosion"])
-- table.insert(explosion.created_effect.action_delivery.target_effects, flame)
explosion.created_effect =
{
  type = "direct",
  action_delivery =
  {{
        type = "stream",
        stream = "tank-flamethrower-fire-stream",
        -- source_offset = {0.15, -0.5}
  }, {
    type = "instant",
    target_effects =
    {
      {
        type = "create-particle",
        repeat_count = 10,
        probability = 1,
        particle_name = "oil-refinery-metal-particle-big",
        offsets =
        {
          { 0.7734, -0.6484 },
          { -0.7266, 0.5859 }
        },
        offset_deviation = { { -0.6875, -0.6875 }, { 0.6875, 0.6875 } },
        initial_height = 0.8,
        initial_height_deviation = 0.49,
        initial_vertical_speed = 0.088,
        initial_vertical_speed_deviation = 0.05,
        speed_from_center = 0.03,
        speed_from_center_deviation = 0.05
      }
    }
  }}
}

data:extend{explosion}