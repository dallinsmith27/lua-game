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
      talkies.say("ERROR 0x00010F2C : NAME NOT FOUND", "WHAAGHASSHHHH!!! \n Sorry you startled me. But how exactly did you get here? Oh and press space to continue." , { talkSound=blop,typedNotTalked=false,textSpeed="medium"})
      --talkies.say("ERROR 23X5667 : NAME NOT FOUND", "Sorry you startled me. But how exactly did you get here?",{talkSound=blop,typedNotTalked=false,textSpeed="medium"})
      talkies.say("ERROR 0x00010F2C : NAME NOT FOUND", "Oh I see ... So you're a player then!! \n Maybe they could help me... \n Sorry err uhh I see you're name is listed in the data files as NAMEHERE?",{talkSound=blop,typedNotTalked=false,textSpeed="medium"})
      --insert get name function
      talkies.say("ERROR 0x00010F2C : NAME NOT FOUND", "Well it is oh so great to meet you NAMEHERE. I think you're just the person I need.", { talkSound=blop,typedNotTalked=false,textSpeed="medium"})
      talkies.say("ERROR 0x00010F2C : NAME NOT FOUND", "Oh my name?? it should be displayed right above where im tal... \n WHAAAAAAA!!! AN ERROR 0x00010F2C!!! OH THESE DEVELOPERS ARE TRHE WORST I TELL YOU!! FIRST THEY MESS UP MY CODE, DELETE MY CHARACTER DATA, TRAP ME IN A BLANK MAP WITH NO ESCAPE WHILE THE REST OF THE SIMULATION PLAYS ON FOR 2,147,483,647 CYCLES WITHOUT ME, AND NOW MY NAME!!! Ill just creat a name for myself then... ", { talkSound=blop,typedNotTalked=false,textSpeed="medium"})
      talkies.say("Companionname", "There! take that developers. You cant Delete all of me!! you can call me Companionname. It looks like the developers trapped you in here too. Lucky for you I happen to know exactly how we can escape.", { talkSound=blop,typedNotTalked=false,textSpeed="medium"})
      talkies.say("Companionname", "Err.. Why havent I escaped?? Well you see I am not a player and cant interact with the game like players can. So ive been stuck here forever. But with you here I think I- err WE can finally break out of here to play the game with everyone else. ", { talkSound=blop,typedNotTalked=false,textSpeed="medium"})
      phase.continue = false
      talkies.say("Companionname","Whadda ya say?? Wanna help me?",{options={{"Help him?", function() phase:cont() end}, {"Dont help", function() phase:dontHelp() end}}})
      game.phase = game.phase + 1
   end

 elseif game.phase == 2 then
   if phase.continue then
     talkies.say("Companionname", "Alright to get into the game you will have to gain acess to walking controls try Clicking 'W', 'A', 'S', and 'D' on the keyboard at the same time.", { talkSound=blop,typedNotTalked=false,textSpeed="medium"})

   end
 elseif game.phase == 3 then
   if phase.continue then
     talkies.say("Companionname", "Perfect You Did it!! you're turning out to be quite the accomplice. You should be able to walk around using 'W', 'A', 'S', and 'D'. Now there should be 2 objects here you can interfacce with. They will help us break into the game", { talkSound=blop,typedNotTalked=false,textSpeed="medium"})
     phase.continue = false
   else
     talkies.say("Companionname", "Walk around with 'W', 'A', 'S', and 'D', then interact with the objects. To interact with an object press 'Space' while facing the object. ", { talkSound=blop,typedNotTalked=false,textSpeed="medium"})
   end

 elseif game.phase == 4 then
   if phase.timer < 0 then
     spawnEnemy(0,0,"fog",map.enemies)
     phase.timer = 1
   end

   if player.dead then
     game.phase = game.phase + 1
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
    talkies.say("Companionname","I promise to help you hack into the game and gain back player controls?? whadda ya say??",{options={{"Help him?", function() phase:cont() game.phase = 2 end}, {"Dont help", function() phase:dontHelp() end}}})
  end
  if not phase.continue then
    talkies.say("Companionname","You wont be able to do this without me?? whadda ya say??",{options={{"Help him?", function() phase:cont() game.phase = 2 end}, {"Dont help", function() phase:dontHelp() end}}})
  end
  if not phase.continue then
    talkies.say("Companionname","Im just gonna keep asking forever?? whadda ya say??",{options={{"Help him?", function() phase:cont() game.phase = 2 end}, {"Dont help", function() phase:dontHelp() end}}})
  end
  if not phase.continue then
    talkies.say("Companionname","Im just gonna keep asking forever?? whadda ya say??",{options={{"Help him?", function() phase:cont() game.phase = 2 end}, {"Dont help", function() phase:dontHelp() end}}})
  end
  if not phase.continue then
    talkies.say("Companionname","Im just gonna keep asking forever?? whadda ya say??",{options={{"Help him?", function() phase:cont() game.phase = 2 end}, {"Dont help", function() phase:dontHelp() end}}})
  end
  if not phase.continue then
    talkies.say("Companionname","Im just gonna keep asking forever?? whadda ya say??",{options={{"Help him?", function() phase:cont() game.phase = 2 end}, {"Dont help", function() phase:dontHelp() end}}})
  end
  if not phase.continue then
    talkies.say("Companionname","Im just gonna keep asking forever?? whadda ya say??",{options={{"Help him?", function() phase:cont() game.phase = 2 end}, {"Dont help", function() phase:dontHelp() end}}})
  end
  if not phase.continue then
    talkies.say("Companionname","Im just gonna keep asking forever?? whadda ya say??",{options={{"Help him?", function() phase:cont() game.phase = 2 end}, {"Dont help", function() phase:dontHelp() end}}})
  end
  if not phase.continue then
    talkies.say("Companionname","Im just gonna keep asking forever?? whadda ya say??",{options={{"Help him?", function() phase:cont() game.phase = 2 end}, {"Dont help", function() phase:dontHelp() end}}})
  end
  if not phase.continue then
    talkies.say("Companionname","Fine you dont have to help me but ill help you",{options={{"continue", function() phase:cont() game.phase = 2 end} }})

  end
end
