local explosion = table.deepcopy(data.raw["explosion"]["laser-turret-explosion"])

explosion.created_effect = {
    {
        type = "cluster",
        distance = 2,
        cluster_count = 5,
        action_delivery =
        {
            type = "beam",
            beam = "laser-beam",
            duration = 15,
            -- has no effect?
            target_effects =
            {
    
                type = "damage",
                damage = { amount = 10, type = "laser"}
    
            }
        }
    },
    {
        type = "cluster",
        distance = 10,
        cluster_count = 10,
        action_delivery =
        {
            type = "beam",
            beam = "laser-beam",
            duration = 10,
            -- has no effect?
            target_effects =
            {
    
                type = "damage",
                damage = { amount = 5, type = "laser"}
    
            }
        }
    },
    {
        type = "cluster",
        distance = 30,
        cluster_count = 15,
        action_delivery =
        {
            type = "beam",
            beam = "laser-beam",
            duration = 5,
            -- has no effect?
            target_effects =
            {
    
                type = "damage",
                damage = { amount = 1, type = "laser"}
    
            }
        }
    },

{
    type = "area",
    radius = 5,
    target_entities = true,
    action_delivery =
    {
        type = "beam",
        beam = "laser-beam",
        duration = 50,
        target_effects =
        {

            type = "damage",
            damage = { amount = 10, type = "laser"}

        }
    }
  },
  {
    type = "area",
    radius = 15,
    target_entities = true,
    action_delivery =
    {
        type = "beam",
        beam = "laser-beam",
        duration = 25,
        target_effects =
        {

            type = "damage",
            damage = { amount = 5, type = "laser"}

        }
    }
  },

{
    type = "area",
    radius = 25,
    target_entities = true,
    action_delivery =
    {
        type = "beam",
        beam = "laser-beam",
        duration = 5,
        target_effects =
        {

            type = "damage",
            damage = { amount = 1, type = "laser"}

        }
    }
  },



{
    type = "area",
    radius = 5,
    target_entities = false,
    action_delivery =
    {
        type = "beam",
        beam = "laser-beam",
        duration = 50,
        target_effects =
        {

            type = "damage",
            damage = { amount = 10, type = "laser"}

        }
    }
  },
  {
    type = "area",
    radius = 15,
    target_entities = false,
    action_delivery =
    {
        type = "beam",
        beam = "laser-beam",
        duration = 25,
        target_effects =
        {

            type = "damage",
            damage = { amount = 5, type = "laser"}

        }
    }
  },

{
    type = "area",
    radius = 25,
    target_entities = false,
    action_delivery =
    {
        type = "beam",
        beam = "laser-beam",
        duration = 5,
        target_effects =
        {

            type = "damage",
            damage = { amount = 1, type = "laser"}

        }
    }
  },

}

data:extend{explosion}