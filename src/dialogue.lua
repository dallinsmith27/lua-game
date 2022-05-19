dialogue = {}
dialogue.width = 1024
dialogue.height = 256
dialogue.position = 0 
dialogue.isOpen = false
dialogue.box = love.graphics.newImage("sprites/dialogue-box.png")


function dialogue:load()
    if dialogue.message ~= nil then
       

    end
end

function dialogue:update()
    messageShown = string.sub(dialogue.message, 0, dialogue.position)

    dialogue.position = dialogue.position + 1
end

function dialogue:draw()
    if dialogue.isOpen then
        love.graphics.draw(dialogue.box, cam.x - dialogue.width/2  ,cam.y - love.graphics.getHeight()/2 + dialogue.height)
    end
    
end