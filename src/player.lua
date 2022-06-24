

player = {}
sprites = {}
player.move = false
player.dir = "down"
player.rightWall = 600
player.leftWall = 100
player.upWall = 100
player.downWall = 400
player.walking = false
player.collider = {}

player.height = 50
player.width = 20

player.collider = world:newBSGRectangleCollider(-100,-400,player.width,player.height,5)
player.x = player.collider:getX()
player.y = player.collider:getY()
player.respawnX = 0
player.respawnY = 0
player.respawnMap = 1
player.collider:setMass(1)
player.collider:setFixedRotation(true)
player.collider:setCollisionClass("Player")
player.collider:setLinearDamping(1)


player.dead = false
player.hearts = 3
player.prevHealth = 0
player.health = 12
player.healthCounter = 0
player.maxHealth = player.hearts * 4
player.stunTimer = 0
player.money = 0
player.maxMoney = 999

player.coinImage = love.graphics.newImage("sprites/coinImage.png")
player.heartImage = love.graphics.newImage("sprites/fullHeart.png")
player.halfHeartImage = love.graphics.newImage("sprites/halfHeart.png")
player.quarterHeartImage = love.graphics.newImage("sprites/1-4Heart.png")
player.threeQuarterHeartImage = love.graphics.newImage("sprites/3-4Heart.png")
player.emptyHeartImage = love.graphics.newImage("sprites/emptyHeart.png")

player.speed = 200
player.sprintMod = 1
player.animSpeed = 0.08
sprites.walkSheet = love.graphics.newImage("sprites/stickman_spritesheet.png")
player.animations = {}

player.grid = anim8.newGrid(32, 64, sprites.walkSheet:getWidth(), sprites.walkSheet:getHeight())
player.animations.walkDown = anim8.newAnimation(player.grid('1-9', 1), player.animSpeed)
player.animations.walkLeft = anim8.newAnimation(player.grid('1-9', 2), player.animSpeed)
player.animations.walkRight = anim8.newAnimation(player.grid('1-9', 3), player.animSpeed)
player.animations.walkUp = anim8.newAnimation(player.grid('1-9', 4), player.animSpeed)
player.anim = player.animations.walkDown
player.inventory = {}
player.inventory.sword = false
player.inventory.key = false
player.equippedItem = "none"
player.companion = true

-- 0 = Normal gameplay
-- 10 = Damage stun
-- 12 = Transition
player.state = 9999
--player.sprite = love.graphics.newImage('sprites/')
player.name = "player"

function player:update(dt)
  if player.health <= 0 then
    player.dead = true
    player.state = 9999
  end

  player.x = player.collider:getX()
  player.y = player.collider:getY()

  --test.num = player.x

  if player.collider:enter("item") then
    local collision_data = player.collider:getEnterCollisionData('item')
    player.inventory:add(collision_data.collider.name)
    collision_data.collider.dead = true
  end
  if player.collider:enter("fog") then
    player.health = player.health - 1

  end

  if player.state == 0 then

    if love.keyboard.isDown("lshift") then
      player.sprintMod = 5
    else
      player.sprintMod = 1
    end

test.num = player.speed

        local dirX = 0
        local dirY = 0

        if love.keyboard.isDown("d") then
          dirX = 1
          player.anim = player.animations.walkRight
          player.dir = "right"
        end

        if love.keyboard.isDown("a") then
          dirX = -1
          player.anim = player.animations.walkLeft
          player.dir = "left"
        end

        if love.keyboard.isDown("s") then
          dirY = 1
          player.anim = player.animations.walkDown
          player.dir = "down"
        end

        if love.keyboard.isDown("w") then
          dirY = -1
          player.anim = player.animations.walkUp
          player.dir = "up"
        end

        -- if love.keyboard.isDown("lshift") then
        --   player.animSpeed = player.animSpeed * (6/8)
        --   player.speed = 800
        -- end



        player.collider:setLinearVelocity(dirX * player.speed * player.sprintMod, dirY * player.speed * player.sprintMod)

        if dirX == 0 and dirY == 0 then
            player.walking = false
            player.anim:gotoFrame(1)
        else
            player.walking = true
        end

        if player.walking then
            player.anim:update(dt)
        end
  elseif player.state == 10 then
    player.stunTimer = player.stunTimer - dt
    if player.stunTimer <=0 then
      player.state = 0
    end
  elseif player.state == 9999 then
    if love.keyboard.isDown("d") and love.keyboard.isDown("7") and love.keyboard.isDown("s")then
      if game.phase < 3 then
        game.phase = 3
        player.state = 0
        phase.continue = true
        talkies.clearMessages()
      end
    elseif player.dead then
      talkies.say("Game Over","Game Over \n lolz u died haha",{options={{"Respawn", function() player:respawn() game.phase = 2 end}, {"Quit", function() love.event.quit() end}}})
    end

    --player cannot move
  end


end

function player:draw()
    local px = player.collider:getX() - 32 / 2
    local py = player.collider:getY() - 64 / 2
    player.anim:draw(sprites.walkSheet, px, py)



    local topx = ((cam.x - 60)*game.scale + love.graphics.getWidth()/2)/game.scale
    local topy = (cam.y * game.scale - love.graphics.getHeight()/2 + 10)/game.scale

--displays the coins the player has on the HUD
--the last two values on each line control scaling x and y respectively
    love.graphics.draw( player.coinImage, topx - (.85 * player.heartImage:getWidth()), 22 + topy + player.heartImage:getHeight(), 0, .5, .5)
    love.graphics.print("x", topx - (.5 * player.heartImage:getWidth()), 18 + topy + player.heartImage:getHeight(), 0, .7, .7)
    love.graphics.print( player.money, topx - (.1 * player.heartImage:getWidth()), 10 + topy + player.heartImage:getHeight(), 0, 1, 1)

    local drawn = 0
    local newHealth = player.prevHealth
    if player.healthCounter == 10 then
      player.healthCounter = 0
      if player.prevHealth > player.health then
        newHealth = player.prevHealth - 1
        player.prevHealth = player.prevHealth - 1
      elseif player.prevHealth < player.health then
        newHealth = player.prevHealth + 1
        player.prevHealth = player.prevHealth + 1
      end
    end
    player.healthCounter = player.healthCounter +1



    for i=1,player.hearts do
      if player.prevHealth >= 4 * i then
        love.graphics.draw(player.heartImage,topx,topy)
        topx = topx - 60
        newHealth = newHealth - 4
        drawn = drawn+1
      end
    end


    if newHealth == 3 then
      love.graphics.draw(player.threeQuarterHeartImage, topx, topy)
      newHealth = newHealth - 3
      drawn = drawn+1
      topx = topx - 60
  elseif newHealth == 2 then
      love.graphics.draw(player.halfHeartImage, topx, topy)
      newHealth = newHealth - 2
      drawn = drawn+1
      topx = topx - 60
    elseif newHealth == 1 then
      love.graphics.draw(player.quarterHeartImage, topx, topy)
      newHealth = newHealth - 1
      drawn = drawn+1
      topx = topx - 60
    end
    while drawn < player.maxHealth/4 do
      love.graphics.draw(player.emptyHeartImage, topx, topy)
      drawn = drawn+1
      topx = topx - 60
    end




end

function player:damage(damage,knockback,stun)
  player.state = 10
  knockback = knockback*player.speed*2
  player.stunTimer = stun
  player.health = player.health - damage
  player.collider:setLinearVelocity(knockback:unpack())

end

function player.collider:damage(damage,knockback,stun)
  player.state = 10
  knockback = knockback*player.speed*2
  player.stunTimer = stun
  player.health = player.health - damage
  player.collider:setLinearVelocity(knockback:unpack())
end

function player:changePos(x, y)
  player.collider:destroy()
  player.collider = world:newBSGRectangleCollider(x,y,player.width,player.height,5)
  player.collider:setMass(1)
  player.collider:setFixedRotation(true)
  player.collider:setCollisionClass("Player")
  player.collider:setLinearDamping(1)



end

function player.inventory:add(item)
  if item == "heart" then
    player.health = player.health + 4
    if player.health > player.maxHealth then
      player.health = player.maxHealth
    end
  elseif item == "addHeart" then
    player.hearts = player.hearts +1
    player.maxHealth = player.hearts * 4
    player.health = player.maxHealth
  elseif item == "blackHeart" then
    player.health = player.health - 4
  elseif item == "bronzeCoin" then
    player.money = player.money + 1
    if player.money > player.maxMoney then
      player.money = player.maxMoney
    end
  elseif item == "silverCoin" then
    player.money = player.money + 25
    if player.money > player.maxMoney then
      player.money = player.maxMoney
    end
  elseif item == "goldCoin" then
    player.money = player.money + 100
    if player.money > player.maxMoney then
      player.money = player.maxMoney
    end
  end


end

function player:useItem()
  if player.equippedItem == "none" then

  elseif player.equippedItem == "sword" then

  end
end

function player:invertCompanion()
  player.companion = not player.companion
end

function player:respawn()
  talkies.clearMessages()
  player.dead = false
  player.health = player.maxHealth
  player.state = 0
  player:changePos(player.respawnX,player.respawnY)
  map.newId = player.respawnMap
end
