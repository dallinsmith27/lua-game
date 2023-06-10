function spawnEnemy(x,y,type,list)
  local enemy = {}
    function  enemy:damage(damage,knockback)
      enemy.health =  enemy.health - damage
      test.num =  enemy.health
    end
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
     elseif type == "soldier" then
       init = require("src/enemies/soldier")
     elseif type == "glitchedBlob" then
       init = require("src/enemies/glitchedBlob")
     elseif type == "waterBoss" then
       init = require("src/enemies/waterBoss")
     elseif type == "waterMinion" then
       init = require("src/enemies/waterMinion")
     end


     enemy = init(enemy, x, y)


     table.insert(list, enemy)

end
