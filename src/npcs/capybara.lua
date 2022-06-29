local function capybaraInit(capybara,x,y)
  capybara = world:newRectangleCollider(x, y, 50, 50)
  capybara.x = x
  capybara.y = y
  capybara.dirx = 0
  capybara.diry = 0
  capybara.timer = 5
  capybara.name = "capybara"
  -- 0 - Ready to move
  -- 1 - moving roight
  -- 2 - moving left
  -- 3 - moving up
  -- 4 - moving down



  capybara.state = 0


  capybara.speed = 75
  capybara.animSpeed = 0.1
  capybara.walkSheet = love.graphics.newImage("sprites/capybara.png")
  capybara.animations = {}
  capybara.height = 100
  capybara.width = 100
  capybara.grid = anim8.newGrid(capybara.width, capybara.height, capybara.walkSheet:getWidth(), capybara.walkSheet:getHeight())
  capybara.animations.walkDown = anim8.newAnimation(capybara.grid('1-4', 3), capybara.animSpeed)
  capybara.animations.walkLeft = anim8.newAnimation(capybara.grid('1-4', 1), capybara.animSpeed)
  capybara.animations.walkRight = anim8.newAnimation(capybara.grid('1-4', 2), capybara.animSpeed)
  capybara.animations.walkUp = anim8.newAnimation(capybara.grid('1-4', 4), capybara.animSpeed)
  capybara.anim = capybara.animations.walkDown

  function capybara:load()



    capybara:setCollisionClass('capybara')
    capybara:setFixedRotation(true)

  end

  function capybara:update(dt)
    delta = love.timer.getDelta( )
    if capybara.timer < 0 then
      capybara.dirx = 0
      capybara.diry = 0
      capybara.state = math.random(1, 7)
        -- random 0 - 4
      if capybara.state >= 5 then
        capybara.timer = 5

      elseif capybara.state == 1 then
        capybara.dirx = 1
        capybara.timer = math.random(0, 2) + .25 * math.random(1, 8)
        capybara.anim = capybara.animations.walkRight
        --move right

      elseif capybara.state == 2 then
        capybara.dirx = -1
        capybara.timer = math.random(0, 2) + .25 * math.random(1, 8)
        capybara.anim = capybara.animations.walkLeft
        -- move lefet

      elseif capybara.state == 3 then
        capybara.diry = -1
        capybara.timer = math.random(0, 2) + .25 * math.random(1, 8)
        capybara.anim = capybara.animations.walkUp
        --move up

      elseif capybara.state == 4 then
        capybara.diry = 1
        capybara.timer = math.random(0, 2) + .25 * math.random(1, 8)
        capybara.anim = capybara.animations.walkDown
        -- move down
      end
    else
      if delta > 0 then
        capybara.timer = capybara.timer - delta
      end
    end

    capybara:setLinearVelocity(capybara.dirx * capybara.speed, capybara.diry * capybara.speed)

    if capybara.dirx == 0 and capybara.diry == 0 then
        capybara.walking = false
        capybara.anim:gotoFrame(1)
    else
        capybara.walking = true
    end

    if capybara.walking then
        capybara.anim:update(delta)
    end
  end

  function capybara:draw()
    local px = capybara:getX() - capybara.width / 2
    local py = capybara:getY() - capybara.height / 2
    capybara.anim:draw(capybara.walkSheet, px, py)

  end


  return capybara

end

return capybaraInit
