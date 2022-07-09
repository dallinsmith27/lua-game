local function sarahInit(sarah,x,y)
  sarah = world:newRectangleCollider(x, y, 20, 30)
  sarah.x = x
  sarah.y = y
  sarah.dirx = 0
  sarah.diry = 0
  sarah.timer = 5
  sarah.name = "sarah"
  sarah.interacted = false
  -- 0 - Ready to move
  -- 1 - moving roight
  -- 2 - moving left
  -- 3 - moving up
  -- 4 - moving down



  sarah.state = 0


  sarah.speed = 75
  sarah.animSpeed = 0.5
  sarah.walkSheet = love.graphics.newImage("sprites/npcs/sarah.png")

  sarah.height = 141
  sarah.width = 141
  sarah.grid = anim8.newGrid(sarah.width, sarah.height, sarah.walkSheet:getWidth(), sarah.walkSheet:getHeight())
  sarah.anim = anim8.newAnimation(sarah.grid('1-2', 1), sarah.animSpeed)
  function sarah:load()



    sarah:setCollisionClass('npc')
    sarah:setFixedRotation(true)

  end

  function sarah:update(dt)
    dt = love.timer.getDelta( )
    sarah.anim:update(dt)

    if sarah.interacted then
      if mapID == 1 then
        --talkies.say()
      end
    end
    
  end

  function sarah:draw()
    local px = sarah:getX() - sarah.width/8 +5
    local py = sarah:getY() - sarah.height/8
    sarah.anim:draw(sarah.walkSheet, px, py,0,.25,.25)

  end


  return sarah

end

return sarahInit
