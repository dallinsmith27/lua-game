map = {}
map.id = 1
map.newId = 1
map.xSize = 3000
map.ySize = 2000
map.large = true
map.walls = {}
map.doors = {}
map.items = {}
map.npcs = {}
gameMap = sti("src/maps/testmap1.lua")

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
      player:changePos(520,575)
      spawnItem(600,600,"heart",map.items)
      spawnItem(600,700,"addHeart",map.items)
      spawnItem(600,780,"bronzeCoin",map.items)

      spawnNpc(1000,1000,"cow",map.npcs)
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

  if #map.items > 0 then
    for n, item in pairs(map.items) do
      if item.dead then
        item:destroy()
        table.remove(map.items,n)
      else
        item:update()
      end
    end
  end
  if #map.npcs > 0 then
    for n, npc in pairs(map.npcs) do
      if npc.dead then
        npc:destroy()
        table.remove(map.npcs,n)
      else
        npc:update()
      end

    end
  end
end


function map.draw()
  test.num = 0
  for _,l in ipairs(gameMap.layers) do
    if l.type == "tilelayer" then
    
     gameMap:drawLayer(gameMap.layers[l.name])
    end
  end



  if #map.items > 0 then
    for _, item in pairs(map.items) do
      item:draw()
    end

  end

  if #map.npcs > 0 then
    for _, npc in pairs(map.npcs) do
      npc:draw()
    end

  end

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

  if #map.items > 0 then
    for _, item in pairs(map.items) do
      item:destroy()

    end
    map.items = nil
    map.items = {}
  end

  if #map.npcs > 0 then
    for _, npc in pairs(map.npcs) do
      npc:destroy()

    end
    map.npcs = nil
    map.npcs = {}
  end

end
