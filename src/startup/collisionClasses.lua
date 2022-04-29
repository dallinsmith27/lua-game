function createCollisionClasses()
    world:addCollisionClass('Ignore', {ignores = {'Ignore'}})
    world:addCollisionClass('Player', {ignores = {'Ignore'}})
    world:addCollisionClass('Wall', {ignores = {'Ignore'}})
    world:addCollisionClass('Transition', {ignores = {'Ignore'}})
    world:addCollisionClass('Enemy', {ignores = {'Ignore'}})
    world:addCollisionClass('Door', {ignores = {'Ignore','Wall'}})
    world:addCollisionClass('button', {ignores = {'Ignore'}})
end
