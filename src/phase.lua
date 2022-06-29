phase = {}
phase.timer = 1
phase.num = 0


function phase:load()

end

function phase:update(dt)
  phase.timer = phase.timer - dt
  if game.phase == 0 then
    game.phase = game.phase +1
  elseif game.phase == 1 then

    if phase.timer < 0 then
      talkies.say("ERROR 0x00010F2C : NAME NOT FOUND", "WHAAGHASSHHHH!!! \n Sorry, you startled me. But how exactly did you get here? Oh and press space to continue." , { talkSound=blop,typedNotTalked=false,textSpeed="medium"})
      --talkies.say("ERROR 23X5667 : NAME NOT FOUND", "Sorry you startled me. But how exactly did you get here?",{talkSound=blop,typedNotTalked=false,textSpeed="medium"})
      talkies.say("ERROR 0x00010F2C : NAME NOT FOUND", "Oh I see ... So you're a player then!! \n Maybe they could help me... \n Sorry err uhh I see your name is listed in the data files as NAMEHERE?",{talkSound=blop,typedNotTalked=false,textSpeed="medium"})
      --insert get name function
      talkies.say("ERROR 0x00010F2C : NAME NOT FOUND", "Well, it is oh so great to meet you NAMEHERE. I think you are just the person I need.", { talkSound=blop,typedNotTalked=false,textSpeed="medium"})
      talkies.say("ERROR 0x00010F2C : NAME NOT FOUND", "Oh my name?? It should be displayed right above where I'm tal... \n WHAAAAAAA!!! AN ERROR 0x00010F2C!!! OH THESE DEVELOPERS ARE THE WORST I TELL YOU!!", { talkSound=blop,typedNotTalked=false,textSpeed="medium"})
      talkies.say("ERROR 0x00010F2C : NAME NOT FOUND", "FIRST THEY MESS UP MY CODE, THEN THEY DELETE MY CHARACTER DATA, THEN TRAP ME IN A BLANK MAP WITH NO ESCAPE WHILE THE REST OF THE SIMULATION PLAYS ON FOR 2,147,483,647 CYCLES WITHOUT ME, AND NOW MY NAME!!! \n Guess I'll just create a name for myself then...", { talkSound=blop,typedNotTalked=false,textSpeed="medium"})
      talkies.say("Companionname", "There! Take that developers. You can't Delete all of me!! \n You can call me Companionname. It looks like the developers trapped you in here too. Lucky for you, I happen to know exactly how we can escape.", { talkSound=blop,typedNotTalked=false,textSpeed="medium"})
      talkies.say("Companionname", "Err.. Why haven't I escaped?? Well you see I am not a player and cannot interact with the game like players can. So, I've been stuck here forever. BUT! With you here, I think I- err WE can finally break out of here to play the game with everyone else. ", { talkSound=blop,typedNotTalked=false,textSpeed="medium"})
      phase.continue = false
      talkies.say("Companionname","Whadda ya say?? Wanna help me?",{options={{"Help him?", function() phase:cont() end}, {"Dont help", function() phase:dontHelp() end}}})
      game.phase = game.phase + 1
   end

 elseif game.phase == 2 then
   if phase.continue then
     talkies.say("Companionname", "Alright to get into the game you will have to gain acess to walking controls. Try pressing '7', 'S', and 'D' on the keyboard at the same time.", { talkSound=blop,typedNotTalked=false,textSpeed="medium"})

   end
 elseif game.phase == 3 then
   if phase.continue then
     talkies.say("Companionname", "Perfect! You did it!! You're turning out to be quite the accomplice. You should be able to walk around using 'W', 'A', 'S', and 'D'. Now there should be two objects here that you can interface with. They will help us break into the game.", { talkSound=blop,typedNotTalked=false,textSpeed="medium"})
     phase.continue = false
   else
     talkies.say("Companionname", "Walk around with 'W', 'A', 'S', and 'D', then interact with the objects. To interact with an object press 'Space' while facing the object. ", { talkSound=blop,typedNotTalked=false,textSpeed="medium"})
   end

 elseif game.phase == 4 then
   if player.dead then
     game.phase = game.phase + 1
   elseif phase.timer < 0 then
     spawnEnemy(0,0,"fog",map.enemies)
     spawnEnemy(1,1,"fog",map.enemies)
     spawnEnemy(-1,1,"fog",map.enemies)
     spawnEnemy(0,0,"fog",map.enemies)
     spawnEnemy(1,1,"fog",map.enemies)
     spawnEnemy(-1,1,"fog",map.enemies)
     phase.timer = 2
   end



 elseif game.phase == 5 then
   if not player.dead then
     map.newId = 1
   end
 elseif game.phase == 6 then

 end
end
function phase:draw()

end

function phase:cont()
  phase.continue = true
  talkies:clearMessages()
end

function phase:dontHelp()

  if not phase.continue then
    talkies.say("Companionname","I promise to help you hack into the game and gain back player controls. Whadda ya say??",{options={{"Help him?", function() phase:cont() game.phase = 2 end}, {"Dont help", function() phase:dontHelp() end}}})
  end
  if not phase.continue then
    talkies.say("Companionname","You won't be able to do this without me! Whadda ya say??",{options={{"Help him?", function() phase:cont() game.phase = 2 end}, {"Don't help", function() phase:dontHelp() end}}})
  end
  if not phase.continue then
    talkies.say("Companionname","I'm just gonna keep asking forever! Whadda ya say??",{options={{"Help him?", function() phase:cont() game.phase = 2 end}, {"Don't help", function() phase:dontHelp() end}}})
  end
  if not phase.continue then
    talkies.say("Companionname","I'm just gonna keep asking forever! Whadda ya say??",{options={{"Help him?", function() phase:cont() game.phase = 2 end}, {"Don't help", function() phase:dontHelp() end}}})
  end
  if not phase.continue then
    talkies.say("Companionname","I'm just gonna keep asking forever! Whadda ya say??",{options={{"Help him?", function() phase:cont() game.phase = 2 end}, {"Don't help", function() phase:dontHelp() end}}})
  end
  if not phase.continue then
    talkies.say("Companionname","I'm just gonna keep asking forever?? Whadda ya say??",{options={{"Help him?", function() phase:cont() game.phase = 2 end}, {"Don't help", function() phase:dontHelp() end}}})
  end
  if not phase.continue then
    talkies.say("Companionname","I'm just gonna keep asking forever?? Whadda ya say??",{options={{"Help him?", function() phase:cont() game.phase = 2 end}, {"Don't help", function() phase:dontHelp() end}}})
  end
  if not phase.continue then
    talkies.say("Companionname","I'm just gonna keep asking forever?? Whadda ya say??",{options={{"Help him?", function() phase:cont() game.phase = 2 end}, {"Don't help", function() phase:dontHelp() end}}})
  end
  if not phase.continue then
    talkies.say("Companionname","I'm just gonna keep asking forever?? Whadda ya say??",{options={{"Help him?", function() phase:cont() game.phase = 2 end}, {"Don't help", function() phase:dontHelp() end}}})
  end
  if not phase.continue then
    talkies.say("Companionname","Fine. You don't have to help me, but I'll help you anyway.",{options={{"continue", function() phase:cont() game.phase = 2 end} }})

  end
end
