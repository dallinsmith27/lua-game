
test = {}
test.bool = false
test.num = 9999
game = {}
game.startScreen = true
game.buttonId = 0


function love.load()
    math.randomseed(os.time())

    d1 = 0
    d2 = 0
    colliderToggle = false

    require("src/startup/gameStart")
    gameStart()
    love.graphics.setBackgroundColor(0.1, 0.5, 0.2)
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
  end
end
