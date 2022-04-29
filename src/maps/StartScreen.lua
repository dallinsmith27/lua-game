mapstart = {}
-- template for map building
--replace all 'start' with the map number
doorsstart = {}
mapstart.id = 0
mapstart.large = false
mapstart.xSize = 1400  --change the size here
mapstart.ySize = 700   -- change the size here
mapstart.background = love.graphics.newImage('src/maps/images/StartPage.png') --replace "mapid2" with your map png



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
  love.graphics.draw(mapstart.background, 0, 0)
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
  local start = world:newRectangleCollider(250,400,300,100) --enter the location of exit door
  start:setType('static')
  start:setCollisionClass("button")
  start:setObject(door2)
  start.enter = false
  start.id = 1
  start.px = 250
  start.py = 400
  table.insert(doorsstart, start)
end
