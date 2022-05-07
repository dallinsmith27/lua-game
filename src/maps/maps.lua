map = {}
map.id = 1
map.newId = 1
map.xSize = 3000
map.ySize = 2000
map.large = true
map.walls = {}
map.doors = {}
gameMap = sti("src/maps/test1.lua")
function map:load()
  if gameMap.layers["doors"] then
    for i, obj in pairs(gameMap.layers["doors"].objects) do
      local door = world:newRectangleCollider(obj.x,obj.y,obj.width,obj.height)
      door:setCollisionClass("Door")
      door:setType("static")
      door.id = obj.properties["mapID"] + 0
      table.insert(map.doors,door)
    end
  end
  if gameMap.layers["walls"] then
    for i, obj in pairs(gameMap.layers["walls"].objects) do
      local wall = world:newRectangleCollider(obj.x,obj.y,obj.width,obj.height)
      wall:setCollisionClass("Wall")
      wall:setType("static")
      table.insert(map.walls,wall)
    end
  end
end

function map.update(dt)

  if map.newId ~= map.id then
    map:unload()
    if map.newId == 420 then

      gameMap = sti("src/maps/test2.lua")
      map:load()
      map.id = map.newId
    elseif map.newId == 69 then
      gameMap = sti("src/maps/test1.lua")
      map:load()
      map.id = map.newId
    end




  end
end


function map.draw()
  --for _,l in ipairs(gameMap.layers) do
  --  if l ~= "walls" then
  --    gameMap:drawLayer(l)
  --  end
  --end
  gameMap:drawLayer(gameMap.layers["Tile Layer 1"])
  gameMap:drawLayer(gameMap.layers["trees"])
end

function map:unload()
  if #map.doors > 0 then
    for _, door in pairs(map.doors) do
      door:destroy()
    end
    map.doors = nil
    map.doors = {}
  end


  if #map.walls > 0 then
    for _, wall in pairs(map.walls) do
      wall:destroy()
    end
    map.walls = nil
    map.walls = {}
  end
  --for _,d in ipairs(map.doors) do
    --d:destroy
  --end
end
