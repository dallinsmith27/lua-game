function updateAll(dt)
  cam:attach()
  player:update(dt)
  map:update(dt)
  cam:update(dt)
  world:update(dt)
  cam:detach()
end
