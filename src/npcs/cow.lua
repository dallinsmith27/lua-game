local function cowInit(cow,x,y)
  cow = {}
  cow.x = x
  cow.y = y
  cow.dirx = 0
  cow.diry = 0
  cow.timer = 5
  -- 0 - Ready to move
  -- 1 - moving roight
  -- 2 - moving left
  -- 3 - moving up
  -- 4 - moving down



  cow.state = 0


  cow.speed = 75
  cow.animSpeed = 0.1
  cow.walkSheet = love.graphics.newImage("sprites/cowSprite.png")
  cow.animations = {}
  cow.height = 100
  cow.width = 100
  cow.grid = anim8.newGrid(cow.width, cow.height, cow.walkSheet:getWidth(), cow.walkSheet:getHeight())
  cow.animations.walkDown = anim8.newAnimation(cow.grid('1-4', 3), cow.animSpeed)
  cow.animations.walkLeft = anim8.newAnimation(cow.grid('1-4', 1), cow.animSpeed)
  cow.animations.walkRight = anim8.newAnimation(cow.grid('1-4', 2), cow.animSpeed)
  cow.animations.walkUp = anim8.newAnimation(cow.grid('1-4', 4), cow.animSpeed)
  cow.anim = cow.animations.walkDown

  function cow:load()

    cow.collider = world:newRectangleCollider(cow.x, cow.y, 50, 50)

    cow.collider:setCollisionClass('cow')
    cow.collider:setFixedRotation(true)

  end

  function cow.update(dt)
    delta = love.timer.getDelta( )
    if cow.timer < 0 then
      cow.dirx = 0
      cow.diry = 0
      cow.state = math.random(1, 7)
        -- random 0 - 4
      if cow.state >= 5 then
        cow.timer = 5

      elseif cow.state == 1 then
        cow.dirx = 1
        cow.timer = math.random(0, 2) + .25 * math.random(1, 8)
        cow.anim = cow.animations.walkRight
        --move right

      elseif cow.state == 2 then
        cow.dirx = -1
        cow.timer = math.random(0, 2) + .25 * math.random(1, 8)
        cow.anim = cow.animations.walkLeft
        -- move lefet

      elseif cow.state == 3 then
        cow.diry = -1
        cow.timer = math.random(0, 2) + .25 * math.random(1, 8)
        cow.anim = cow.animations.walkUp
        --move up

      elseif cow.state == 4 then
        cow.diry = 1
        cow.timer = math.random(0, 2) + .25 * math.random(1, 8)
        cow.anim = cow.animations.walkDown
        -- move down
      end
    else
      if delta > 0 then
        cow.timer = cow.timer - delta
      end
    end

    cow.collider:setLinearVelocity(cow.dirx * cow.speed, cow.diry * cow.speed)

    if cow.dirx == 0 and cow.diry == 0 then
        cow.walking = false
        cow.anim:gotoFrame(1)
    else
        cow.walking = true
    end

    if cow.walking then
        cow.anim:update(delta)
    end
  end

  function cow.draw()
    local px = cow.collider:getX() - cow.width / 2
    local py = cow.collider:getY() - cow.height / 2
    cow.anim:draw(cow.walkSheet, px, py)

  end

  function cow.destroy()
    cow.collider:destroy()
  end


  return cow

end

return cowInit
