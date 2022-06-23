local function respawnStoneInit(respawnStone,x,y)
  respawnStone = world:newRectangleCollider(x,y,26,66)
  respawnStone.x = x
  respawnStone.y = y
  respawnStone.dead = false
  respawnStone.name = "respawnStone"
  respawnStone.glow = false
  respawnStone.interact = false
  respawnStone.beginningStone = 0


  --spins slower than the goldCoin's .13 and the silverCoin's .14
  respawnStone.image = love.graphics.newImage("sprites/respawnStone.png")
  respawnStone.glowImage = love.graphics.newImage("sprites/respawnStoneGlow.png")

  respawnStone.height = 36
  respawnStone.width = 66




  function respawnStone:load()



    respawnStone:setCollisionClass('respawnStone')
    respawnStone:setFixedRotation(true)
    respawnStone:setType("static")
  end

  function respawnStone:update(dt)
    delta = love.timer.getDelta( )
    if respawnStone.interact then
      respawnStone.interact = false
      talkies:clearMessages()
      if game.phase < 4 then
        if not respawnStone.glow then
          respawnStone.glow = true
          phase.num = phase.num + 1
          if phase.num == 1 then
            talkies.say("Companionname", "Perfect, Only one more to go!!", { talkSound=blop,typedNotTalked=false,textSpeed="slow"})
          elseif phase.num == 2 then
            talkies.say("Companionname", "Perfect that should do it. I'm transferring us to the game now.", { talkSound=blop,typedNotTalked=false,textSpeed="slow"})
            game.phase = game.phase+1
          end
        end
      else
        talkies.say("Mysterious Stone","Do You Want to Save Progress?",{options={{"Save", function() game:save() end}, {"Don't Save", function() talkies:clearMessages() end}}})
      end
    end

  end

  function respawnStone:draw()
    love.graphics.draw(respawnStone.image, respawnStone.x, respawnStone.y)
    if respawnStone.glow then
      love.graphics.draw(respawnStone.glowImage, respawnStone.x, respawnStone.y)
    end

  end


  return respawnStone

end

return respawnStoneInit
