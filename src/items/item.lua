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
     elseif type == "addHeart" then
       init = require("src/items/addHeart")
     elseif type == "blackHeart" then
       init = require("src/items/blackHeart")
     elseif type == "bronzeCoin" then
       init = require("src/items/bronzeCoin")
     elseif type == "goldCoin" then
       init = require("src/items/goldCoin")
     end

     item = init(item, x, y)

     item:load()
     table.insert(list, item)

end
