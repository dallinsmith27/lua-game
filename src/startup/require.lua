function requireAll()

  require("src/startup/collisionClasses")
  createCollisionClasses()


  require("src/player")
<<<<<<< HEAD
  require("src/maps/maps")

=======
  require("src/maps/initializeMaps")
  require("libraries.anim8.anim8")
>>>>>>> 1157cfd41ebcf4d4bb2d4cecb3b5dc04682c9258
  require("src/update")
  require("src/draw")
end
