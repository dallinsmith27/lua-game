Camera = require "libraries/hump/camera"
--cam = Camera(0, 0, scale)
cam = Camera(0, 0, 1)

function cam:update(dt)
    local camX = player.x
    local camY = player.y

    -- This section prevents the camera from viewing outside the background
    -- First, get width/height of the game window, divided by the game scale
    --local w = love.graphics.getWidth() / scale
    --local h = love.graphics.getHeight() / scale

    -- Get width/height of background
    --***NEEDS TO BE INTERFACED WITH MAP CLASS
    

  cam:lookAt(camX, camY)

    -- cam.x and cam.y keep track of where the camera is located
    -- the lookAt value may be moved if a sscreenshake is happening, so these
    -- values know where the camera should be, regardless of lookAt
    cam.x, cam.y = cam:position()


end
