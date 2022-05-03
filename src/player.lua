

player = {}
sprites = {}
player.x = 275
player.y = 300
player.dir = "down"
player.rightWall = 600
player.leftWall = 100
player.upWall = 100
player.downWall = 400
player.walking = false
player.collider = world:newCircleCollider(player.x,player.y,25)
player.collider:setCollisionClass("Player")


player.speed = 250
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
player.inventory = {}
player.inventory.sword = false


-- 0 = Normal gameplay
-- 10 = Damage stun
-- 12 = Transition
player.state = 0
--player.sprite = love.graphics.newImage('sprites/')

function player:update(dt)
  player.x = player.collider:getX() - player.width / 2
  player.y = player.collider:getY() - player.height / 2

  if player.state == 0 then

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
