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
  john.image = love.graphics.newImage("sprites/npcs/john.png")
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

    end

  end

  function john:draw()
    local px = john:getX() - john.width/8 +5
    local py = john:getY() - john.height/8
    --john.anim:draw(john.walkSheet, px, py,0,.25,.25)
    love.graphics.draw(john.image, px, py, 0,.03,.03)

  end

  function john:speak()
    talkies.say("John", "Well Howdy there! \n -- Ive been Wait'n For ya!!  \n -- Dark Spirits have been unleashed on this Land. \n -- The cows told me a Hero would come to my farm.", { talkSound=blop,typedNotTalked=false,textSpeed="medium"})
    talkies.say("John", "I see youve figured out how to walk. \n -- You will need to unlock your power before you continue your journey \n -- The cows protect all sacred power in this world", { talkSound=blop,typedNotTalked=false,textSpeed="medium"})
    talkies.say("John", "Use the space bar button to interact with characters and items in this world.  \n -- Try talking to the cows and see if you can unlock your power. \n -- They're real friendly creatures and love to talk ", { talkSound=blop,typedNotTalked=false,textSpeed="medium"})


  end

  return john

end

return johnInit
