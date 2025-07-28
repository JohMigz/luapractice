enemy = {}
enemy.__index = enemy

--constructor
function enemy:new(
    enemyImg,
    enemyHitPoints
    )
  local stats = setmetatable({}, enemy)
  -- enemy image
  stats.enemyImg = enemyImg
  -- enemy health points
  stats.enemyHitPoints = enemyHitPoints
  return stats
  end
  
  --method
  function enemy:printInfo()
    print(self.enemyHitPoints)
  end
  
  --usage
  -- enemy object
  e1 = enemy:new(
    -- image
    love.graphics.newImage("cardimages/sample2.jpg"),
    --Health points
    100)
  
  