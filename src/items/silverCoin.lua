local function silverCoinInit(silverCoin,x,y)
  silverCoin = world:newCircleCollider(x + 15,y + 15,15)
  silverCoin.x = x
  silverCoin.y = y
  silverCoin.dead = false
  silverCoin.name = "silverCoin"

  silverCoin.animSpeed = .14
  --spins in between the silverCoin's .13 and the bronzeCoin's .15

  --new coin animation
    silverCoin.walkSheet = love.graphics.newImage("sprites/money/coin_silver_sheet.png")
    silverCoin.animations = {}
    silverCoin.height = 32
    silverCoin.width = 32
    silverCoin.grid = anim8.newGrid(silverCoin.width, silverCoin.height, silverCoin.walkSheet:getWidth(), silverCoin.walkSheet:getHeight())
    silverCoin.anim = anim8.newAnimation(silverCoin.grid('1-8', 1), silverCoin.animSpeed)

  --old coin animations
    -- silverCoin.walkSheet = love.graphics.newImage("sprites/money/silverCoin.png")
    -- silverCoin.animations = {}
    -- silverCoin.height = 30
    -- silverCoin.width = 30
    -- silverCoin.grid = anim8.newGrid(silverCoin.width, silverCoin.height, silverCoin.walkSheet:getWidth(), silverCoin.walkSheet:getHeight())
    -- silverCoin.anim = anim8.newAnimation(silverCoin.grid('1-4', 1), silverCoin.animSpeed)



  function silverCoin:load()



    silverCoin:setCollisionClass('item')
    silverCoin:setFixedRotation(true)
    silverCoin:setMass(2)
    silverCoin:setLinearDamping(2)
    silverCoin:setType("static")
  end

  function silverCoin:update(dt)
    delta = love.timer.getDelta( )
    silverCoin.anim:update(delta)
  end

  function silverCoin:draw()
    silverCoin.anim:draw(silverCoin.walkSheet,silverCoin.x,silverCoin.y)

  end


  return silverCoin

end

return silverCoinInit
