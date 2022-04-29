map = {}
map.id = 0
map.newId = 1
map.xSize = 3000
map.ySize = 2000
map.large = true

function map:update(dt)
  if map.newId ~= map.id then
    -- switch map
    if map.id == 0 then

    elseif map.id == 1 then
      --player.collider:destroy()
      map1.unload()
      --player.collider = world:newCircleCollider(doors2[1].px,doors2[1].py,25)
    elseif map.id == 2 then
      map2.unload()
    end

    if map.newId == 1 then
      map1.load()
      map1.update()
      map.xSize = map1.xSize
      map.ySize = map1.ySize
      map.large = map1.large
    elseif map.newId == 2 then
      map2.load()
      map2.update()
      map.xSize = map2.xSize
      map.ySize = map2.ySize
      map.large = map2.large

    end

    map.id = map.newId

  else
    if map.id == 1 then
      map1.update()
    elseif map.id == 2 then
      map2.update()
    end
  end
end

function map:draw()
  if map.id == 1 then
    map1.draw()
  elseif map.id == 2 then
    map2.draw()
  end


end
