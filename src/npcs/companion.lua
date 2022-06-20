local function companionInit(companion,x,y)
  companion = world:newCircleCollider(x, y, 5)
  companion.x = x
  companion.y = y
  companion.dirx = 0
  companion.diry = 0
  companion.timer = 5
  -- 0 - Ready to move
  -- 1 - moving roight
  -- 2 - moving left
  -- 3 - moving up
  -- 4 - moving down



  companion.state = 0

  companion.chaseDistance = 32
  companion.speed = player.speed - 50
  companion.animSpeed = 0.1
  companion.walkSheet = love.graphics.newImage("sprites/glitchCompanion.png")
  companion.animations = {}
  companion.height = 15
  companion.width = 10
  companion.grid = anim8.newGrid(companion.width, companion.height, companion.walkSheet:getWidth(), companion.walkSheet:getHeight())
  companion.animations.walk = anim8.newAnimation(companion.grid('1-4', 1), companion.animSpeed)
  companion.anim = companion.animations.walk
  companion.tooFarTalk = true
  companion.tooFarDist = 200
  function companion:load()



    companion:setCollisionClass('companion')
    companion:setFixedRotation(true)

  end

  function companion:update(dt)
    dt = love.timer.getDelta()
    companion.anim:update(dt)
    local px = companion:getX()
    local py = companion:getY()
    local dir = vector(player.x - px,player.y - py)
    local d = dir:len()

    if d >= companion.tooFarDist and companion.tooFarTalk then
      companion.tooFarTalk = false

      -- hey slow down for me
    else
      
    end
    if d >= companion.chaseDistance then

      companion.tooFarTalk = true
      dir = dir:normalized() * companion.speed
      companion:setLinearVelocity(dir:unpack())
    else

      companion:setLinearVelocity(0,0)
    end

  end

  function companion:draw()
    local px = companion:getX() - companion.width / 2
    local py = companion:getY() - companion.height / 2
    companion.anim:draw(companion.walkSheet, px, py)

  end


  return companion

end

return companionInit
