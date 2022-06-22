function updateAll(dt)
  if not game.startScreen then
    player:update(dt)
  end

  map:update(dt)
  cam:update(dt)
  world:update(dt)
  flux.update(dt)
  talkies.update(dt)
  phase:update(dt)
end
