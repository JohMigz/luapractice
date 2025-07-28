attackCard = {}
attackCard.__index = attackCard

function attackCard:new(
    printAttack,
    isRolledAttack
  )
  local stats = setmetatable({}, attackCard)
  
stats.printAttack = printAttack
stats.isRolledAttack =  isRolledAttack

return stats
end

--object
function attackCard:draw(x, y)
    love.graphics.newImage("attack.png")
end

