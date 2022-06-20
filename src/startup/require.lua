function requireAll()

  require("src/startup/collisionClasses")
  createCollisionClasses()
  sti = require "libraries/sti"
  require("src/camera")
  require("src/dialogue")
  require("src/player")
  require("src/npcs/npc")
  require("src/npcs/cow")
  require("src/npcs/blankNpc")
  require("src/npcs/companion")
  require("src/enemies/enemy")
  require("src/enemies/glitch1")
  require("src/maps/maps")
  require("src/maps/test")
  require("src/maps/StartScreen")
  require("src/maps/map1")
  require("src/maps/map2")
  require("src/items/item")
  require("src/items/heart")

  require("src/inventory")
  require("libraries.anim8.anim8")
  vector = require("libraries/hump/vector")
  flux = require "libraries/flux/flux"
  require("src/update")
  require("src/draw")
end
