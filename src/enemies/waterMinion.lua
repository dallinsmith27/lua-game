local function waterMinionInit(waterMinion,x,y)
  waterMinion = world:newRectangleCollider(x, y, 32,64)
  waterMinion.x = x
  waterMinion.y = y
  waterMinion.dirx = 0
  waterMinion.diry = 0
  waterMinion.timer = 0
  waterMinion.stunTimer = 0
  waterMinion.name = "waterMinion"

  waterMinion.state = 0

  waterMinion.health = 8


  waterMinion.animations = {}
  waterMinion.height = 32
  waterMinion.width = 32


  function waterMinion:load()
    waterMinion:setCollisionClass('enemy')
    waterMinion:setFixedRotation(true)
    waterMinion:setLinearDamping(20)

  end

  function waterMinion:update(dt)
    dt = love.timer.getDelta()


  end

  function waterMinion:draw()
    local px = waterMinion:getX() - waterMinion.width / 2
    local py = waterMinion:getY() - waterMinion.height / 2


  end

  function  waterMinion:damage(damage,knockback)
    waterMinion.health =  waterMinion.health - damage

  end

  function waterMinion:spawnMinion()

  end


  return waterMinion

end

return waterMinionInit
