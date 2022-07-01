local function chestInit(chest,x,y,mod1,mod2,modNum)
  chest = world:newRectangleCollider(x ,y ,32,32)
  chest.x = x
  chest.y = y
  chest.dead = false
  chest.name = "chest"
  chest.touchInteraction = false
  chest.animSpeed = .15
  chest.material = mod1
  chest.interaction = false
  chest.item = mod2
  chest.numItems = modNum
  chest.isOpen = false
  chest.timer = 0
  chest.state = 0
  chest.items = {}
  chest.Sheet = love.graphics.newImage("sprites/chests.png")
  chest.animations = {}
  chest.height = 32
  chest.width = 32
  chest.grid = anim8.newGrid(chest.width, chest.height, chest.Sheet:getWidth(), chest.Sheet:getHeight())
  chest.anim = anim8.newAnimation(chest.grid('1-8', 1), chest.animSpeed)




  function chest:load()

    if chest.material == "gold" then
      chest.anim = anim8.newAnimation(chest.grid('1-2', 1), chest.animSpeed)
    elseif chest.material == "wood" then
      chest.anim = anim8.newAnimation(chest.grid('3-4', 1), chest.animSpeed)
    elseif chest.material == "metal" then
      chest.anim = anim8.newAnimation(chest.grid('5-6', 1), chest.animSpeed)
    else
      chest.anim = anim8.newAnimation(chest.grid('7-8', 1), chest.animSpeed)
    end

    chest:setCollisionClass('item')
    chest:setType("static")

  end

  function chest:update(dt)
    dt = love.timer.getDelta()
    if chest.interaction then
      if not chest.isOpen then
        chest.isOpen = true
        chest.anim:gotoFrame(2)
        chest.state = 1

      end
      chest.interaction  = false
    elseif not chest.isOpen then
      chest.anim:gotoFrame(1)
    end


    if chest.state == 1 then
      chest.timer = chest.timer - dt
      if chest.timer < 0 and chest.numItems > 0 then
        local dirX = math.random(-50, 50)
        local dirY = math.random(-50, 50)
        spawnItem(chest:getX() +dirX ,chest:getY() + dirY ,chest.item,chest.items,chest.items)
        chest.numItems = chest.numItems - 1
        chest.timer = .2
      end
    end
    if #chest.items > 0 then
      for n, item in pairs(chest.items) do
        if item.dead then
          item:destroy()
          table.remove(chest.items,n)
        else
          item:update(dt)
        end
      end
    end

  end

  function chest:draw()

    chest.anim:draw(chest.Sheet,chest:getX() - 16 ,chest:getY() - 16)
    if #chest.items > 0 then
      for _, item in pairs(chest.items) do
        item:draw()
      end
    end
  end


  return chest

end

return chestInit
