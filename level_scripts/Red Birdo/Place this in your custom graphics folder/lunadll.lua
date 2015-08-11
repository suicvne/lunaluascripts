local hasGenerated = false;
local ran;

function onLoop()
  tableOfBirdo = NPC.get(39, -1);
  tableOfBirdoEggs = NPC.get(40, -1);

  if(tableOfBirdo[1] ~= nil) then
    if(tonumber(tableOfBirdo[1]:mem(0xF0, FIELD_DFLOAT)) == 1) then
      if(hasGenerated ~= true) then
        ran = math.random(0, 2);
        hasGenerated = true;
      end
      if(ran == 2) then
        if(table.getn(tableOfBirdoEggs) > 0) then
          tableOfBirdoEggs[table.getn(tableOfBirdoEggs)]:mem(0xE2, FIELD_WORD, 282);
          playSFX(42); --big fireball
        end
      end
    end
    if(tonumber(tableOfBirdo[1]:mem(0xF8, FIELD_DFLOAT)) == 280) then
      hasGenerated = false; --just reset everything
    end
  end
end
