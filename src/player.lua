

player = {}
player.x = 300
player.y = 300
player.speed = 5
--player.sprite = love.graphics.newImage('sprites/')

function player:update(dt)

end

function player:draw()
  love.graphics.rectangle("fill", 400, 300, 40, 70)
end
