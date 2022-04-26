map = {}

-- 0 = open world map
-- 1 =
-- 2 =
-- 3 =
-- 4 =
-- 5 =
map.id = 0

map.background = love.graphics.newImage('src/maps/images/testMap.png')

function map:update(dt)
  if map.id == 0 then
    map.background = love.graphics.newImage('src/maps/images/testMap.png')
  end

end

function map:draw()
  love.graphics.draw(map.background, 0, 0)
end


function initializeMaps()

end
