map1 = {}
map1.npc = {}
map1.enemy = {}
doors = {}
map1.id = 1
map1.xSize = 3000
map1.ySize = 2000
map1.large = true
map1.background = love.graphics.newImage('src/maps/images/testMap.png')
brickHouse = love.graphics.newImage('sprites/brick house.png')
fence = love.graphics.newImage('sprites/fence.png')
fenceUp = love.graphics.newImage('sprites/fenceUp.png')
defaultHouse = love.graphics.newImage('sprites/defaultHouse.png')


function map1.load()
  map1.border = world:newRectangleCollider(0,0,map1.xSize,map1.ySize)
  map1.border:setType('static')
  map1.border:setCollisionClass('Ignore')

  map1.collider = world:newRectangleCollider(0,0,3000,220)
  map1.collider:setType('static')
  map1.collider:setCollisionClass('Wall')



  map1.barriers()
  map1.interactions()
  map1.setNpc()
  map1.setEnemies()

  for i = #map1.npc,1,-1 do
    map1.npc[i]:load()
  end

  for i = #map1.enemy,1,-1 do
    map1.enemy[i]:load()
  end
end

function map1.update(dt)
  for i = #map1.npc,1,-1 do
    map1.npc[i].update(dt)
  end

  for i = #map1.enemy,1,-1 do
    map1.enemy[i].update()
  end

end

function map1.draw()


  love.graphics.draw(map1.background, 0, 0)
  love.graphics.draw(brickHouse, house1:getX()-100, house1:getY()-60)
  love.graphics.draw(brickHouse, house2:getX()-100, house2:getY()-60)
  love.graphics.draw(defaultHouse, house4:getX()-150, house4:getY()-75)
  love.graphics.draw(brickHouse, house3:getX()-100, house3:getY()-60)
  love.graphics.draw(fence, fence6:getX()-100, fence6:getY()-55)
  love.graphics.draw(fence, fence7:getX()-100, fence7:getY()-55)
  love.graphics.draw(fence, fence8:getX()-100, fence8:getY()-55)
  love.graphics.draw(fenceUp, fence4:getX()-10, fence4:getY()-125)
  love.graphics.draw(fenceUp, fence5:getX()-10, fence5:getY()-125)

  love.graphics.draw(fence, fence1:getX()-100, fence1:getY()-55)
  love.graphics.draw(fence, fence2:getX()-100, fence2:getY()-55)
  love.graphics.draw(fence, fence3:getX()-100, fence3:getY()-55)

  for i = #map1.npc,1,-1 do
    map1.npc[i].draw()
  end
  for i = #map1.enemy,1,-1 do
    map1.enemy[i].draw()
  end

end

function map1.unload()
  map1.border:destroy()
  map1.collider:destroy()
  house1:destroy()
  house2:destroy()
  house3:destroy()
  for i = #doors,1,-1 do
    doors[i].collider:destroy()
    doors[i] = nil
  end

  for i = #map1.npc,1,-1 do
    map1.npc[i].destroy()
    map1.npc[i] = nil
  end

  for i = #map1.enemy,1,-1 do
    map1.enemy[i].destroy()
    map1.enemy[i] = nil
  end

end

function map1.barriers()
  house1 = world:newRectangleCollider(500,500,200,120)
  house1:setType('static')
  house1:setCollisionClass('Wall')

  house2 = world:newRectangleCollider(500,700,200,120)
  house2:setType('static')
  house2:setCollisionClass('Wall')

  house3 = world:newRectangleCollider(500,900,200,120)
  house3:setType('static')
  house3:setCollisionClass('Wall')

  house4 = world:newRectangleCollider(500,1200,300,150)
  house4:setType('static')
  house4:setCollisionClass('Wall')

  fence1 = world:newRectangleCollider(1000,1000,196,30)
  fence1:setType('static')
  fence1:setCollisionClass('Wall')

  fence2 = world:newRectangleCollider(1196,1000,196,30)
  fence2:setType('static')
  fence2:setCollisionClass('Wall')

  fence3 = world:newRectangleCollider(1196+196,1000,196,30)
  fence3:setType('static')
  fence3:setCollisionClass('Wall')

  fence4 = world:newRectangleCollider(1196+370,750,20,250)
  fence4:setType('static')
  fence4:setCollisionClass('Wall')

  fence5 = world:newRectangleCollider(1000,750,20,250)
  fence5:setType('static')
  fence5:setCollisionClass('Wall')

  fence6 = world:newRectangleCollider(1000,750,196,30)
  fence6:setType('static')
  fence6:setCollisionClass('Wall')

  fence7 = world:newRectangleCollider(1196,750,196,30)
  fence7:setType('static')
  fence7:setCollisionClass('Wall')

  fence8 = world:newRectangleCollider(1196+196,750,196,30)
  fence8:setType('static')
  fence8:setCollisionClass('Wall')


end

function map1.interactions()
  local door1 = {}
  door1.collider = world:newRectangleCollider(580,560,40,60)
  door1.collider:setType('static')
  door1.collider:setCollisionClass("Door")
  door1.collider:setObject(door1)
  door1.collider.enter = false
  door1.collider.id = 2
  table.insert(doors, door1)

  local door2 = {}
  door2.collider = world:newRectangleCollider(580,760,40,60)
  door2.collider:setType('static')
  door2.collider:setCollisionClass("Door")
  door2.collider:setObject(door2)
  door2.collider.enter = false
  door2.collider.id = 2
  table.insert(doors, door2)
end

function map1.setNpc()
  for i=1,4 do
    spawnNpc(1100 + 100*i,800,"cow",map1.npc)
  end

  function map1.setEnemies()

      --spawnEnemy(1500,1500,"glitch1",map1.enemy)
      spawnEnemy(1500,1500,"error", map1.enemy)
    end
end
