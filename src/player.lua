

player = {}

player.dir = "down"
player.collider = world:newCircleCollider(300,300,35)
player.speed = 300

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
            --player.anim = player.animations.right
            player.dir = "right"
        end

        if love.keyboard.isDown("left") then
            dirX = -1
            --player.anim = player.animations.left
            player.dir = "left"
        end

        if love.keyboard.isDown("down") then
            dirY = 1
            --player.anim = player.animations.down
            player.dir = "down"
        end

        if love.keyboard.isDown("up") then
            dirY = -1
            --player.anim = player.animations.up
            player.dir = "up"
        end

        player.collider:setLinearVelocity(dirX * player.speed, dirY * player.speed)

        if dirX == 0 and dirY == 0 then
            player.walking = false
            --player.anim:gotoFrame(1)
        else
            player.walking = true
        end

        if player.walking then
            --player.anim:update(dt)
        end

  end
end

function player:draw()
  
end
