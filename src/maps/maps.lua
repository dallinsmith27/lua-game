map = {}
map.id = 1
map.newId = 1
map.xSize = 3000
map.ySize = 2000
map.large = true
map.walls = {}
map.doors = {}
gameMap = sti("src/maps/map1.lua")
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

    if map.newId == 1 then
      map:unload()
      gameMap = sti("src/maps/map1.lua")
      map:load()
      map.id = map.newId
      player:changePos(450,500)
    elseif map.newId == 2 then
      map:unload()
      gameMap = sti("src/maps/map2.lua")
      map:load()
      map.id = map.newId
      player:changePos(450,550)
    elseif map.newId == 3 then
      if player.inventory.key then
        map:unload()
        player.inventory.key = false
        gameMap = sti("src/maps/map3.lua")
        map:load()
        map.id = map.newId
        player:changePos(0,0)
      else
        map.newId = map.id
      end
    end




  end
end


function map.draw()
  --for _,l in ipairs(gameMap.layers) do
  --  if l ~= "walls" then
  --    gameMap:drawLayer(l)
  --  end
  --end
  gameMap:drawLayer(gameMap.layers["base"])
  gameMap:drawLayer(gameMap.layers["other"])
  --gameMap:drawLayer(gameMap.layers["trees"])
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
