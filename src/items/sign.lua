local function signInit(sign,x,y,other)
  sign = world:newRectangleCollider(x ,y ,20,32)
  sign.x = x
  sign.y = y
  sign.dead = false
  sign.name = "sign"
  sign.touchInteraction = false
  sign.animSpeed = .15
  sign.type = other
  sign.read = false

  sign.Sheet = love.graphics.newImage("sprites/sign.png")
  sign.animations = {}
  sign.height = 64
  sign.width = 32
  sign.grid = anim8.newGrid(sign.width, sign.height, sign.Sheet:getWidth(), sign.Sheet:getHeight())
  sign.anim = anim8.newAnimation(sign.grid('1-4', 1), sign.animSpeed)




  function sign:load()

    if sign.type == "small" then
      sign.anim:gotoFrame(1)
    elseif sign.type == "medium" then
      sign.anim:gotoFrame(2)
    elseif sign.type == "large" then
      sign.anim:gotoFrame(3)
    else
      sign.anim:gotoFrame(4)
    end

    sign:setCollisionClass('item')
    sign:setType("static")

  end

  function sign:update(dt)

    if sign.read then
      sign.read = false
      talkies.say("Sign","this way ----->")
    end

  end

  function sign:draw()
    sign.anim:draw(sign.Sheet,sign:getX() - 16 ,sign:getY()-48)

  end


  return sign

end

return signInit
