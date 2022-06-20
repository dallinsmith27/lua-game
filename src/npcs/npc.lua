

function spawnNpc(x,y,type,list)
  local npc = {}

     npc.collider = nil
     npc.type = type
     npc.dead = false
     npc.stamp = "enemy"
     npc.health = 3
     npc.flashTimer = 0

     -- Function that sets the properties of the new enemy
     local init
     if type == "cow" then
         init = require("src/npcs/cow")
     elseif type == "companion" then
         init = require("src/npcs/companion")
     elseif type == "blankNpc" then
         init = require("src/npcs/blankNpc")
     end

     npc = init(npc, x, y)

     npc:load()
     table.insert(list, npc)

end
