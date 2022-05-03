local function glitch1Init(glitch1,x,y)
  glitch1 = {}
  glitch1.x = x
  glitch1.y = y
  glitch1.dirx = 0
  glitch1.diry = 0
  glitch1.test = 420
  glitch1.timer = 5
  -- 0 - Ready to move
  -- 1 - moving roight
  -- 2 - moving left
  -- 3 - moving up
  -- 4 - moving down


  glitch1.chaseModifier = 50
  glitch1.state = 0
  glitch1.maxSpeed = 150
  glitch1.viewDistance = 600
  glitch1.speed = 75
  glitch1.animSpeed = 0.1
  glitch1.walkSheet = love.graphics.newImage("sprites/glitch1.png")
  glitch1.animations = {}
  glitch1.height = 100
  glitch1.width = 100
  glitch1.grid = anim8.newGrid(glitch1.width, glitch1.height, glitch1.walkSheet:getWidth(), glitch1.walkSheet:getHeight())
  glitch1.animations.walk = anim8.newAnimation(glitch1.grid('1-4', 1), glitch1.animSpeed)
  glitch1.anim = glitch1.animations.walk

  function glitch1:load()
    glitch1.collider = world:newCircleCollider(glitch1.x,glitch1.y,30)

    glitch1.collider:setCollisionClass('glitch1')
    glitch1.collider:setFixedRotation(true)
    glitch1.collider:setMass(1)
    glitch1.collider:setLinearDamping(.5)
  end

  function glitch1.update(dt)
    delta = love.timer.getDelta( )
    local px = glitch1.collider:getX()
    local py = glitch1.collider:getY()
    d = distanceBetween(px,py,player.x,player.y)

    if (d) < glitch1.viewDistance then
      glitch1.timer = -1
      glitch1.state = 10
      glitch1.dir = vector(player.x - px, player.y - py):normalized() * glitch1.speed *glitch1.chaseModifier
      if distanceBetween(0, 0, glitch1.collider:getLinearVelocity()) < glitch1.maxSpeed then
      glitch1.collider:applyForce(glitch1.dir:unpack())
      end
    else
      glitch1.state = 0
    end

    if glitch1.timer < 0 then

      glitch1.dirx = 0
      glitch1.diry = 0
      if glitch1.state == 10 then


      else
        glitch1.state = math.random(1, 7)
          -- random 0 - 4
        if glitch1.state >= 5 then
          glitch1.timer = 5

        elseif glitch1.state == 1 then
          glitch1.dirx = 1
          glitch1.timer = math.random(0, 2) + .25 * math.random(1, 8)

          --move right

        elseif glitch1.state == 2 then
          glitch1.dirx = -1
          glitch1.timer = math.random(0, 2) + .25 * math.random(1, 8)

          -- move lefet

        elseif glitch1.state == 3 then
          glitch1.diry = -1
          glitch1.timer = math.random(0, 2) + .25 * math.random(1, 8)

          --move up

        elseif glitch1.state == 4 then
          glitch1.diry = 1
          glitch1.timer = math.random(0, 2) + .25 * math.random(1, 8)

          -- move down
        end
        glitch1.collider:setLinearVelocity(glitch1.dirx * glitch1.speed, glitch1.diry * glitch1.speed)
      end
    else
      if delta > 0 then
        glitch1.timer = glitch1.timer - delta
      end
    end



    if glitch1.dirx == 0 and glitch1.diry == 0 and glitch1.state ~= 10 then
        glitch1.walking = false
        glitch1.anim:gotoFrame(1)
    else
        glitch1.walking = true
    end

    if glitch1.walking then
        glitch1.anim:update(delta)
    end
  end

  function glitch1.draw()
    local px = glitch1.collider:getX() - glitch1.width / 2
    local py = glitch1.collider:getY() - glitch1.height / 2
    glitch1.anim:draw(glitch1.walkSheet, px, py)

  end

  function glitch1.destroy()
    glitch1.collider:destroy()
  end

  return glitch1

end

return glitch1Init
