
test = {}
test.bool = true
test.num = 9999
test.string = "none"
game = {}
game.startScreen = false
game.buttonId = 0


function love.load()
    math.randomseed(os.time())

    d1 = 0
    d2 = 0
    colliderToggle = false

    require("src/startup/gameStart")
    gameStart()
    love.graphics.setDefaultFilter("nearest", "nearest")
    love.graphics.setBackgroundColor(0.1, 0.5, 0.2)
    map:load()
    --createNewSave()

end

function love.update(dt)

  updateAll(dt)
end

function love.draw()
  cam:attach()
  drawAll()
  cam:detach()
  if test.bool then
    love.graphics.print(test.num)
  end





end

function love.keypressed(key)
  if love.keyboard.isDown("escape") then
    love.event.quit()
  end
  if love.keyboard.isDown("p") then
    player.inventory.sword = true
  end

  if love.keyboard.isDown("e") then
    if inventory.isOpen then
      -- close inventory
      inventory.isOpen = false
      inventory:unload()
    else
      -- open inventory
      inventory.isOpen = true
      inventory:load()

    end
  end


  if love.keyboard.isDown("space") then
    local px = player.collider:getX()
    local py = player.collider:getY()

    if player.dir == "up" then
      py = py - 40
    elseif player.dir == "down" then
      py = py + 40
    elseif player.dir == "left" then
      px = px - 40
    elseif player.dir == "right" then
      px = px + 40
    end

    local query = world:queryCircleArea(px,py,25, {"Door"})

    if #query > 0 then
      for _,w in ipairs(query) do
        
        map.newId = w.id
      end
    end


  end
    --enter all keypress if statements...
    -- this is where the game controls are defined.
end

function love.mousepressed(x, y, b, isTouch)
  if game.startScreen then

    if b == 1 then
      local click  = world:queryCircleArea(love.mouse.getX()-(love.graphics.getWidth()-map.xSize)/2,love.mouse.getY() - (love.graphics.getHeight() - map.ySize) / 2,50,{"button"})
      for _,c in ipairs(click) do
        if c.id == 1 then
          map.newId = 1
          game.startScreen = false
        end
      end
    end
  elseif inventory.isOpen then
    if b == 1 then

      if 323 < y and y < 428 then
        if 630 < x and x < 730 then
          if player.inventory.sword then
            player.equippedItem = "sword"
          --clicked sword
          elseif 780 < x and x < 880 then
            test.string = "bow"
          elseif 927 < x and x < 1026 then
            test.string = "arrow"
          end
      elseif 462 < y and y < 568 then
        if 630 < x and x < 730 then
          test.string = "bomb"
          --clicked\
        elseif 780 < x and x < 880 then
          test.string = "boomerang"
        elseif 927 < x and x < 1026 then
          test.string = "other"
        end
      end
      test.string = player.equippedItem
      --local click  = world:queryCircleArea(love.mouse.getX(),love.mouse.getY(),25,{"button"})
      --for _,c in ipairs(click) do
          --player.equippedItem = c.name
      --end
    end
  end
end
end

function distanceBetween(x1,y1,x2,y2)
  local d = math.sqrt((x2-x1)^2+(y2-y1)^2)
  return d
end
