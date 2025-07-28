
player = {}
player.__index = player

--constructor
function player:new(
    playerImg,
    hitPoints
    )
  local stats = setmetatable({}, player)
  -- player image
  stats.playerImg = playerImg
  -- player health points
  stats.hitPoints = hitPoints
  return stats
  end
  
  --method
  
  --usage
  p1 = player:new(
    -- image
    love.graphics.newImage("cardimages/sample1.jpg"),
    -- Hit points
    100)
  

