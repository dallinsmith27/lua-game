function createCollisionClasses()
    world:addCollisionClass('Ignore', {ignores = {'Ignore'}})
    world:addCollisionClass('item', {ignores = {'Ignore',"item"}})


    world:addCollisionClass('npc', {ignores = {'Ignore',"item"}})
    world:addCollisionClass('Wall', {ignores = {'Ignore'}})
    world:addCollisionClass('Transition', {ignores = {'Ignore'}})
    world:addCollisionClass('enemy', {ignores = {'Ignore'}})
    world:addCollisionClass('Door', {ignores = {'Ignore','Wall'}})
    world:addCollisionClass('button', {ignores = {'Ignore'}})
    world:addCollisionClass('cow', {ignores = {'Ignore'}})
    world:addCollisionClass('Player', {ignores = {"Ignore"}})
    world:addCollisionClass('glitch1', {ignores = {'Ignore'}})
    world:addCollisionClass('error', {ignores = {'Ignore'}})
    world:addCollisionClass('respawnStone', {ignores = {'Ignore'}})
    world:addCollisionClass('fog', {ignores = {'Ignore'}})

    world:addCollisionClass('companion', {ignores = {"All", except = {"Player"}}})
end
