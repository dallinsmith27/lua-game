function spawnEnemy(x,y,type,list)
  local enemy = {}

     enemy.type = type
     enemy.dead = false
     enemy.stamp = "enemy"
     enemy.health = 3
     enemy.flashTimer = 0

     -- Function that sets the properties of the new enemy
     local init
     if type == "glitch1" then
         init = require("src/enemies/glitch1")
     elseif type == "error" then
       init = require("src/enemies/error")
     elseif type == "fog" then
       init = require("src/enemies/fog")
     end

     enemy = init(enemy, x, y)


     table.insert(list, enemy)

end
