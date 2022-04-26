function requireAll()

  require("src/startup/collisionClasses")
  createCollisionClasses()


  require("src/player")
  require("src/maps/maps")

  require("src/update")
  require("src/draw")
end
