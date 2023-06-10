local function waterBossInit(waterBoss,x,y)
  waterBoss = world:newRectangleCollider(x, y, 32,64)
  waterBoss.x = x
  waterBoss.y = y
  waterBoss.dirx = 0
  waterBoss.diry = 0
  waterBoss.timer = 0
  waterBoss.stunTimer = 0
  waterBoss.name = "waterBoss"

  waterBoss.state = 0

  waterBoss.health = 30


  waterBoss.animations = {}
  waterBoss.height = 32
  waterBoss.width = 32


  function waterBoss:load()
    waterBoss:setCollisionClass('enemy')
    waterBoss:setFixedRotation(true)
    waterBoss:setLinearDamping(20)

  end

  function waterBoss:update(dt)
    dt = love.timer.getDelta()


  end

  function waterBoss:draw()
    local px = waterBoss:getX() - waterBoss.width / 2
    local py = waterBoss:getY() - waterBoss.height / 2


  end

  function  waterBoss:damage(damage,knockback)
    waterBoss.health =  waterBoss.health - damage

  end

  function waterBoss:spawnMinion()
    --spawnEnemy(x,y,"waterMinion",map.enemies)
  end


  return waterBoss

end

return waterBossInit
