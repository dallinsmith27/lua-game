function requireAll()

  require("src/startup/collisionClasses")
  createCollisionClasses()

  require("src/camera")
  require("src/player")

  require("src/maps/maps")
  require("src/maps/map1")
  require("libraries.anim8.anim8")
  require("src/update")
  require("src/draw")
end
