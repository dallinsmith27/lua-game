local function heartInit(heart,x,y)
  heart = world:newCircleCollider(x + 25,y + 25,20)
  heart.x = x
  heart.y = y
  heart.dead = false
  heart.name = "heart"
  heart.image = love.graphics.newImage("sprites/fullHeart.png")


  function heart:load()



    heart:setCollisionClass('item')
    heart:setFixedRotation(true)
    heart:setMass(2)
    heart:setLinearDamping(2)
  end

  function heart:update(dt)
    delta = love.timer.getDelta( )

  end

  function heart:draw()
    love.graphics.draw(heart.image, heart.x, heart.y)

  end


  return heart

end

return heartInit
