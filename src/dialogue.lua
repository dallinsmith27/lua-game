dialogue = {}


function dialogue:load()
    if dialogue.message ~= nil then
       dialogue.position = 0 
       box = love.graphics.newImage("sprites/dialogue-box.png")

    end
end

function dialogue:update()
    messageShown = string.sub(dialogue.message, 0, dialogue.position)
    
    dialogue.position = dialogue.position + 1
end

function dialogue:draw()
    
end