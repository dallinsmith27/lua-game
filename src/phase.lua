phase = {}
phase.timer = 1
phase.num = 0
phase.earth = false
phase.lightning = false
phase.water = false
phase.fire = false
phase.air = false


function phase:load()

end

function phase:update(dt)
  phase.timer = phase.timer - dt

end
