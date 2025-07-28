activateButton = {}
activateButton.__index = activateButton

--constructor
function activateButton:new(
    acbtnx,
    acbtny,
    acbtnWidth,
    acbtnHeight,
    acbtnText,
    acbtnColor,
    acbtnhoverColor,
    acbtnisHovered
  )
  
  -- set metatable
  local stats = setmetatable({}, activateButton)
    stats.acbtnx =  acbtnx
    stats.acbtny = acbtny
    stats.acbtnWidth = acbtnWidth
    stats.acbtnHeight = acbtnHeight
    stats.acbtnText = acbtnText
    stats.acbtnColor = acbtnColor or {0.4, 0.8, 1}
    stats.acbtnhoverColor = acbtnhoverColor or {stats.acbtnColor[1] + 0.2, stats.acbtnColor[2] + 0.2, stats.acbtnColor[3] + 0.2}
    stats.acbtnisHovered = false
  return stats
  end
  
  --method  

  
  --is Mouse Inside
  function activateButton:isMouseInside(mx, my)
    return mx > self.acbtnx and mx < self.acbtnx + self.acbtnWidth and
           my > self.acbtny and my < self.acbtny + self.acbtnHeight
end
  
  --button update
function activateButton:update()
    local mx, my = love.mouse.getPosition()
    self.acbtnisHovered = self:isMouseInside(mx, my)
end
  
  
  --draw button
function activateButton:drawButton()
    -- Save current color
    local r, g, b, a = love.graphics.getColor()

    -- Set color based on hover
    if self.acbtnisHovered then
        love.graphics.setColor(self.acbtnhoverColor)
    else
        love.graphics.setColor(self.acbtnColor)
    end
    
    love.graphics.rectangle("fill", self.acbtnx, self.acbtny, self.acbtnWidth, self.acbtnHeight)

    love.graphics.setColor(1, 1, 1)
    love.graphics.printf(self.acbtnText, self.acbtnx, self.acbtny + (self.acbtnHeight / 4), self.acbtnWidth, "center")
    
    -- Restore previous color
    love.graphics.setColor(r, g, b, a)
    
  end