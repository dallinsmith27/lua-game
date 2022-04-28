


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
end

function love.keypressed(key)
    --enter all keypress if statements...
    -- this is where the game controls are defined.
end
