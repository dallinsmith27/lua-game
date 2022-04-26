function love.load()
    math.randomseed(os.time())

    d1 = 0
    d2 = 0
    colliderToggle = false

    require("src/startup/gameStart")
    gameStart()
    --createNewSave()

end

function love.update(dt)
  updateAll(dt)
end

function love.draw()

end

function love.keypressed(key)
    --enter all keypress if statements...
    -- this is where the game controls are defined.
end
