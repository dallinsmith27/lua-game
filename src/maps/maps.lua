map = {}
map.id = -1
map.newId = 0
map.xSize = 3000
map.ySize = 2000
map.large = true
map.walls = {}
map.doors = {}
map.items = {}
map.npcs = {}
map.enemies = {}
map.playerX = 0
map.playerY = 0
gameMap = sti("src/maps/testmap1.lua")

function map:load()

  if gameMap.layers["doors"] then
    for i, obj in pairs(gameMap.layers["doors"].objects) do
      local door = world:newRectangleCollider(obj.x,obj.y,obj.width,obj.height)
      door:setCollisionClass("Door")
      door:setType("static")
      door.id = obj.properties["mapID"]
      door.newX = obj.properties["newX"]
      door.newY = obj.properties["newY"]
      table.insert(map.doors,door)
    end
  end
  if gameMap.layers["items"] and map.doLoad then
    map.doLoad = false
    for i, obj in pairs(gameMap.layers["items"].objects) do
      spawnItem(obj.x,obj.y,obj.properties["name"],map.items,obj.properties["mod1"],obj.properties["mod2"],obj.properties["modNum"])
    end
  end
  if gameMap.layers["npcs"] then
    for i, obj in pairs(gameMap.layers["npcs"].objects) do
      spawnNpc(obj.x,obj.y,obj.properties["name"],map.npcs)
    end
  end
  if gameMap.layers["walls"] then
    for i, obj in pairs(gameMap.layers["walls"].objects) do
      if obj.shape == "rectangle" then
        local wall = world:newRectangleCollider(obj.x,obj.y,obj.width,obj.height)
        wall:setCollisionClass("Wall")
        wall:setType("static")
        table.insert(map.walls,wall)
      elseif obj.shape == "ellipse" then
        local wall = world:newCircleCollider(obj.x + obj.width/2,obj.y+obj.height/2,obj.width/2)
        wall:setCollisionClass("Wall")
        wall:setType("static")
        table.insert(map.walls,wall)
      elseif obj.shape == "polygon" then
        vert = {}
        for _,v in pairs(obj.polygon) do
          table.insert(vert, v.x)
          table.insert(vert, v.y)
        end
        local wall = world:newPolygonCollider(vert)
        --local wall = world:newPolygonCollider(obj.polygon[0].x,obj.polygon[0].y,obj.polygon[1].x,obj.polygon[1].y,obj.polygon[2].x,obj.polygon[2].y)
        wall:setCollisionClass("Wall")
        wall:setType("static")
        table.insert(map.walls,wall)

      end
    end
  end



end


function map.update(dt)
  dt = love.timer.getDelta()
  if map.newId ~= map.id then
    talkies.clearMessages()
    if map.newId == 0 then
      map:unload()
      gameMap = sti("src/maps/Start0.lua")
      map.items = map0.items
      map.doLoad = map0.load
        map:load()
      map0.load = false
      map.id = map.newId
      player:changePos(map.playerX,map.playerY)


    elseif map.newId == 1 then
      map:unload()
      gameMap = sti("src/maps/testmap1.lua")

      map.items = map1.items
      map.doLoad = map1.load
        map:load()
      map1.load = false
      --end

      map.id = map.newId
      player:changePos(map.playerX,map.playerY)


    elseif map.newId == 2 then
      map:unload()
      gameMap = sti("src/maps/farmland2.lua")
      map.items = map2.items
      map.doLoad = map2.load
        map:load()
      map2.load = false
      map.id = map.newId
      player:changePos(map.playerX,map.playerY)

    elseif map.newId == 3 then
        map:unload()
        player.inventory.key = false
        gameMap = sti("src/maps/farmHouse3.lua")
        map.items = map3.items
        map.doLoad = map3.load
          map:load()
        map3.load = false
        map.id = map.newId
        player:changePos(map.playerX,map.playerY)
    elseif map.newId == 4 then
      map:unload()
      gameMap = sti("src/maps/village4.lua")
      map.items = map4.items
      map.doLoad = map4.load
        map:load()
      map4.load = false
      map.id = map.newId
      player:changePos(map.playerX,map.playerY)

    end
  if player.companion then
    spawnNpc(map.playerX ,map.playerY ,"companion",map.npcs)
  end




  end

  if #map.items > 0 then
    for n, item in pairs(map.items) do
      if item.dead then
        item:destroy()
        table.remove(map.items,n)
      else
        item:update(dt)
      end
    end
  end
  if #map.enemies > 0 then
    for n, enemy in pairs(map.enemies) do
      if enemy.dead then
        enemy:destroy()
        table.remove(map.enemy,n)
      else
        enemy:update(dt)
      end
    end
  end
  if #map.npcs > 0 then
    for n, npc in pairs(map.npcs) do
      if npc.dead then
        npc:destroy()
        table.remove(map.npcs,n)
      else
        npc:update(love.timer.getDelta( ))
      end

    end
  end
end


function map.draw()

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

  if #map.enemies > 0 then
    for _, enemy in pairs(map.enemies) do
      enemy:draw()
    end

  end

  --gameMap:drawLayer(gameMap.layers["trees"])
end

function map:unload()
  if mapID == 0 then
    map0.items = map.items
    map0.npcs = map.npcs
    map0.doors = map.doors
  elseif mapID == 1 then
    map1.items = map.items
    map1.npcs = map.npcs
    map1.doors = map.doors
  elseif mapID == 2 then
    map2.items = map.items
    map2.npcs = map.npcs
    map2.doors = map.doors
  elseif mapID == 3 then
    map3.items = map.items
    map3.npcs = map.npcs
    map3.doors = map.doors
  elseif mapID == 4 then
    map4.items = map.items
    map4.npcs = map.npcs
    map4.doors = map.doors
  elseif mapID == 5 then
    map5.items = map.items
    map5.npcs = map.npcs
    map5.doors = map.doors
  elseif mapID == 6 then
    map6.items = map.items
    map6.npcs = map.npcs
    map6.doors = map.doors
  end
  if #map.doors > 0 then
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
    map.items = {}
  end

  if #map.npcs > 0 then
    map.npcs = {}
  end

  if #map.enemies > 0 then
    for _, enemy in pairs(map.enemies) do
      enemy:destroy()

    end
    map.enemies = nil
    map.enemies = {}
  end

end
