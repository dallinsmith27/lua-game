function spawnItem(x,y,type,list)
  local item = {}

     item.type = type
     item.dead = false
     item.stamp = "item"
     item.health = 3
     item.flashTimer = 0

     -- Function that sets the properties of the new item
     local init
     if type == "heart" then
         init = require("src/items/heart")
     elseif type == "arrow" then
       init = require("")
     end

     item = init(item, x, y)

     item:load()
     table.insert(list, item)

end
