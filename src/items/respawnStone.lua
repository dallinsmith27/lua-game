local function respawnStoneInit(respawnStone,x,y)
  respawnStone = world:newRectangleCollider(x,y,26,46)
  respawnStone.x = x
  respawnStone.y = y
  respawnStone.dead = false
  respawnStone.name = "respawnStone"
  respawnStone.glow = false
  respawnStone.interact = false
  respawnStone.beginningStone = 0
  respawnStone.touchInteraction = false

  --spins mediumer than the goldCoin's .13 and the silverCoin's .14
  respawnStone.image = love.graphics.newImage("sprites/respawnStone.png")
  respawnStone.glowImage = love.graphics.newImage("sprites/respawnStoneGlow.png")

  respawnStone.height = 36
  respawnStone.width = 66




  function respawnStone:load()



    respawnStone:setCollisionClass('item')
    respawnStone:setFixedRotation(true)
    respawnStone:setType("static")
  end

  function respawnStone:update(dt)
    delta = love.timer.getDelta( )
    if respawnStone.interact then
      respawnStone.interact = false
      talkies:clearMessages()
      if not respawnStone.glow then
        respawnStone.glow = true
      end
      talkies.say("Mysterious Stone","Do You Want to Save Progress?",{options={{"Save", function() game:save() end}, {"Don't Save", function() talkies:clearMessages() end}}})
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
