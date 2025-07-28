
atkButton = {}
atkButton.__index = atkButton

--constructor
function atkButton:new(
    btnx,
    btny,
    btnWidth,
    btnHeight,
    btnText,
    btnColor,
    btnhoverColor,
    btnisHovered,
    attackDamage
  )
  
  -- set metatable
  local stats = setmetatable({}, atkButton)
    stats.btnx =  btnx
    stats.btny = btny
    stats.btnWidth = btnWidth
    stats.btnHeight = btnHeight
    stats.btnText = btnText
    stats.btnColor = btnColor or {0.4, 0.8, 1}
    stats.btnhoverColor = btnhoverColor or {stats.btnColor[1] + 0.2, stats.btnColor[2] + 0.2, stats.btnColor[3] + 0.2}
    stats.isHovered = false
    stats.attackDamage = attackDamage
  return stats
  end
  
  --method
  function atkButton:drawButton()
    local r, g, b, a = love.graphics.getColor()
    
    love.graphics.setColor(self.btnColor)
    love.graphics.rectangle(
      "fill",
      self.btnx,
      self.btny,
      self.btnWidth,
      self.btnHeight
    )
    
    -- Draw button text
    love.graphics.setColor(1, 1, 1)
    love.graphics.printf(
        self.btnText,
        self.btnx,
        self.btny + (self.btnHeight / 4),
        self.btnWidth,
        "center"
    )

    -- Restore previous color
    love.graphics.setColor(r, g, b, a)
    
  end
  
  
      --change this
    --enemy loses health on attack button
--[[function atkButton:mousePressed(x, y, button)
    if button == 1 and self:isMouseInside(x, y) then
      
        print(" Button Clicked!")
    end
end]]--

  
  --is Mouse Inside
  function atkButton:isMouseInside(mx, my)
    return mx > self.btnx and mx < self.btnx + self.btnWidth and
           my > self.btny and my < self.btny + self.btnHeight
end
  
  --button update
function atkButton:update()
    local mx, my = love.mouse.getPosition()
    self.isHovered = self:isMouseInside(mx, my)
end
  
  
  --draw button
function atkButton:drawButton()
    -- Save current color
    local r, g, b, a = love.graphics.getColor()

    -- Set color based on hover
    if self.isHovered then
        love.graphics.setColor(self.btnhoverColor)
    else
        love.graphics.setColor(self.btnColor)
    end
    
    love.graphics.rectangle("fill", self.btnx, self.btny, self.btnWidth, self.btnHeight)

    love.graphics.setColor(1, 1, 1)
    love.graphics.printf(self.btnText, self.btnx, self.btny + (self.btnHeight / 4), self.btnWidth, "center")
    
    -- Restore previous color
    love.graphics.setColor(r, g, b, a)
    
  end
  --usage
  
