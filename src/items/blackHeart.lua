local function blackHeartInit(blackHeart,x,y)
  blackHeart = world:newCircleCollider(x + 25,y + 25,20)
  blackHeart.x = x
  blackHeart.y = y
  blackHeart.dead = false
  blackHeart.name = "blackHeart"
  blackHeart.image = love.graphics.newImage("sprites/blackHeart.png")
  blackHeart.touchInteraction = true

  function blackHeart:load()



    blackHeart:setCollisionClass('item')
    blackHeart:setFixedRotation(true)
    blackHeart:setMass(2)
    blackHeart:setLinearDamping(2)
    blackHeart:setType("static")
  end

  function blackHeart:update(dt)
    delta = love.timer.getDelta( )

  end

  function blackHeart:draw()
    love.graphics.draw(blackHeart.image, blackHeart.x, blackHeart.y)

  end


  return blackHeart

end

return blackHeartInit
