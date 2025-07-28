guardCard = {}
guardCard.__index = guardCard

function guardCard:new(
    printGuard,
    isRolledGuard
  )
  local stats = setmetatable({}, guardCard)
  
stats.printGuard = printGuard
stats.isRolledGuard = isRolledGuard


return stats
end

--object
function guardCard:draw(x, y)
    love.graphics.print(self.printGuard, x, y)
end

