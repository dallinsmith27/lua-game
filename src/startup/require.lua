function requireAll()

  require("src/startup/collisionClasses")
  createCollisionClasses()


  require("src/player")
  require("src/maps/maps")
  require("libraries.anim8.anim8")
  require("src/update")
  require("src/draw")
end
