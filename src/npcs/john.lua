local function johnInit(john,x,y)
  john = world:newRectangleCollider(x, y, 20, 30)
  john.x = x
  john.y = y
  john.dirx = 0
  john.diry = 0
  john.timer = 5
  john.name = "john"
  john.interacted = false
  -- 0 - Ready to move
  -- 1 - moving roight
  -- 2 - moving left
  -- 3 - moving up
  -- 4 - moving down



  john.state = 0


  john.speed = 75
  --john.animSpeed = 0.5
  --john.walkSheet = love.graphics.newImage("sprites/npcs/john.png")

  john.height = 141
  john.width = 141
  --john.grid = anim8.newGrid(john.width, john.height, john.walkSheet:getWidth(), john.walkSheet:getHeight())
  --john.anim = anim8.newAnimation(john.grid('1-2', 1), john.animSpeed)
  function john:load()



    john:setCollisionClass('npc')
    john:setFixedRotation(true)

  end

  function john:update(dt)
    dt = love.timer.getDelta( )
    --john.anim:update(dt)

    if john.interacted then
      if mapID == 1 then
        --talkies.say()
      end
    end

  end

  function john:draw()
    local px = john:getX() - john.width/8 +5
    local py = john:getY() - john.height/8
    --john.anim:draw(john.walkSheet, px, py,0,.25,.25)

  end

  function john:speak()
    talkies.say("John", "Well Howdy there! \n -- Ur not from round these part are ya!!  \n -- How can I be of a service to ya!?", { talkSound=blop,typedNotTalked=false,textSpeed="medium"})


  end

  return john

end

return johnInit
