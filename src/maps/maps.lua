map = {}
map.id = 0
map.xSize = 3000
map.ySize = 2000
map.dirX = 0
map.dirY = 0

map.background = love.graphics.newImage('src/maps/images/testMap.png')
map.border = world:newRectangleCollider(0,0,map.xSize,map.ySize)
map.border:setType('dynamic')
map.border:setCollisionClass('Ignore')

map.collider = world:newRectangleCollider(0,0,3000,220)
map.collider:setType('static')
map.collider:setCollisionClass('Wall')


function map:update(dt)

end

function map:draw()


  love.graphics.draw(map.background, px, py)


end
