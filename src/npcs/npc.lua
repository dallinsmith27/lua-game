

function spawnNpc(x,y,type,list)
  local npc = {}

     npc.type = type
     npc.dead = false
     npc.stamp = "enemy"
     npc.health = 3
     npc.flashTimer = 0

     -- Function that sets the properties of the new enemy
     local init
     if type == "cow" then
         init = require("src/npcs/cow")
     elseif type == "other" then
         --init = require("src/enemies/bat")
     end

     npc = init(npc, x, y)


     table.insert(list, npc)

end
