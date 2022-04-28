map = {}
map.id = 0
map.newId = 1
map.xSize = 3000
map.ySize = 2000

function map:update(dt)
  if map.newId ~= map.id then
    -- switch map
    if map.id == 0 then

    elseif map.id == 1 then
      map1.unload()
    elseif map.id == 2 then
      --map2.unload()
    end

    if map.newId == 1 then
      map1.load()
      map1.update()
      map.xSize = map1.xSize
      map.ySize = map1.xSize
    elseif map.newId == 2 then
      --map2.load()
    end

    map.id = map.newId

  else
    if map.id == 1 then
      map1.update()
    elseif map.id == 2 then

    end
  end
end

function map:draw()
  if map.id == 1 then
    map1.draw()
  elseif map.id == 2 then

  end

end
