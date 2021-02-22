table.filter = function(t, filterIter)
    local out = {}
  
    for k, v in pairs(t) do
      if filterIter(v, k, t) then out[k] = v end
    end
  
    return out
end

local flambleExplosions = {
    "spark-explosion",
    "spark-explosion-higher",
    "wall-damaged-explosion",
    -- "rock-damaged-explosion",
    -- "enemy-damaged-explosion",
    "flying-robot-damaged-explosion",
    "explosion",
    "explosion-gunshot",
    "explosion-gunshot-small",

    -- "explosion-hit",
    "big-explosion",
    "medium-explosion",
    "grenade-explosion",
    "massive-explosion",
    "ground-explosion",

    -- "blood-explosion-small",
    -- "blood-explosion-big",
    -- "blood-explosion-huge",
    -- "water-splash",
    "stone-furnace-explosion",
    "wooden-chest-explosion",
    "iron-chest-explosion",
    "transport-belt-explosion",
    "underground-belt-explosion",
    "splitter-explosion",
    "burner-inserter-explosion",
    "inserter-explosion",
    "long-handed-inserter-explosion",
    "fast-inserter-explosion",
    "filter-inserter-explosion",
    "small-electric-pole-explosion",
    "medium-electric-pole-explosion",
    "big-electric-pole-explosion",
    "pipe-explosion",
    "pipe-to-ground-explosion",
    "car-explosion",
    "construction-robot-explosion",
    "lamp-explosion",
    "boiler-explosion",
    "steam-engine-explosion",
    "burner-mining-drill-explosion",
    "electric-mining-drill-explosion",
    "offshore-pump-explosion",
    "steel-furnace-explosion",
    "electric-furnace-explosion",
    "assembling-machine-1-explosion",
    "assembling-machine-2-explosion",
    "lab-explosion",
    "wall-explosion",
    "gate-explosion",
    "gun-turret-explosion",
    "radar-explosion",
    -- "small-biter-die",
    -- "small-worm-die",
    -- "biter-spawner-die",
    "fast-transport-belt-explosion",
    "steel-chest-explosion",
    "fast-underground-belt-explosion",
    "fast-splitter-explosion",
    "rail-explosion",
    "train-stop-explosion",
    "rail-signal-explosion",
    "rail-chain-signal-explosion",
    "locomotive-explosion",
    "cargo-wagon-explosion",
    "arithmetic-combinator-explosion",
    "decider-combinator-explosion",
    "constant-combinator-explosion",
    "power-switch-explosion",
    "solar-panel-explosion",
    "programmable-speaker-explosion",
    "laser-turret-explosion",
    "accumulator-explosion",
    "defender-robot-explosion",
    -- "laser-bubble",
    "big-artillery-explosion",
    "artillery-cannon-muzzle-flash",
    "active-provider-chest-explosion",
    "passive-provider-chest-explosion",
    "storage-chest-explosion",
    "buffer-chest-explosion",
    "requester-chest-explosion",
    "express-transport-belt-explosion",
    "express-underground-belt-explosion",
    "express-splitter-explosion",
    "stack-inserter-explosion",
    "stack-filter-inserter-explosion",
    "substation-explosion",
    "pump-explosion",
    "fluid-wagon-explosion",
    "artillery-wagon-explosion",
    "tank-explosion",
    "logistic-robot-explosion",
    "roboport-explosion",
    "steam-turbine-explosion",
    "nuclear-reactor-explosion",
    "spidertron-explosion",
    "nuke-explosion",
    "heat-exchanger-explosion",
    "heat-pipe-explosion",
    "pumpjack-explosion",
    "assembling-machine-3-explosion",
    "oil-refinery-explosion",
    "chemical-plant-explosion",
    "centrifuge-explosion",
    "beacon-explosion",
    "land-mine-explosion",
    "flamethrower-turret-explosion",
    "artillery-turret-explosion",
    "rocket-silo-explosion",
    "distractor-robot-explosion",
    "destroyer-robot-explosion",
    "storage-tank-explosion",
    -- "slowdown-capsule-explosion",
    -- "medium-biter-die",
    -- "big-biter-die",
    -- "behemoth-biter-die",
    -- "medium-worm-die",
    -- "big-worm-die",
    -- "behemoth-worm-die",
    -- "spitter-spawner-die",
    -- "small-spitter-die",
    -- "medium-spitter-die",
    -- "big-spitter-die",
    -- "behemoth-spitter-die",
    "uranium-cannon-shell-explosion",
    "uranium-cannon-explosion",
    "atomic-fire-smoke",
    "atomic-nuke-shockwave",
    "cluster-nuke-explosion"
}

local flame = {
    type = "create-fire",
    entity_name = "fire-flame",
    initial_ground_flame_count = 20
}

local push = {
    type = "push-back",
    distance = 20
}

for ndx, explosionName in pairs(flambleExplosions) do 
    local explosion = table.deepcopy(data.raw["explosion"][explosionName])

    if (explosion.created_effect) then 
        table.insert(explosion.created_effect.action_delivery.target_effects, flame)
        table.insert(explosion.created_effect.action_delivery.target_effects, push)
    else 

        explosion.created_effect = {
            type = "direct",
            action_delivery =
            {
              type = "instant",
              target_effects =
              {
                flame, push
              }
            }
          }

    end

    data:extend{explosion}
end 


--------

local xtraFlamableExplosions = {
    "spark-explosion-higher",
    "flying-robot-damaged-explosion",
    "stone-furnace-explosion",
    "wooden-chest-explosion",
    "iron-chest-explosion",
    "transport-belt-explosion",
    "underground-belt-explosion",
    "splitter-explosion",
    "burner-inserter-explosion",
    "inserter-explosion",
    "long-handed-inserter-explosion",
    "fast-inserter-explosion",
    "filter-inserter-explosion",
    "small-electric-pole-explosion",
    "medium-electric-pole-explosion",
    "big-electric-pole-explosion",
    "pipe-explosion",
    "pipe-to-ground-explosion",
    "car-explosion",
    "construction-robot-explosion",
    "lamp-explosion",
    "boiler-explosion",
    "steam-engine-explosion",
    "burner-mining-drill-explosion",
    "electric-mining-drill-explosion",
    "offshore-pump-explosion",
    "steel-furnace-explosion",
    "electric-furnace-explosion",
    "assembling-machine-1-explosion",
    "assembling-machine-2-explosion",
    "lab-explosion",
    "wall-explosion",
    "gate-explosion",
    "gun-turret-explosion",
    "radar-explosion",
    "fast-transport-belt-explosion",
    "steel-chest-explosion",
    "fast-underground-belt-explosion",
    "fast-splitter-explosion",
    "rail-explosion",
    "train-stop-explosion",
    "rail-signal-explosion",
    "rail-chain-signal-explosion",
    "locomotive-explosion",
    "cargo-wagon-explosion",
    "arithmetic-combinator-explosion",
    "decider-combinator-explosion",
    "constant-combinator-explosion",
    "power-switch-explosion",
    "solar-panel-explosion",
    "programmable-speaker-explosion",
    "laser-turret-explosion",
    "accumulator-explosion",
    "defender-robot-explosion",
    "big-artillery-explosion",
    -- "artillery-cannon-muzzle-flash",
    "active-provider-chest-explosion",
    "passive-provider-chest-explosion",
    "storage-chest-explosion",
    "buffer-chest-explosion",
    "requester-chest-explosion",
    "express-transport-belt-explosion",
    "express-underground-belt-explosion",
    "express-splitter-explosion",
    "stack-inserter-explosion",
    "stack-filter-inserter-explosion",
    "substation-explosion",
    "pump-explosion",
    "fluid-wagon-explosion",
    "artillery-wagon-explosion",
    "tank-explosion",
    "logistic-robot-explosion",
    "roboport-explosion",
    "steam-turbine-explosion",
    "nuclear-reactor-explosion",
    "spidertron-explosion",
    -- "nuke-explosion",
    "heat-exchanger-explosion",
    "heat-pipe-explosion",
    "pumpjack-explosion",
    "assembling-machine-3-explosion",
    "oil-refinery-explosion",
    "chemical-plant-explosion",
    "centrifuge-explosion",
    "beacon-explosion",
    "flamethrower-turret-explosion",
    "artillery-turret-explosion",
    "rocket-silo-explosion",
    "storage-tank-explosion"
}

local fireFlameMark2 = table.deepcopy(data.raw["fire"]["fire-flame"])

fireFlameMark2.name = "fire-flame-mark2"
fireFlameMark2.damage_per_tick = {amount = 13 / 10, type = "fire"}
fireFlameMark2.maximum_damage_multiplier = 200
fireFlameMark2.damage_multiplier_increase_per_added_fuel = 10
fireFlameMark2.damage_multiplier_decrease_per_tick = 0
fireFlameMark2.spawn_entity = "fire-flame-mark2"
fireFlameMark2.spread_delay = 1
fireFlameMark2.spread_delay_deviation = 3600
fireFlameMark2.maximum_spread_count = 1000
fireFlameMark2.emissions_per_second = 0.05
fireFlameMark2.initial_lifetime = 12000
fireFlameMark2.lifetime_increase_by = 15000
fireFlameMark2.lifetime_increase_cooldown = 4
fireFlameMark2.maximum_lifetime = 180000
fireFlameMark2.delay_between_initial_flames = 1
fireFlameMark2.initial_flame_count = 100

data:extend{fireFlameMark2}

local flameMark2 = {
    type = "create-fire",
    entity_name = "fire-flame-mark2",
    initial_ground_flame_count = 20
}

log(serpent.block(data.raw['explosion']["assembling-machine-1-explosion"].created_effect.action_delivery.target_effects))

for ndx, explosionName in pairs(xtraFlamableExplosions) do 
    
    local explosion = table.deepcopy(data.raw["explosion"][explosionName])
    log(explosionName)
    -- log(serpent.block(explosion))

    if (explosion.created_effect) then 
        table.insert(explosion.created_effect.action_delivery.target_effects, flameMark2)
        log(serpent.block(explosion.created_effect.action_delivery.target_effects))
    else 

        explosion.created_effect = {
            type = "direct", -- Trigger
            action_delivery =
            {
              type = "instant", --TriggerDelivery
              target_effects =
              {
                flame2
              }
            }
          }

    end

    data:extend{explosion}
end 

-- log(serpent.block(data.raw['explosion']["assembling-machine-1-explosion"].created_effect.action_delivery.target_effects))

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

-- log(explosionName)
-- log(serpent.block(explosion))

-- if (explosion.created_effect) then 
--     table.insert(explosion.created_effect.action_delivery.target_effects, flameMark2)
--     log(serpent.block(explosion.created_effect.action_delivery.target_effects))
-- else 

--     explosion.created_effect = {
--         type = "instant",
--         action_delivery =
--         {
--           type = "beam",
--           beam = "laser-beam",
--           duration = 1000
--         }
--       }

-- end

