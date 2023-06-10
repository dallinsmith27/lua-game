local function elementalStoneInit(elementalStone,x,y,mod1)

  elementalStone = world:newRectangleCollider(x,y,32,46)
  elementalStone.x = x
  elementalStone.y = y
  elementalStone.elementType = mod1
  elementalStone.dead = false
  elementalStone.name = "elementalStone"


  elementalStone.Sheet = love.graphics.newImage("sprites/elementalStone.png")
  elementalStone.animations = {}
  elementalStone.animSpeed = .15

  elementalStone.image = love.graphics.newImage("sprites/elementalStone.png")
  -- elementalStone.elements = love.graphics.newImage("sprites/elementalStoneFire.png")

  elementalStone.height = 46
  elementalStone.width = 32
  elementalStone.grid = anim8.newGrid(elementalStone.width, elementalStone.height, elementalStone.Sheet:getWidth(), elementalStone.Sheet:getHeight())
  elementalStone.anim = anim8.newAnimation(elementalStone.grid('1-4', 1), elementalStone.animSpeed)

  elementalStone.Light = {}
  elementalStone.Light.animSpeed = .2
  elementalStone.Light.Sheet = love.graphics.newImage("sprites/elementalStoneLights.png")
  elementalStone.Light.height = 16
  elementalStone.Light.width = 16
  elementalStone.Light.grid = anim8.newGrid(elementalStone.Light.width, elementalStone.Light.height, elementalStone.Light.Sheet:getWidth(), elementalStone.Light.Sheet:getHeight())
  elementalStone.Light.anim = anim8.newAnimation(elementalStone.Light.grid('1-4', 1), elementalStone.Light.animSpeed)



  function elementalStone:load()

    if elementalStone.elementType == "water" then
      elementalStone.anim = anim8.newAnimation(elementalStone.grid('1-4', 1), elementalStone.animSpeed)
      elementalStone.anim:gotoFrame(1)
      elementalStone.Light.anim = anim8.newAnimation(elementalStone.Light.grid('1-4', 1), elementalStone.Light.animSpeed)
      elementalStone.Light.anim:gotoFrame(1)

    elseif elementalStone.elementType == "fire" then
      elementalStone.anim = anim8.newAnimation(elementalStone.grid('1-4', 1), elementalStone.animSpeed)
      elementalStone.anim:gotoFrame(2)
      elementalStone.Light.anim = anim8.newAnimation(elementalStone.Light.grid('1-4', 1), elementalStone.Light.animSpeed)
      elementalStone.Light.anim:gotoFrame(2)
    elseif elementalStone.elementType == "earth" then
      elementalStone.anim = anim8.newAnimation(elementalStone.grid('1-4', 1), elementalStone.animSpeed)
      elementalStone.anim:gotoFrame(3)
      elementalStone.Light.anim = anim8.newAnimation(elementalStone.Light.grid('1-4', 1), elementalStone.Light.animSpeed)
      elementalStone.Light.anim:gotoFrame(3)
    elseif elementalStone.elementType == "lightning" then
      elementalStone.anim = anim8.newAnimation(elementalStone.grid('1-4', 1), elementalStone.animSpeed)
      elementalStone.anim:gotoFrame(4)
      elementalStone.Light.anim = anim8.newAnimation(elementalStone.Light.grid('1-4', 1), elementalStone.Light.animSpeed)
      elementalStone.Light.anim:gotoFrame(4)
    elseif elementalStone.elementType == "air" then
      elementalStone.anim = anim8.newAnimation(elementalStone.grid('1-5', 1), elementalStone.animSpeed)
      elementalStone.anim:gotoFrame(5)
      elementalStone.Light.anim = anim8.newAnimation(elementalStone.Light.grid('1-5', 1), elementalStone.Light.animSpeed)
      elementalStone.Light.anim:gotoFrame(5)
    end

    elementalStone:setCollisionClass('item')
    elementalStone:setFixedRotation(true)
    elementalStone:setType("static")
  end

  function elementalStone:update(dt)
    delta = love.timer.getDelta( )
    if elementalStone.elementPlaced then
      if elementalStone.elementType == "water" then
        phase.water = true
      elseif elementalStone.elementType == "fire" then
        phase.fire = true
      elseif elementalStone.elementType == "earth" then
        phase.earth = true
      elseif elementalStone.elementType == "lightning" then
        phase.lightning = true
      elseif elementalStone.elementType == "air" then
        phase.air = true
      end
    end


  end

  function elementalStone:draw()
    elementalStone.anim:draw(elementalStone.Sheet,elementalStone:getX() - 16 ,elementalStone:getY() - 23)
    if elementalStone.elementPlaced then
      elementalStone.Light.anim:draw(elementalStone.Light.Sheet,elementalStone:getX() - 8 ,elementalStone:getY() - 24)
    end

  end

  function elementalStone:placeElement()
    if player.element == elementalStone.elementType then
      elementalStone.elementPlaced = true
      player.element = "none"
    else
      if elementalStone.elementPlaced ~= true and player.element ~= "none" then
        player.element = "none"
        player.health = player.health - 1
      end
    end
  end

  return elementalStone

end

return elementalStoneInit
