local function cowInit(cow,x,y)
  cow = world:newRectangleCollider(x, y, 25, 25)
  cow.x = x
  cow.y = y
  cow.dirx = 0
  cow.diry = 0
  cow.timer = 5
  cow.name = "cow"
  -- 0 - Ready to move
  -- 1 - moving roight
  -- 2 - moving left
  -- 3 - moving up
  -- 4 - moving down



  cow.state = 0

  cow.swordTalk=false
  cow.speed = 75
  cow.animSpeed = 0.1
  cow.walkSheet = love.graphics.newImage("sprites/cowSprite.png")
  cow.animations = {}
  cow.height = 100
  cow.width = 100
  cow.grid = anim8.newGrid(cow.width, cow.height, cow.walkSheet:getWidth(), cow.walkSheet:getHeight())
  cow.animations.walkDown = anim8.newAnimation(cow.grid('1-4', 3), cow.animSpeed)
  cow.animations.walkLeft = anim8.newAnimation(cow.grid('1-4', 1), cow.animSpeed)
  cow.animations.walkRight = anim8.newAnimation(cow.grid('1-4', 2), cow.animSpeed)
  cow.animations.walkUp = anim8.newAnimation(cow.grid('1-4', 4), cow.animSpeed)
  cow.anim = cow.animations.walkDown

  function cow:load()



    cow:setCollisionClass('npc')
    cow:setFixedRotation(true)

  end

  function cow:update(dt)
    delta = love.timer.getDelta( )
    if cow.timer < 0 then
      cow.dirx = 0
      cow.diry = 0
      cow.state = math.random(1, 7)
        -- random 0 - 4
      if cow.state >= 5 then
        cow.timer = 5

      elseif cow.state == 1 then
        cow.dirx = 1
        cow.timer = math.random(0, 2) + .25 * math.random(1, 8)
        cow.anim = cow.animations.walkRight
        --move right

      elseif cow.state == 2 then
        cow.dirx = -1
        cow.timer = math.random(0, 2) + .25 * math.random(1, 8)
        cow.anim = cow.animations.walkLeft
        -- move lefet

      elseif cow.state == 3 then
        cow.diry = -1
        cow.timer = math.random(0, 2) + .25 * math.random(1, 8)
        cow.anim = cow.animations.walkUp
        --move up

      elseif cow.state == 4 then
        cow.diry = 1
        cow.timer = math.random(0, 2) + .25 * math.random(1, 8)
        cow.anim = cow.animations.walkDown
        -- move down
      end
    else
      if delta > 0 then
        cow.timer = cow.timer - delta
      end
    end

    cow:setLinearVelocity(cow.dirx * cow.speed, cow.diry * cow.speed)

    if cow.dirx == 0 and cow.diry == 0 then
        cow.walking = false
        cow.anim:gotoFrame(1)
    else
        cow.walking = true
    end

    if cow.walking then
        cow.anim:update(delta)
    end
  end

  function cow:draw()
    local px = cow:getX() - cow.width / 4
    local py = cow:getY() - cow.height / 4
    cow.anim:draw(cow.walkSheet, px, py,0,.5,.5)

  end
  function cow:speak()
    local r =  math.random(1, 36)
    if r <= 10 then
      talkies.say("Cow", "MOOOOOOO!!!!", { talkSound=blop,typedNotTalked=false,textSpeed="medium"})
    elseif r <= 20 then
      talkies.say("Cow", "mooo???", { talkSound=blop,typedNotTalked=false,textSpeed="medium"})
    elseif r <= 30 then
      talkies.say("Cow", "moo...", { talkSound=blop,typedNotTalked=false,textSpeed="medium"})
    else
      if player.giveRiddle then
        talkies.say("Cow", "Man you gotta stop talking to cows... your looking like a crazy man.\n -- I hear your looking for the secret power. all us cows know is this riddle. \n -- ", { talkSound=blop,typedNotTalked=false,textSpeed="medium"})
        talkies.say("Cow", "Four mages gifted sacred power. Pedestals of stone beg for life. Resurect the stone to awaken your power. \n -- Good Luck figuring that one out", { talkSound=blop,typedNotTalked=false,textSpeed="medium"})
        player.hasRiddle = true
      else
        talkies.say("Cow", "Nobody will believe that im talking to you.", { talkSound=blop,typedNotTalked=false,textSpeed="medium"})
        player.giveRiddle = true
      end
    end
  end

  return cow

end

return cowInit
