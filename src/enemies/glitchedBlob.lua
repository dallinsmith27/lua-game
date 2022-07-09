local function glitchedBlobInit(glitchedBlob,x,y)
  glitchedBlob = world:newCircleCollider(x, y, 12)
  glitchedBlob.x = x
  glitchedBlob.y = y
  glitchedBlob.dirx = 0
  glitchedBlob.diry = 0
  glitchedBlob.timer = 0
  glitchedBlob.stunTimer = 0
  glitchedBlob.name = "glitchedBlob"

  glitchedBlob.state = 0

  glitchedBlob.health = 12
  glitchedBlob.sight = 500
  glitchedBlob.jumpDist = 100
  glitchedBlob.speed = 50
  glitchedBlob.animSpeed = 0.15
  glitchedBlob.walkSheet = love.graphics.newImage("sprites/glitchedBlob.png")
  glitchedBlob.animations = {}
  glitchedBlob.height = 32
  glitchedBlob.width = 32
  glitchedBlob.grid = anim8.newGrid(glitchedBlob.width, glitchedBlob.height, glitchedBlob.walkSheet:getWidth(), glitchedBlob.walkSheet:getHeight())
  glitchedBlob.animations.idle = anim8.newAnimation(glitchedBlob.grid('1-5', 1), glitchedBlob.animSpeed)
  glitchedBlob.animations.up = anim8.newAnimation(glitchedBlob.grid('1-5', 3), glitchedBlob.animSpeed)
  glitchedBlob.animations.die = anim8.newAnimation(glitchedBlob.grid('1-5', 2), glitchedBlob.animSpeed)
  glitchedBlob.anim = glitchedBlob.animations.idle

  function glitchedBlob:load()
    glitchedBlob:setCollisionClass('enemy')
    glitchedBlob:setFixedRotation(true)
    glitchedBlob:setLinearDamping(20)

  end

  function glitchedBlob:update(dt)
    dt = love.timer.getDelta()
    glitchedBlob.timer = glitchedBlob.timer - dt
    glitchedBlob.stunTimer = glitchedBlob.stunTimer - dt

    local px = glitchedBlob:getX()
    local py = glitchedBlob:getY()
    local dir = vector(player.x - px,player.y - py)
    local d = dir:len()

    if d <= glitchedBlob.sight and glitchedBlob.stunTimer <= 0 then
      if d <= glitchedBlob.jumpDist and glitchedBlob.timer <= 0 then

        glitchedBlob.timer = 5
        dir = dir:normalized() * glitchedBlob.speed * 5
        glitchedBlob:setLinearVelocity(dir:unpack())
        glitchedBlob.anim = glitchedBlob.animations.up
      elseif glitchedBlob.timer <= 4.25 then
        glitchedBlob.anim = glitchedBlob.animations.idle
        dir = dir:normalized() * glitchedBlob.speed
        glitchedBlob:setLinearVelocity(dir:unpack())
      end

    else
      glitchedBlob:setLinearVelocity(0,0)
      glitchedBlob.anim = glitchedBlob.animations.idle
    end

    if glitchedBlob:enter("Player") and glitchedBlob.stunTimer <= 0 then
      player:damage(1,dir:normalized()*2,.1)
      glitchedBlob:setLinearVelocity(0,0)
      glitchedBlob.stunTimer = 1
      glitchedBlob.anim = glitchedBlob.animations.idle
    end

    glitchedBlob.anim:update(dt)

  end

  function glitchedBlob:draw()
    local px = glitchedBlob:getX() - glitchedBlob.width / 2
    local py = glitchedBlob:getY() - glitchedBlob.height / 2
    glitchedBlob.anim:draw(glitchedBlob.walkSheet, px, py)

  end


  return glitchedBlob

end

return glitchedBlobInit
