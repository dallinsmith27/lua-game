function drawAll()

  map.draw()
  if not game.startScreen then
    player:draw()
  end
  if game.hitBoxes then
    world:draw()
  end
  inventory:draw()
  talkies.draw()
end
