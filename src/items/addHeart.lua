local function addHeartInit(addHeart,x,y)
  addHeart = world:newCircleCollider(x + 25,y + 25,20)
  addHeart.x = x
  addHeart.y = y
  addHeart.dead = false
  addHeart.name = "addHeart"
  addHeart.image = love.graphics.newImage("sprites/addHeart.png")
  addHeart.touchInteraction = true

  function addHeart:load()



    addHeart:setCollisionClass('item')
    addHeart:setFixedRotation(true)
    addHeart:setMass(2)
    addHeart:setLinearDamping(2)
    addHeart:setType("static")
  end

  function addHeart:update(dt)
    delta = love.timer.getDelta( )

  end

  function addHeart:draw()
    love.graphics.draw(addHeart.image, addHeart.x, addHeart.y)

  end


  return addHeart

end

return addHeartInit
