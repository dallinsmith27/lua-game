love.window.setTitle( "LuaGame - Velocity Corrected" )

test = {}
test.bool = true
test.num = 9999
test.string = "none"
game = {}
game.startScreen = false
game.buttonId = 0
game.scale = 1.5
game.phase = 0

test.showPlayerXY = false
game.player_x = 0
game.player_y = 0

function game:save()
  talkies:clearMessages()
end



function love.load()


  math.randomseed(os.time())

  d1 = 0
  d2 = 0
  colliderToggle = false

  require("src/startup/gameStart")
  gameStart()
  love.graphics.setDefaultFilter("nearest", "nearest")
  love.graphics.setBackgroundColor(1, .9, .9)
  map:load()
  --createNewSave()

  talkies.font = love.graphics.newFont("libraries/talkies/example/assets/fonts/Pixel UniCode.ttf", 32)
  talkies.font:setFallbacks(love.graphics.newFont("libraries/talkies/example/assets/fonts/JPfallback.ttf", 32)) -- Add font fallbacks for Japanese characters

  -- Audio from bfxr (https://www.bfxr.net/)
  talkies.talkSound = love.audio.newSource("libraries/talkies/example/assets/sfx/talk.wav", "static")
  talkies.optionOnSelectSound = love.audio.newSource("libraries/talkies/example/assets/sfx/optionSelect.wav", "static")
  talkies.optionSwitchSound = love.audio.newSource("libraries/talkies/example/assets/sfx/optionSwitch.wav", "static")




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
  if test.showPlayerXY then
    love.graphics.print("X: ", 0, 20)
    love.graphics.print("Y: ", 0, 40)
    love.graphics.print(string.format('%.02f', game.player_x), 25, 20)
    love.graphics.print(string.format('%.02f',game.player_y), 25, 40)
  end





end

function love.keypressed(key)
  if love.keyboard.isDown("escape") then
    love.event.quit()
  end
  if love.keyboard.isDown("p") then
    player.inventory.sword = true
    player.inventory.key = true
  end
  --below keybind sends to the start map which begins tutorial
  if love.keyboard.isDown("m") and love.keyboard.isDown("0") then
    map.newId = 0
  end
  --sends to farm/cemetery map
  if love.keyboard.isDown("m") and love.keyboard.isDown("1") then
    map.newId = 1
  end
  --sends to interior of house on farm/cemetery map
  if love.keyboard.isDown("m") and love.keyboard.isDown("2") then
    map.newId = 2
  end
  --doesn't change where the player is, but seems to spawn in another glitch character and restart the timer.
  if love.keyboard.isDown("m") and love.keyboard.isDown("3") then
    map.newId = 3
  end
  -- 4-9 do not seem to change the map, but stop the timer at 5 and spawn in a glitch then continually spawn in glitches.
  if love.keyboard.isDown("m") and love.keyboard.isDown("4") then
    map.newId = 4
  end
  if love.keyboard.isDown("m") and love.keyboard.isDown("5") then
    map.newId = 5
  end
  if love.keyboard.isDown("m") and love.keyboard.isDown("6") then
    map.newId = 6
  end
  if love.keyboard.isDown("m") and love.keyboard.isDown("7") then
    map.newId = 7
  end
  if love.keyboard.isDown("m") and love.keyboard.isDown("8") then
    map.newId = 8
  end
  if love.keyboard.isDown("m") and love.keyboard.isDown("9") then
    map.newId = 9
  end

  if love.keyboard.isDown(",") and love.keyboard.isDown("l") then
    test.showPlayerXY = not test.showPlayerXY
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


  if love.keyboard.isDown("space") and not player.dead then
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
    query = nil

    local query = world:queryCircleArea(px,py,25, {"respawnStone"})

    if #query > 0 then
      for _,s in ipairs(query) do
        s.interact = true

      end
    end
    query = nil
    --local cows = world:queryCircleArea(px,py,25, {"cow"})
    --local items = world:queryCircleArea(px,py,25, {"item"})
    --if #items > 0 then
      --for _,i in ipairs(items) do
        --player.inventory:add(i.name)
        --i.dead = true
      --end
    --end
  end
    --enter all keypress if statements...
    -- this is where the game controls are defined.yucky

  if key == 'y' then
    player.state = 0
    talkies.clearMessages()
  end

  if love.keyboard.isDown("t") then
    talkies.say(
      "Tutorial",
      "Typing sound is aligned with the text speed...",
      { textSpeed = "slow" }
    )
  end

  if key == "space" then talkies.onAction()
  elseif key == "w" then talkies.prevOption()
  elseif key == "s" then talkies.nextOption()
    end

end

function love.mousepressed(x, y, b, isTouch)
  if b == 2 then
    player:useItem()
  end
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
      local w = love.graphics.getWidth()
      local h = love.graphics.getHeight()
      test.num = h/2-330
      test.num = y

      if h/2-220 < y and y < h/2-111 then
        if w/2 - 330 < x and x < w/2-225 then
          if player.inventory.sword then
            player.equippedItem = "sword"
          --clicked sword
          elseif 780 < x and x < 880 then
            test.string = "bow"
          elseif 927 < x and x < 1026 then
            test.string = "arrow"
          end
      elseif h/2-82< y and y < h/2+25 then
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
