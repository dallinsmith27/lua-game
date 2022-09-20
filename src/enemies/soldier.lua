local function soldierInit(soldier,x,y)
  soldier = world:newRectangleCollider(x, y, 20, 30)
  soldier.x = x
  soldier.origX = x
  soldier.OrigY = y
  soldier.y = y
  soldier.dirx = 0
  soldier.diry = 0
  soldier.dir = "down"
  soldier.walking = false
  soldier.timer = 5
  soldier.name = "soldier"
  soldier.interacted = false
  -- 0 - Ready to move
  -- 1 - moving roight
  -- 2 - moving left
  -- 3 - moving up
  -- 4 - moving down



  soldier.state = 0
  soldier.vision = 200

  soldier.speed = 60
  soldier.animSpeed = 0.5
  soldier.walkSheet = love.graphics.newImage("sprites/soldierSprite.png")

  soldier.animations = {}
  soldier.width = 64
  soldier.height = 64
  soldier.grid = anim8.newGrid(64, 64, sprites.walkSheet:getWidth(), sprites.walkSheet:getHeight())
  soldier.animations.walkDown = anim8.newAnimation(soldier.grid('1-4', 1), soldier.animSpeed)
  soldier.animations.walkLeft = anim8.newAnimation(soldier.grid('1-4', 2), soldier.animSpeed)
  soldier.animations.walkRight = anim8.newAnimation(soldier.grid('1-4', 3), soldier.animSpeed)
  soldier.animations.walkUp = anim8.newAnimation(soldier.grid('1-4', 4), soldier.animSpeed)
  soldier.anim = soldier.animations.walkDown
  function soldier:load()



    soldier:setCollisionClass('npc')
    soldier:setFixedRotation(true)

  end

  function soldier:update(dt)
    dt = love.timer.getDelta( )
    dirX = 0
    dirY = 0
    if soldier.dir == "right" then
      soldier.anim = soldier.animations.walkRight
      if soldier.walking then
        dirX = 1

      end

    end
    if soldier.dir == "left" then
      soldier.anim = soldier.animations.walkLeft
      if soldier.walking then
        dirX = -1
      end

    end
    if soldier.dir == "down" then
      soldier.anim = soldier.animations.walkDown
      if soldier.walking then
        dirXY = 1
      end

    end
    if soldier.dir == "up" then
      soldier.anim = soldier.animations.walkUp
      if soldier.walking then
        dirY = -1
      end

    end
    if not soldier.walking then
      soldier.anim:gotoFrame(1)
    end
    soldier.anim:update(dt)
    local vec = vector(dirX, dirY):normalized() * soldier.speed
    soldier:setLinearVelocity(vec.x, vec.y)
    --Draw a line from soldier to soldier and see distance
    local px = soldier:getX()
    local py = soldier:getY()
    local dir = vector(soldier.x - px,soldier.y - py)
    local d = dir:len()

    --Check vision distance
    if d < soldier.vision then

    end


  end

  function soldier:draw()
    local px = soldier:getX() - soldier.width/8 +5
    local py = soldier:getY() - soldier.height/8
    soldier.anim:draw(soldier.walkSheet, px, py)

  end

  function soldier:speak()
    talkies.say("soldier", "What would you like to buy?", { talkSound=blop,typedNotTalked=false,textSpeed="medium"})


  end

  return soldier

end

return soldierInit
