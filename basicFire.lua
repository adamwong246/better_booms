local flambleExplosions = {
    "spark-explosion",
    "spark-explosion-higher",
    -- "wall-damaged-explosion",
    -- "rock-damaged-explosion",
    -- "enemy-damaged-explosion",
    "flying-robot-damaged-explosion",

    -- these explosions spawn on the player when firing a weapon
    -- "explosion",
    -- "explosion-gunshot",
    -- "explosion-gunshot-small",
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

for ndx, explosionName in pairs(flambleExplosions) do 
    local explosion = table.deepcopy(data.raw["explosion"][explosionName])

    if (explosion.created_effect) then 
        table.insert(explosion.created_effect.action_delivery.target_effects, flame)
        -- table.insert(explosion.created_effect.action_delivery.target_effects, push)
    else 

        explosion.created_effect = {
            type = "direct",
            action_delivery =
            {
              type = "instant",
              target_effects =
              {
                flame
              }
            }
          }

    end

    data:extend{explosion}
end 

