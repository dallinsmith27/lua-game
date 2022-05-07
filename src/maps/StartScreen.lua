mapstart = {}
-- template for map building
--replace all 'start' with the map number
doorsstart = {}
mapstart.id = 0
mapstart.large = false
mapstart.xSize = 2000  --change the size here
mapstart.ySize = 800   -- change the size here
mapstart.background = love.graphics.newImage('sprites/titlepage.png') --replace "mapid2" with your map png



function mapstart.load()
  mapstart.border = world:newRectangleCollider(0,0,mapstart.xSize,mapstart.ySize)
  mapstart.border:setType('static')
  mapstart.border:setCollisionClass('Ignore')


  mapstart.barriers()
  mapstart.interactions()
end

function mapstart.update(dt)
  if game.buttonId == 1 then
    map.id = 1
  end



end

function mapstart.draw()
  love.graphics.draw(mapstart.background, cam.x - mapstart.xSize/2, cam.y - mapstart.ySize/2)
end

function mapstart.unload()
  mapstart.border:destroy()
  for i = #doorsstart,1,-1 do  -- note do not replace this start in front of doors EX. startDoors2
    doorsstart[i]:destroy()
    doorsstart[i] = nil
  end
end

function mapstart.barriers()

end

function mapstart.interactions()
  local start = world:newRectangleCollider(250,400,200,75) --enter the location of exit door
  start:setType('static')
  start:setCollisionClass("button")
  start:setObject(door2)
  start.enter = false
  start.id = 1
  start.px = 250
  start.py = 400
  table.insert(doorsstart, start)
end
