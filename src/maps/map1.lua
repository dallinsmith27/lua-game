map1 = {}

doors = {}
map1.id = 1
map1.xSize = 3000
map1.ySize = 2000
map1.large = true
map1.background = love.graphics.newImage('src/maps/images/testMap.png')
brickHouse = love.graphics.newImage('sprites/brick house.png')


function map1.load()
  map1.border = world:newRectangleCollider(0,0,map1.xSize,map1.ySize)
  map1.border:setType('static')
  map1.border:setCollisionClass('Ignore')

  map1.collider = world:newRectangleCollider(0,0,3000,220)
  map1.collider:setType('static')
  map1.collider:setCollisionClass('Wall')

  barriers()
  interactions()
end

function map1.update(dt)



end

function map1.draw()


  love.graphics.draw(map1.background, 0, 0)
  love.graphics.draw(brickHouse, house1:getX()-100, house1:getY()-60)
  love.graphics.draw(brickHouse, house2:getX()-100, house2:getY()-60)
  love.graphics.draw(brickHouse, house3:getX()-100, house3:getY()-60)

end

function map1.unload()
  map1.border:destroy()
  map1.collider:destroy()
  house1:destroy()
  house2:destroy()
  house3:destroy()
  for i = #doors,1,-1 do
    doors[i]:destroy()
    doors[i] = nil
  end
end

function barriers()
  house1 = world:newRectangleCollider(500,500,200,120)
  house1:setType('static')
  house1:setCollisionClass('Wall')

  house2 = world:newRectangleCollider(500,700,200,120)
  house2:setType('static')
  house2:setCollisionClass('Wall')

  house3 = world:newRectangleCollider(500,900,200,120)
  house3:setType('static')
  house3:setCollisionClass('Wall')
end

function interactions()
  local door1 = world:newRectangleCollider(580,560,40,60)
  door1:setType('static')
  door1:setCollisionClass("Door")
  door1:setObject(door1)
  door1.enter = false
  door1.id = 2
  table.insert(doors, door1)

  local door2 = world:newRectangleCollider(580,760,40,60)
  door2:setType('static')
  door2:setCollisionClass("Door")
  door2:setObject(door2)
  door2.enter = false
  door2.id = 2
  table.insert(doors, door2)
end
