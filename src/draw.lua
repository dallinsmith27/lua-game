function drawAll()

  map.draw()
  if not game.startScreen then
    player:draw()
  end
  world:draw()
end
