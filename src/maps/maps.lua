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
  if gameMap.layers["items"] then
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
      map:load()
      map.id = map.newId
      player:changePos(map.playerX,map.playerY)


    elseif map.newId == 1 then
      map:unload()
      gameMap = sti("src/maps/testmap1.lua")
      map:load()
      map.id = map.newId
      player:changePos(map.playerX,map.playerY)
      spawnItem(0,50,"heart",map.items)
      spawnItem(60,50,"addHeart",map.items)
      spawnItem(-30,62,"bronzeCoin",map.items)
      spawnItem(-30,92,"silverCoin",map.items)
      spawnItem(-60,92,"silverCoin",map.items)
      spawnItem(-60,62,"goldCoin",map.items)
      spawnItem(-90,62,"goldCoin",map.items)
      spawnItem(-120,62,"goldCoin",map.items)
      spawnItem(-150,62,"goldCoin",map.items)
      spawnItem(-180,62,"goldCoin",map.items)
      spawnItem(-210,62,"goldCoin",map.items)
      spawnItem(-240,62,"goldCoin",map.items)
      spawnItem(-270,62,"goldCoin",map.items)
      spawnItem(-300,62,"goldCoin",map.items)
      spawnItem(-330,62,"goldCoin",map.items)



      spawnNpc(125,100,"cow",map.npcs)


    elseif map.newId == 2 then
      map:unload()
      gameMap = sti("src/maps/farmland2.lua")
      map:load()
      map.id = map.newId
      player:changePos(map.playerX,map.playerY)

    elseif map.newId == 3 then
        map:unload()
        player.inventory.key = false
        gameMap = sti("src/maps/farmHouse3.lua")
        map:load()
        map.id = map.newId
        player:changePos(map.playerX,map.playerY)
    elseif map.newId == 4 then
      map:unload()
      gameMap = sti("src/maps/village4.lua")
      map:load()
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

  if #map.enemies > 0 then
    for _, enemy in pairs(map.enemies) do
      enemy:destroy()

    end
    map.enemies = nil
    map.enemies = {}
  end

end
