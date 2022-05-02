function requireAll()

  require("src/startup/collisionClasses")
  createCollisionClasses()

  require("src/camera")
  require("src/player")
  require("src/npcs/npc")
  require("src/npcs/cow")

  require("src/maps/maps")
  require("src/maps/StartScreen")
  require("src/maps/map1")
  require("src/maps/map2")
  require("src/maps/map3")
  require("libraries.anim8.anim8")
  require("src/update")
  require("src/draw")
end
