local function candleStickInit(candleStick,x,y,mod1)
  candleStick = world:newRectangleCollider(x ,y ,21,25)
  candleStick.x = x
  candleStick.y = y
  candleStick.dead = false
  candleStick.name = "candleStick"
  candleStick.touchInteraction = false
  candleStick.animSpeed = .2
  candleStick.type = mod1
  candleStick.isOn = false
  candleStick.timer = 10
  candleStick.countDown = true
  candleStick.anim = nil



  function candleStick:load()

    if candleStick.type == "single" then
      candleStick.Sheet = love.graphics.newImage("sprites/candleStick.png")
      candleStick.animations = {}
      candleStick.height = 64
      candleStick.width = 32
      candleStick.grid = anim8.newGrid(candleStick.width, candleStick.height, candleStick.Sheet:getWidth(), candleStick.Sheet:getHeight())
      candleStick.animOn = anim8.newAnimation(candleStick.grid('1-2', 1), candleStick.animSpeed)
      candleStick.animOff = anim8.newAnimation(candleStick.grid('1-2', 2), candleStick.animSpeed)
    elseif candleStick.type == "triple" then
      candleStick.Sheet = love.graphics.newImage("sprites/tripleCandle.png")
      candleStick.animations = {}
      candleStick.height = 64
      candleStick.width = 32
      candleStick.grid = anim8.newGrid(candleStick.width, candleStick.height, candleStick.Sheet:getWidth(), candleStick.Sheet:getHeight())
      candleStick.animOn = anim8.newAnimation(candleStick.grid('1-2', 1), candleStick.animSpeed)
      candleStick.animOff = anim8.newAnimation(candleStick.grid('1-2', 2), candleStick.animSpeed)
    elseif candleStick.type == "lantern" then
      candleStick.Sheet = love.graphics.newImage("sprites/lantern.png")
      candleStick.animations = {}
      candleStick.height = 32
      candleStick.width = 32
      candleStick.grid = anim8.newGrid(candleStick.width, candleStick.height, candleStick.Sheet:getWidth(), candleStick.Sheet:getHeight())
      candleStick.animOn = anim8.newAnimation(candleStick.grid('1-2', 1), candleStick.animSpeed)
      candleStick.animOff = anim8.newAnimation(candleStick.grid('1-2', 1), candleStick.animSpeed)

    end

    candleStick:setCollisionClass('item')
    candleStick:setType("static")
    candleStick:setFixedRotation(true)
  end

  function candleStick:update(dt)
    dt = love.timer.getDelta()

    if candleStick.isOn then
      candleStick.anim = candleStick.animOn
      if candleStick.type == "lantern" then
        candleStick.anim:gotoFrame(2)
      else
        candleStick.anim:update(dt)
      end

    else
      candleStick.anim = candleStick.animOff
      candleStick.anim:gotoFrame(1)
    end

  end

  function candleStick:draw()
    if candleStick.type == "lantern" then
      candleStick.anim:draw(candleStick.Sheet,candleStick:getX() - 17 ,candleStick:getY()-16)
    elseif candleStick.type == "triple" then
      candleStick.anim:draw(candleStick.Sheet,candleStick:getX() - 15 ,candleStick:getY() - 46)
    else
      candleStick.anim:draw(candleStick.Sheet,candleStick:getX() - 15 ,candleStick:getY()-38)
    end
  end


  return candleStick

end

return candleStickInit
