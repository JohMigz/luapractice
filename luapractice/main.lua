require("playerClass")
require("enemyClass")
require("attackButtonClass")
require("activateButtonClass")require("summonClass")
require("guardClass")
require("attackClass")

local attackDamage = 10

------------- player side-----------------
----when activate button is pressed-----
function activateButton:mousepressed(x, y, button)
  if button == 1 and self:isMouseInside(x, y) then
    enemySummonBoard.playerHandCheck = true
    enemySummonBoard2.playerHandCheck = true
    enemySummonBoard3.playerHandCheck = true
    
    
  -------- if first summon board is attack-----
   if sb.playerHandCheck and sb.rolledAttack then 
     if not enemySummonBoard.rolledGuard then
     e1.enemyHitPoints = e1.enemyHitPoints - attackDamage
   end
 end
 
   -------if first summon board rolled guard
   -------and enemyboard rolled attack turns false
   if sb.playerHandCheck and sb.rolledGuard and enemySummonBoard.rolledAttack then 
     enemySummonBoard.rolledAttack = false
     end
  -- if button == 1 and  self:isMouseInside(x, y) then
  
------------if second summon board is attack---------------
   if sb2.playerHandCheck and sb2.rolledAttack then 
     if not enemySummonBoard.rolledGuard then
     e1.enemyHitPoints = e1.enemyHitPoints - attackDamage
   end
   end
   
-----------if second summon board is guard and enemy rolled attack-------
   if sb2.playerHandCheck and sb2.rolledGuard and enemySummonBoard2.rolledAttack then 
     enemySummonBoard2.rolledAttack = false
   end
   
-----------if third summon board is attack--------------
   if sb3.playerHandCheck and sb3.rolledAttack then 
     if not enemySummonBoard.rolledGuard then
     e1.enemyHitPoints = e1.enemyHitPoints - attackDamage
   end
   end
-----------if third summon board is guard and enemy roll attack------
   if sb3.playerHandCheck and sb3.rolledGuard and enemySummonBoard3.rolledAttack then 
     enemySummonBoard3.rolledAttack = false
   end
   
     --------------enemy side board------------------------------
   if enemySummonBoard.playerHandCheck and
      enemySummonBoard.rolledAttack then 
     p1.hitPoints = p1.hitPoints - attackDamage
   end
   ----if first summon board rolled guard and player roll attack------
   if enemySummonBoard.playerHandCheck and 
      enemySummonBoard.rolledGuard and sb.rolledAttack then 
     sb.rolledAttack = false
     end
   
------------if second summon board is attack---------------
   if enemySummonBoard2.playerHandCheck and 
      enemySummonBoard2.rolledAttack then 
     p1.hitPoints = p1.hitPoints - attackDamage
     end
   
----------if second summon board is guard and player roll attack-------
   if enemySummonBoard2.playerHandCheck and 
      enemySummonBoard2.rolledGuard and sb2.rolledAttack then 
     sb2.rolledAttack = false
     end
 -----------if third summon board is attack--------
   if enemySummonBoard3.playerHandCheck and 
      enemySummonBoard3.rolledAttack then 
     p1.hitPoints = p1.hitPoints - attackDamage
   end
-----------if third summon board is guard and player roll attack------
   if enemySummonBoard3.playerHandCheck and 
      enemySummonBoard3.rolledGuard and sb3.rolledAttack then 
     sb3.rolledAttack = false
     end

---------------reset enemy and player board after activation-------------
if   sb.playerHandCheck and
   sb2.playerHandCheck and
   sb3.playerHandCheck and
   enemySummonBoard.playerHandCheck and
   enemySummonBoard2.playerHandCheck and
   enemySummonBoard3.playerHandCheck then
     
   enemySummonBoard.playerHandCheck = false
   enemySummonBoard.rolledAttack = false
   enemySummonBoard.rolledGuard = false

   enemySummonBoard2.playerHandCheck = false
   enemySummonBoard2.rolledAttack = false
   enemySummonBoard2.rolledGuard = false

   enemySummonBoard3.playerHandCheck = false
   enemySummonBoard3.rolledAttack = false
   enemySummonBoard3.rolledGuard = false
   
   sb.playerHandCheck = false
   sb.rolledAttack = false
   sb.rolledGuard = false
   
   sb2.playerHandCheck = false
   sb2.rolledAttack = false
   sb2.rolledGuard = false

   sb3.playerHandCheck = false
   sb3.rolledAttack = false
   sb3.rolledGuard = false

 end
end
end




function summonBoard:mousePressed(x, y, button)
  if button ~= 1 then return end

  local playerHands = { playerHand, playerHand2, playerHand3 }
  local summonSlots = { sb, sb2, sb3 }

  for _, ph in ipairs(playerHands) do
    if ph:isMouseInside(x, y) and (ph.rolledAttack or ph.rolledGuard) then
      -- Assign to the first empty summon slot
      for _, slot in ipairs(summonSlots) do
        if not slot.playerHandCheck then
          slot.playerHandCheck = true
          if ph.rolledAttack then
            slot.rolledAttack = true
            slot.rolledGuard = false
          elseif ph.rolledGuard then
            slot.rolledAttack = false
            slot.rolledGuard = true
          end
          -- Optionally, mark this hand as used
          ph.rolledAttack = false
          ph.rolledGuard = false
          return -- Stop after placing into one slot
        end
      end
    end
  end
end






-- when buttons are pressed --

  --mouse pressed function
function love.mousepressed(x, y, button)
  
ae1:mousepressed(x, y, button)

playerHand:mousePressed(x, y, button)
playerHand2:mousePressed(x, y, button)
playerHand3:mousePressed(x, y, button)




  if button == 1 and deckStack:isMouseInside(x, y) then
    ---------randomIndex for player hand----------------------
    ----- first player hand slot----------
      local randomIndex = math.random(1, #cards)
    ----- second player hand slot----------
      local randomIndex2 = math.random(1, #cards)
    ----- third player hand slot----------
      local randomIndex3 = math.random(1, #cards)
      
      
------------randomIndex for enemy hand------------------------
    ----- first enemy hand slot----------
      local enemyRandomIndex = math.random(1, #cards)
    ----- second enemy hand slot----------
      local enemyRandomIndex2 = math.random(1, #cards)
    ----- third enemy hand slot----------
      local enemyRandomIndex3 = math.random(1, #cards)

      
--------------------------------------------------------
------------------------first hand slot-----------------      
      ----------attack card------------------
    if randomIndex == 1 then
     playerHand.rolledAttack = true
     playerHand.rolledGuard = false

     end
     --------------guard card------------------------
    if randomIndex == 2 then
      playerHand.rolledAttack = false
      playerHand.rolledGuard = true

    end
    
    
----------------------------------------------------------   
----------------------------------------------------------
--------------------second hand slot----------------------
    if randomIndex2 == 1 then  
     playerHand2.rolledAttack = true
     playerHand2.rolledGuard = false 

     end
     --------------guard card------------------------
    if randomIndex2 == 2  then
      playerHand2.rolledAttack = false
      playerHand2.rolledGuard = true

      end

----------------------------------------------------------   
----------------------------------------------------------
--------------------third hand slot----------------------
    if randomIndex3 == 1  then
     playerHand3.rolledAttack = true
     playerHand3.rolledGuard = false

     end
     --------------guard card------------------------
    if randomIndex3 == 2  then
      playerHand3.rolledAttack = false
      playerHand3.rolledGuard = true

      end

----------------------------enemy hand slot------------------
--------------------------------------------------------
------------------------first hand slot-----------------  

      ----------attack card------------------
    if enemyRandomIndex == 1 then
     enemySummonBoard.rolledAttack = true
     enemySummonBoard.rolledGuard = false

     end
     --------------guard card------------------------
    if enemyRandomIndex == 2 then
      enemySummonBoard.rolledAttack = false
      enemySummonBoard.rolledGuard = true
    end
    
    
----------------------------------------------------------   
----------------------------------------------------------
--------------------second hand slot----------------------
    if enemyRandomIndex2 == 1 then
     enemySummonBoard2.rolledAttack = true
     enemySummonBoard2.rolledGuard = false
     end
     --------------guard card------------------------
    if enemyRandomIndex2 == 2  then
      enemySummonBoard2.rolledAttack = false
      enemySummonBoard2.rolledGuard = true
      end

----------------------------------------------------------   
----------------------------------------------------------
--------------------third hand slot----------------------
    if enemyRandomIndex3 == 1  then
     enemySummonBoard3.rolledAttack = true
     enemySummonBoard3.rolledGuard = false
     end
     --------------guard card------------------------
    if enemyRandomIndex3 == 2  then
      enemySummonBoard3.rolledAttack = false
      enemySummonBoard3.rolledGuard = true
      end
  end
end



function love.load()
  require("summonClass")


  
  attackImage =  love.graphics.newImage("cardimages/attack.png")
  guardImage =  love.graphics.newImage("cardimages/guard.png")
  -------randomize math.random--------
  math.randomseed(os.time())
  
  -- screen
  screenImage = love.graphics.newImage("cardimages/screen2.png")
  
  ------------------------------card table--------------------------
  cards = {}
  
  
  table.insert(cards, attackCard:new(
     newImage,
      false
      ))
  table.insert(cards, guardCard:new(
      "guard",
      false
      ))
  
  --player image
  imgPlayer =  p1.playerImg
  
  --enemy image
  imgEnemy = e1.enemyImg
  
  
 -----------------OBJECTS--------------------------------------------
  

-- activate button object
 ae1 = activateButton:new(
 --acbtn x
 600,
 --acbtn y
 300,
 --acbtn Width
 100,
 --acbtn Height
 50,
 --btnText
 "Activate",
 -- color -- 
 {0.2, 0.6, 0.8}
)

--summon rectangle object 1
sb = summonBoard:new(
  --x
  250,
  --y
  250,
  --w
  70,
  --h
  100,
  --boolean--
  false,
  --color--
  {0.4, 0.8, 1},
  -- string --
  "Attack",
    ----------rolledAttack------
  false,
  ----------rolledGuard-------
  false

  )

--summon rectangle object 2
sb2 = summonBoard:new(
  --x2
  350,
  --y2
  250,
  --w2
  70,
  --h2
  100,
  --boolean--
  false,
  --color--
  {0.4, 0.8, 1},
  -- string --
  "Attack",
    ----------rolledAttack------
  false,
  ----------rolledGuard-------
  false

  )

--summon rectangle object 3
sb3 = summonBoard:new(
  --x3
  450,
  --y3
  250,
  --w3
  70,
  --h3
  100,
  --boolean--
  false,
  --color--
    {0.4, 0.8, 1},
      -- string --
  "Attack",
    ----------rolledAttack------
  false,
  ----------rolledGuard-------
  false

)



--enemy summon rectangles object 1
enemySummonBoard = summonBoard:new(
    --x
  250,
  --y
  140,
  --w
  70,
  --h
  100,
  --boolean--
  false,
  --color--
  {0.4, 0.8, 1},
  -- string --
  "Attack",
    ----------rolledAttack------
  false,
  ----------rolledGuard-------
  false

)

enemySummonBoard2 = summonBoard:new(
    --x2
  350,
  --y2
  140,
  --w2
  70,
  --h2
  100,
  --boolean--
  false,
  --color--
  {0.4, 0.8, 1},
  -- string --
  "Attack",
    ----------rolledAttack------
  false,
  ----------rolledGuard-------
  false

)

enemySummonBoard3 = summonBoard:new(
    --x2
  450,
  --y2
  140,
  --w2
  70,
  --h2
  100,
  --boolean--
  false,
  --color--
  {0.4, 0.8, 1},
  -- string --
  "Attack",
    ----------rolledAttack------
  false,
  ----------rolledGuard-------
  false

  )

--------------------------player hand----------------------------------

---first card slot
playerHand = summonBoard:new(
    --x
  200,
  --y
  450,
  --w
  70,
  --h
  100,
  --boolean--
  false,
  --color--
  {0.4, 0.8, 1},
  -- string --
  "Attack",
  ----------rolledAttack------
  false,
  ----------rolledGuard-------
  false,
  ----------iscllicked--------
  false
)


---second card slot
playerHand2 = summonBoard:new(
    --x
  290,
  --y
  450,
  --w
  70,
  --h
  100,
  --boolean--
  false,
  --color--
  {0.4, 0.8, 1},
  -- string --
  "Attack",
    ----------rolledAttack------
  false,
  ----------rolledGuard-------
  false,
    ----------iscllicked--------
  false


  )

---third card slot
playerHand3 = summonBoard:new(
    --x
  380,
  --y
  450,
  --w
  70,
  --h
  100,
  --boolean--
  false,
  --color--
  {0.4, 0.8, 1},
  -- string --
  "Attack",
    ----------rolledAttack------
  false,
  ----------rolledGuard-------
  false,
    ----------iscllicked--------
  false


  )

-- deck stack
 deckStack = activateButton:new(
 --acbtn x
 600,
 --acbtn y
 450,
 --acbtn Width
 100,
 --acbtn Height
 50,
 --btnText
 "Draw",
 -- color -- 
 {0.2, 0.6, 0.8}
)


-----------------------OBJECTS----------------------------------------
  end

function love.update(dt)
  --activate button update
  ae1:update()
  
  --deck rolling update
  deckStack:update()
    end




function love.draw()
  --screen
--love.graphics.draw(screenImage, 0, 0, 0, 1, 1)

love.graphics.draw(imgPlayer, 50, 400)
love.graphics.draw(imgEnemy, 600, 50)

--draw player health points
love.graphics.print(p1.hitPoints, 200,400)
--draw enemy health points
love.graphics.print(e1.enemyHitPoints, 550,50)

--draw activate button
ae1:drawButton()

---------------------------player board----------------------------
--draw summon board

--draw summon rectangle 1
sb:draw()

--draw summon rectangle 2
sb2:draw()

--draw summon rectangle 3
sb3:draw()

---------------------------enemy board----------------------------
--draw enemy summon rec 1
enemySummonBoard:draw()

--draw enemy summon rec 2
enemySummonBoard2:draw()

--draw enemy summon rec 3
enemySummonBoard3:draw()

-----------------------player hand----------------------------------

--draw player hand
playerHand:draw()

--draw player hand 2nd slot
playerHand2:draw()

--draw player hand 2nd slot
playerHand3:draw()

--draw from deck of cards
deckStack:drawButton()

--render screen

end

