

function spawnNpc(x,y,type,list)
  local npc = {}
  npc.collider = nil
  npc.type = type
  npc.dead = false
  npc.stamp = "enemy"
  npc.health = 3
  npc.flashTimer = 0
  npc.sucess = true
   -- Function that sets the properties of the new enemy
  local init
  if type == "cow" then
    init = require("src/npcs/cow")
  elseif type == "blankNpc" then
    init = require("src/npcs/blankNpc")
  elseif type == "sarah" then
     init = require("src/npcs/sarah")
  elseif type == "john" then
     init = require("src/npcs/john")
  else
     npc.sucess = false
  end

  
  npc = init(npc, x, y)
  npc:load()
  table.insert(list, npc)

end
