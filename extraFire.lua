log ("EXTRA FIRE")

local xtraFlamableExplosions = {
  -- "uranium-cannon-shell-explosion",
  -- "uranium-cannon-explosion", 
  -- "atomic-fire-smoke",
  -- "atomic-nuke-shockwave",
  -- "cluster-nuke-explosion",
  "nuke-explosion"

    -- "accumulator-explosion",
    -- "active-provider-chest-explosion",
    -- "arithmetic-combinator-explosion",
    -- "artillery-turret-explosion",
    -- "artillery-wagon-explosion",
    -- "assembling-machine-1-explosion",
    -- "assembling-machine-2-explosion",
    -- "assembling-machine-3-explosion",
    -- "beacon-explosion",
    -- "big-artillery-explosion",
    -- "big-electric-pole-explosion",
    -- "boiler-explosion",
    -- "buffer-chest-explosion",
    -- "burner-inserter-explosion",
    -- "burner-mining-drill-explosion",
    -- "car-explosion",
    -- "cargo-wagon-explosion",
    -- "centrifuge-explosion",
    -- "chemical-plant-explosion",
    -- "constant-combinator-explosion",
    -- "construction-robot-explosion",
    -- "decider-combinator-explosion",
    -- "defender-robot-explosion",
    -- "electric-furnace-explosion",
    -- "electric-mining-drill-explosion",
    -- "express-splitter-explosion",
    -- "express-transport-belt-explosion",
    -- "express-underground-belt-explosion",
    -- "fast-inserter-explosion",
    -- "fast-splitter-explosion",
    -- "fast-transport-belt-explosion",
    -- "fast-underground-belt-explosion",
    -- "filter-inserter-explosion",
    -- "flamethrower-turret-explosion",
    -- "fluid-wagon-explosion",
    -- "flying-robot-damaged-explosion",
    -- "gate-explosion",
    -- "gun-turret-explosion",
    -- "heat-exchanger-explosion",
    -- "heat-pipe-explosion",
    -- "inserter-explosion",
    -- "iron-chest-explosion",
    -- "lab-explosion",
    -- "lamp-explosion",
    -- "laser-turret-explosion",
    -- "locomotive-explosion",
    -- "logistic-robot-explosion",
    -- "long-handed-inserter-explosion",
    -- "medium-electric-pole-explosion",
    -- "nuclear-reactor-explosion",
    -- "offshore-pump-explosion",
    -- "oil-refinery-explosion",
    -- "passive-provider-chest-explosion",
    -- "pipe-explosion",
    -- "pipe-to-ground-explosion",
    -- "power-switch-explosion",
    -- "programmable-speaker-explosion",
    -- "pump-explosion",
    -- "pumpjack-explosion",
    -- "radar-explosion",
    -- "rail-chain-signal-explosion",
    -- "rail-explosion",
    -- "rail-signal-explosion",
    -- "requester-chest-explosion",
    -- "roboport-explosion",
    -- "rocket-silo-explosion",
    -- "small-electric-pole-explosion",
    -- "solar-panel-explosion",
    -- "spark-explosion-higher",
    -- "spidertron-explosion",
    -- "splitter-explosion",
    -- "stack-filter-inserter-explosion",
    -- "stack-inserter-explosion",
    -- "steam-engine-explosion",
    -- "steam-turbine-explosion",
    -- "steel-chest-explosion",
    -- "steel-furnace-explosion",
    -- "stone-furnace-explosion",
    -- "storage-chest-explosion",
    -- "storage-tank-explosion",
    -- "substation-explosion",
    -- "tank-explosion",
    -- "train-stop-explosion",
    -- "transport-belt-explosion",
    -- "underground-belt-explosion",
    -- "wall-explosion",
    -- "wooden-chest-explosion"
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