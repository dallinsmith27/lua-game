local function errorInit(error,x,y)
  error = {}
  error.x = x
  error.y = y
  error.dirx = 0
  error.diry = 0
  error.test = 420
  error.timer = 5

  -- 0 - Ready to move
  -- 1 = moving slow blink
  -- 2 = moving fast blink
  -- 3 exploding
  -- 4 = dead
  error.health = 4
  error.chaseModifier = 200
  error.state = 0
  error.maxSpeed = 200
  error.viewDistance = 600
  error.speed = 75
  error.animSpeed = 0.5
  error.walkSheet = love.graphics.newImage("sprites/errorSprite.png")
  error.animations = {}
  error.height = 75
  error.width = 75
  error.grid = anim8.newGrid(error.width, error.height, error.walkSheet:getWidth(), error.walkSheet:getHeight())
  error.animations.blink = anim8.newAnimation(error.grid('1-2', 1), error.animSpeed)
  error.animations.blinkFast = anim8.newAnimation(error.grid('1-3', 1), error.animSpeed/5)
  error.anim = error.animations.blink

  function error:load()
    error.collider = world:newCircleCollider(error.x,error.y,30)

    error.collider:setCollisionClass('error')
    error.collider:setFixedRotation(true)
    error.collider:setMass(2)
    error.collider:setLinearDamping(2)
  end

  function error.update(dt)

    delta = love.timer.getDelta( )
    local px = error.collider:getX()
    local py = error.collider:getY()

    if error.state ~= 4 then

      d = distanceBetween(px,py,player.x,player.y)

      if d < 75 or error.health <= 0 then
        error.state = 3
      elseif d < error.viewDistance and error.state ~= 3 then
        error.state = 1
        error.anim = error.animations.blink
        error.dir = vector(player.x - px, player.y - py):normalized() * error.speed *error.chaseModifier
        if distanceBetween(0, 0, error.collider:getLinearVelocity()) < error.maxSpeed then
          error.collider:applyForce(error.dir:unpack())
        end
        if d < error.viewDistance/2 and error.state ~= 3 then
          error.state = 2
          error.anim = error.animations.blinkFast
        end
      else
        error.state = 0
      end
    end

    if error.state == 3 then
      error.collider:setLinearVelocity(0,0)
      --local query = world:queryCircleArea(error.collider:getX(),error.collider:getY(),150,{"Player"})

      --if #query > 0 then
        --for _,d in ipairs(query) do
          --test.num = 5
          --d:damage(1+,vector(0,0),.5)
        --end
      --end
      error.state = 4
      --explode
    end

    error.anim:update(delta)
  end


  function error.draw()
    local px = error.collider:getX() - error.width / 2
    local py = error.collider:getY() - error.height / 2
    error.anim:draw(error.walkSheet, px, py)


  end

  function error.destroy()
    error.collider:destroy()
  end

  return error

end

return errorInit
