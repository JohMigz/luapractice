--rectangle 1

summonBoard = {}
summonBoard.__index = summonBoard

--constructor
function summonBoard:new(
    x,
    y,
    w,
    h,
    --boolean
    playerHandCheck,
    fillColor,
    image,
    rolledAttack,
    rolledGuard,
    isClicked
  )
  local stats = setmetatable({}, summonBoard)
  stats.x = x
  stats.y = y
  stats.w = w
  stats.h = h
  stats.playerHandCheck = playerHandCheck
  stats.fillColor =  fillColor
  stats.image =  image
  stats.rolledAttack =  rolledAttack
  stats.rolledGuard = rolledGuard
  stats.isClicked = isClicked


  return stats
end

--method
function summonBoard:draw()
    love.graphics.rectangle("line", self.x, self.y, self.w, self.h)
    if self.rolledAttack then
      love.graphics.draw(attackImage, self.x, self.y)
    end
    if self.rolledGuard then
      love.graphics.draw(guardImage, self.x, self.y)
      end
end

function summonBoard:isMouseInside(x, y)
    return x >= self.x and x <= self.x + self.w and y >= self.y and y <= self.y + self.h
end

