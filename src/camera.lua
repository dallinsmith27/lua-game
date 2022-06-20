Camera = require "libraries/hump/camera"
--cam = Camera(0, 0, scale)


cam = Camera(0, 0, game.scale)

function cam:update(dt)
    local camX = player.x
    local camY = player.y


  cam:lookAt(camX, camY)

    -- cam.x and cam.y keep track of where the camera is located
    -- the lookAt value may be moved if a sscreenshake is happening, so these
    -- values know where the camera should be, regardless of lookAt
    cam.x, cam.y = cam:position()


end
