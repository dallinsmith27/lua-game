local function elementalOrbInit(elementalOrb,x,y,mod1)

  elementalOrb = world:newRectangleCollider(x,y,22,40)

  elementalOrb.x = x
  elementalOrb.y = y
  elementalOrb.elementType = mod1
  elementalOrb.dead = false
  elementalOrb.name = "elementalOrb"
  elementalOrb.show = false
  elementalOrb.animSpeed = .2
  elementalOrb.Sheet = love.graphics.newImage("sprites/elementalStoneLights.png")
  elementalOrb.height = 16
  elementalOrb.width = 16
  elementalOrb.grid = anim8.newGrid(elementalOrb.width, elementalOrb.height, elementalOrb.Sheet:getWidth(), elementalOrb.Sheet:getHeight())
  elementalOrb.anim = anim8.newAnimation(elementalOrb.grid('1-4', 1), elementalOrb.animSpeed)



  function elementalOrb:load()
    if player.hasRiddle then
      elementalOrb.show = true
    end
    if elementalOrb.elementType == "water" then
      elementalOrb.anim = anim8.newAnimation(elementalOrb.grid('1-4', 1), elementalOrb.animSpeed)
      elementalOrb.anim:gotoFrame(1)
    elseif elementalOrb.elementType == "fire" then
      elementalOrb.anim = anim8.newAnimation(elementalOrb.grid('1-4', 1), elementalOrb.animSpeed)
      elementalOrb.anim:gotoFrame(2)
    elseif elementalOrb.elementType == "earth" then
      elementalOrb.anim = anim8.newAnimation(elementalOrb.grid('1-4', 1), elementalOrb.animSpeed)
      elementalOrb.anim:gotoFrame(3)
    elseif elementalOrb.elementType == "lightning" then
      elementalOrb.anim = anim8.newAnimation(elementalOrb.grid('1-4', 1), elementalOrb.animSpeed)
      elementalOrb.anim:gotoFrame(4)
    elseif elementalOrb.elementType == "air" then
      elementalOrb.anim = anim8.newAnimation(elementalOrb.grid('1-5', 1), elementalOrb.animSpeed)
      elementalOrb.anim:gotoFrame(5)
    end
    elementalOrb:setCollisionClass('item')
    elementalOrb:setFixedRotation(true)
    elementalOrb:setType("static")

  end

  function elementalOrb:update(dt)
    delta = love.timer.getDelta( )
    --elementalOrb.anim:update(delta)
    if player.hasRiddle then
      elementalOrb.show = true
    end


  end

  function elementalOrb:draw()
    if elementalOrb.show and player.element ~= elementalOrb.elementType then
      elementalOrb.anim:draw(elementalOrb.Sheet,elementalOrb:getX() - elementalOrb.width/2 ,elementalOrb:getY() - elementalOrb.height/2)
    end

  end

  function elementalOrb:lightPlayer()
    if player.hasRiddle then
      player.element = elementalOrb.elementType
    end
  end

  return elementalOrb

end

return elementalOrbInit
