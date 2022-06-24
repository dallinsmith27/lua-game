Game Plan For the Game


Start Map with glitch companion
Mini tutorial
Transfer to main Map

First Main challenge is locate the glitch companion again.
3 dungeons?
Store to buy items?
Items:
  --Sword [Equip-able]
  --Coins (Bronze, Silver, Gold) [pickup on collide, up to 999 max]
  --Chest [Tangible but can open for loot]
  --Heart Container [pickup on collide; increases max health]
  --Heart [pickup on collide; restores some health]

Interact with NPC's
  --They talk to you sometimes
  --You can talk to them and they will respond based on the current game.phase









  NEEDED
    -BUG to Fix: NPC's can push the hit boxes for items away from the item animations.
    -BUG to Fix: manually changing map while mini message is up throws an error:
      Error

      libraries/talkies/talkies.lua:354: calling 'getX' on bad self (Body expected, got nil)

      Traceback

      [love "callbacks.lua"]:228: in function 'handler'
      [C]: in function 'getX'
      libraries/talkies/talkies.lua:354: in function 'draw'
      src/draw.lua:9: in function 'drawAll'
      main.lua:55: in function 'draw'
      [love "callbacks.lua"]:168: in function <[love "callbacks.lua"]:144>
      [C]: in function 'xpcall'
