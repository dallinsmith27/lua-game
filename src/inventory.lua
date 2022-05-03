inventory = {}
inventory.isOpen = false
inventory.width = 800
inventory.height = 600
inventory.image = love.graphics.newImage("sprites/inventory.png")
inventory.sword = love.graphics.newImage("sprites/purpleSword.png")
inventory.swordx = cam.x - inventory.width/2 + 75
inventory.swordy = cam.y - inventory.height/2 + 82
inventory.circle = love.graphics.newImage("sprites/circle.png")
inventory.circlex = 0
inventory.circley = 0
function inventory:load()
        -- display sword

end

function inventory:update(dt)

end

function inventory:unload()

end

function inventory:draw()
  if inventory.isOpen then

    love.graphics.draw(inventory.image, cam.x - inventory.width/2  ,cam.y - inventory.height/2 )
    if player.inventory.sword then
      inventory.swordx = cam.x - inventory.width/2 + 75
      inventory.swordy = cam.y - inventory.height/2 + 82
      love.graphics.draw(inventory.sword, inventory.swordx  , inventory.swordy)
      inventory.circlex = inventory.swordx - 7
      inventory.circley = inventory.swordy - 4
      -- display sword
    end
    if player.equippedItem ~= "none" then
      love.graphics.draw(inventory.circle,inventory.circlex ,inventory.circley )
      -- display sword
    end
  end

end
