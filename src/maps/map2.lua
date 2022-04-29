map2 = {}

doors2 = {}
map2.id = 2
map2.large = false
map2.xSize = 1400
map2.ySize = 700
map2.background = love.graphics.newImage('src/maps/images/mapid2.png')



function map2.load()
  map2.border = world:newRectangleCollider(0,0,map2.xSize,map2.ySize)
  map2.border:setType('static')
  map2.border:setCollisionClass('Ignore')


  map2.barriers()
  map2.interactions()
end

function map2.update(dt)



end

function map2.draw()
  love.graphics.draw(map2.background, 0, 0)
end

function map2.unload()
  map2.border:destroy()
  for i = #doors2,1,-1 do
    doors2[i]:destroy()
    doors2[i] = nil
  end
end

function map2.barriers()

end

function map2.interactions()
  local door1 = world:newRectangleCollider(680,700,40,60)
  door1:setType('static')
  door1:setCollisionClass("Door")
  door1:setObject(door2)
  door1.enter = false
  door1.id = 1
  door1.px = 460
  door1.py = 760 - 60/2
  table.insert(doors2, door1)
end
