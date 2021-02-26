table.filter = function(t, filterIter)
    local out = {}
  
    for k, v in pairs(t) do
      if filterIter(v, k, t) then out[k] = v end
    end
  
    return out
end



-- log(serpent.block(data.raw['explosion']["assembling-machine-1-explosion"].created_effect.action_delivery.target_effects))



-- log(serpent.block(data.raw['explosion']["assembling-machine-1-explosion"].created_effect.action_delivery.target_effects))
require "basicFire"

-- require "extraFire"
-- require "laserTurret"

-- require "oilRefinery"