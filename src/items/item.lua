function spawnItem(x,y,type,list,mod1,mod2,modNum)
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
     elseif type == "silverCoin" then
       init = require("src/items/silverCoin")
     elseif type == "goldCoin" then
       init = require("src/items/goldCoin")
     elseif type == "respawnStone" then
       init = require("src/items/respawnStone")
     elseif type == "book" then
       init = require("src/items/book")
    elseif type == "chest" then
      init = require("src/items/chest")
    elseif type == "candleStick" then
      init = require("src/items/candleStick")
     end

     item = init(item, x, y,mod1,mod2,modNum)

     item:load()
     table.insert(list, item)

end
