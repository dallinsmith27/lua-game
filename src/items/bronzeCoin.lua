local function bronzeCoinInit(bronzeCoin,x,y)
  bronzeCoin = world:newCircleCollider(x + 15,y + 15,15)
  bronzeCoin.x = x
  bronzeCoin.y = y
  bronzeCoin.dead = false
  bronzeCoin.name = "bronzeCoin"

  bronzeCoin.animSpeed = .15
  --spins slower than the goldCoin's .13 and the silverCoin's .14
  bronzeCoin.walkSheet = love.graphics.newImage("sprites/bronzeCoin.png")
  bronzeCoin.animations = {}
  bronzeCoin.height = 30
  bronzeCoin.width = 30
  bronzeCoin.grid = anim8.newGrid(bronzeCoin.width, bronzeCoin.height, bronzeCoin.walkSheet:getWidth(), bronzeCoin.walkSheet:getHeight())
  bronzeCoin.anim = anim8.newAnimation(bronzeCoin.grid('1-4', 1), bronzeCoin.animSpeed)



  function bronzeCoin:load()



    bronzeCoin:setCollisionClass('item')
    bronzeCoin:setFixedRotation(true)
    bronzeCoin:setMass(2)
    bronzeCoin:setLinearDamping(2)
    bronzeCoin:setType("static")
  end

  function bronzeCoin:update(dt)
    delta = love.timer.getDelta( )
    bronzeCoin.anim:update(delta)
  end

  function bronzeCoin:draw()
    bronzeCoin.anim:draw(bronzeCoin.walkSheet,bronzeCoin.x,bronzeCoin.y)

  end


  return bronzeCoin

end

return bronzeCoinInit
