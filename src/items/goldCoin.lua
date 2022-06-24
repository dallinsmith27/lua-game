local function goldCoinInit(goldCoin,x,y)
  goldCoin = world:newCircleCollider(x + 15,y + 15,15)
  goldCoin.x = x
  goldCoin.y = y
  goldCoin.dead = false
  goldCoin.name = "goldCoin"

  goldCoin.animSpeed = .13
  --spins slightly faster than the silverCoins's .14 and the bronzeCoin's .15
  goldCoin.walkSheet = love.graphics.newImage("sprites/goldCoin.png")
  goldCoin.animations = {}
  goldCoin.height = 30
  goldCoin.width = 30
  goldCoin.grid = anim8.newGrid(goldCoin.width, goldCoin.height, goldCoin.walkSheet:getWidth(), goldCoin.walkSheet:getHeight())
  goldCoin.anim = anim8.newAnimation(goldCoin.grid('1-4', 1), goldCoin.animSpeed)



  function goldCoin:load()



    goldCoin:setCollisionClass('item')
    goldCoin:setFixedRotation(true)
    goldCoin:setMass(2)
    goldCoin:setLinearDamping(2)
    goldCoin:setType("static")
  end

  function goldCoin:update(dt)
    delta = love.timer.getDelta( )
    goldCoin.anim:update(delta)
  end

  function goldCoin:draw()
    goldCoin.anim:draw(goldCoin.walkSheet,goldCoin.x,goldCoin.y)

  end


  return goldCoin

end

return goldCoinInit
