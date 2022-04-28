map1 = {}
map1.id = 1
map1.xSize = 3000
map1.ySize = 2000
map1.background = love.graphics.newImage('src/maps/images/testMap.png')


function map1.load()
  map1.border = world:newRectangleCollider(0,0,map1.xSize,map1.ySize)
  map1.border:setType('static')
  map1.border:setCollisionClass('Ignore')

  map1.collider = world:newRectangleCollider(0,0,3000,220)
  map1.collider:setType('static')
  map1.collider:setCollisionClass('Wall')
end

function map1:update(dt)

end

function map1:draw()


  love.graphics.draw(map1.background, px, py)


end

function map1.unload()
  map1.border:destroy()
  map1.collider:destroy()
end
