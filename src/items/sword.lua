local function swordInit(sword,x,y)
  sword = world:newRectangleCollider(x ,y ,16,15)
  sword.x = x
  sword.y = y
  sword.dead = false
  sword.name = "sword"
  sword.touchInteraction = false
  sword.appear = false

  sword.height = 29
  sword.width = 16
  sword.image = love.graphics.newImage("sprites/sword.png")





  function sword:load()



    sword:setCollisionClass('Ignore')
    sword:setFixedRotation(true)
    sword:setType("static")

  end

  function sword:update(dt)
    delta = love.timer.getDelta( )
    if phase.earth and phase.lightning and phase.water and phase.fire and phase.air and not player.sword then
      test.string = "appear"
      sword.appear = true
      sword:setCollisionClass('item')
    elseif player.sword then
      sword:setCollisionClass('Ignore')
    end
  end

  function sword:draw()
    if sword.appear and not player.sword then
      test.string = "appear"
      love.graphics.draw(sword.image, sword.x, sword.y)
    end

  function sword:giveSword()
    if sword.appear then
      player.sword = true
    end
  end


  end


  return sword

end

return swordInit
