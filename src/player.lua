

player = {}
sprites = {}
player.dir = "down"
player.collider = world:newCircleCollider(300,300,35)
player.speed = 300
player.animSpeed = 0.08
sprites.walkSheet = love.graphics.newImage("sprites/stickman_spritesheet.png")
player.animations = {}
player.height = 64
player.width = 32
player.grid = anim8.newGrid(player.width, player.height, sprites.walkSheet:getWidth(), sprites.walkSheet:getHeight())
player.animations.walkDown = anim8.newAnimation(player.grid('1-9', 1), player.animSpeed)
player.animations.walkLeft = anim8.newAnimation(player.grid('1-9', 2), player.animSpeed)
player.animations.walkRight = anim8.newAnimation(player.grid('1-9', 3), player.animSpeed)
player.animations.walkUp = anim8.newAnimation(player.grid('1-9', 4), player.animSpeed)
player.anim = player.animations.walkDown


-- 0 = Normal gameplay
-- 10 = Damage stun
-- 12 = Transition
player.state = 0
--player.sprite = love.graphics.newImage('sprites/')

function player:update(dt)

  if player.state == 0 then

        local dirX = 0
        local dirY = 0

        if love.keyboard.isDown("right") then
            dirX = 1
            player.anim = player.animations.walkRight
            player.dir = "right"
        end

        if love.keyboard.isDown("left") then
            dirX = -1
            player.anim = player.animations.walkLeft
            player.dir = "left"
        end

        if love.keyboard.isDown("down") then
            dirY = 1
            player.anim = player.animations.walkDown
            player.dir = "down"
        end

        if love.keyboard.isDown("up") then
            dirY = -1
            player.anim = player.animations.walkUp
            player.dir = "up"
        end

        player.collider:setLinearVelocity(dirX * player.speed, dirY * player.speed)

        if dirX == 0 and dirY == 0 then
            player.walking = false
            player.anim:gotoFrame(1)
        else
            player.walking = true
        end

        if player.walking then
            player.anim:update(dt)
        end

  end
end

function player:draw()
    local px = player.collider:getX() - player.width / 2
    local py = player.collider:getY() - player.height / 2
    player.anim:draw(sprites.walkSheet, px, py)
  
end
