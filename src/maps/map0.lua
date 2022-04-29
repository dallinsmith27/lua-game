map# = {}
-- template for map building
--replace all '#' with the map number
doors# = {}
map#.id = #
map#.large = false
map#.xSize = 1400  --change the size here
map#.ySize = 700   -- change the size here
map#.background = love.graphics.newImage('src/maps/images/mapid2.png') --replace "mapid2" with your map png



function map#.load()
  map#.border = world:newRectangleCollider(0,0,map#.xSize,map#.ySize)
  map#.border:setType('static')
  map#.border:setCollisionClass('Ignore')


  map#:barriers()
  map#:interactions()
end

function map#:update(dt)




end

function map#:draw()
  love.graphics.draw(map#.background, 0, 0)
end

function map#.unload()
  map#.border:destroy()
  for i = #doors#,1,-1 do  -- note do not replace this # in front of doors EX. #Doors2
    doors#[i]:destroy()
    doors#[i] = nil
  end
end

function map#:barriers()

end

function map#:interactions()
  local door1 = world:newRectangleCollider(680,700,40,60) --enter the location of exit door
  door1:setType('static')
  door1:setCollisionClass("Door")
  door1:setObject(door2)
  door1.enter = false
  door1.id = 1
  door1.px = 460
  door1.py = 760 - 60/2
  table.insert(doors#, door1)
end
