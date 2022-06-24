local function fogInit(fog,x,y)
  fog = world:newCircleCollider(x,y,11)
  fog:setCollisionClass('fog')
  fog.x = x
  fog.y = y
  fog.timer = 5

  -- 0 - Ready to move
  -- 1 = moving slow blink
  -- 2 = moving fast blink
  -- 3 exploding
  -- 4 = dead
  fog.animSpeed = 0.1
  fog.walkSheet = love.graphics.newImage("sprites/fog.png")
  fog.animations = {}
  fog.height = 32
  fog.width = 32
  fog.grid = anim8.newGrid(fog.width, fog.height, fog.walkSheet:getWidth(), fog.walkSheet:getHeight())
  fog.anim = anim8.newAnimation(fog.grid('1-4', 1), fog.animSpeed)


  function fog:load()



    fog:setFixedRotation(true)
    fog:setMass(2)
    fog:setLinearDamping(10)
  end

  function fog:update(dt)
    fog.anim:update(dt)

  end


  function fog:draw()
    local px = fog:getX() - fog.width / 2
    local py = fog:getY() - fog.height / 2
    fog.anim:draw(fog.walkSheet, px, py)


  end

  return fog

end

return fogInit
