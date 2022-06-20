local function blankNpcInit(blankNpc,x,y)
  blankNpc = world:newCircleCollider(x, y, 5)
  blankNpc.x = x
  blankNpc.y = y
  blankNpc.dirx = 0
  blankNpc.diry = 0
  blankNpc.timer = 5
  -- 0 - Ready to move
  -- 1 - moving roight
  -- 2 - moving left
  -- 3 - moving up
  -- 4 - moving down



  blankNpc.state = 0


  blankNpc.speed = 75
  blankNpc.animSpeed = 0.1
  blankNpc.walkSheet = love.graphics.newImage("sprites/glitchCompanion.png")
  blankNpc.animations = {}
  blankNpc.height = 15
  blankNpc.width = 10
  blankNpc.grid = anim8.newGrid(blankNpc.width, blankNpc.height, blankNpc.walkSheet:getWidth(), blankNpc.walkSheet:getHeight())
  blankNpc.animations.walk = anim8.newAnimation(blankNpc.grid('1-4', 1), blankNpc.animSpeed)
  blankNpc.anim = blankNpc.animations.walk

  function blankNpc:load()



    blankNpc:setCollisionClass('cow')
    blankNpc:setFixedRotation(true)

  end

  function blankNpc:update(dt)
    dt = love.timer.getDelta()
    blankNpc.anim:update(dt)

  end

  function blankNpc:draw()
    local px = blankNpc:getX() - blankNpc.width / 2
    local py = blankNpc:getY() - blankNpc.height / 2
    blankNpc.anim:draw(blankNpc.walkSheet, px, py)

  end


  return blankNpc

end

return blankNpcInit
