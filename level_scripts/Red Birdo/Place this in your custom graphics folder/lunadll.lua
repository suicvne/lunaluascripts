local hasGenerated = false;
local hasTransformed = false; --if we've transformed an egg or not
local ran;

function onLoop()
  tableOfBirdo = NPC.get(39, -1);
  tableOfBirdoEggs = NPC.get(40, -1);
  if(tableOfBirdo[1] ~= nil) then
    if(tonumber(tableOfBirdo[1]:mem(0xF0, FIELD_DFLOAT)) == 1) then
	  frameCount = frameCount + 1;
      if(hasGenerated ~= true) then
        ran = math.random(0, 2);
        hasGenerated = true;
      end
      if(ran == 2) then
        if(table.getn(tableOfBirdoEggs) > 0) then --checks if eggs exist
			if(frameCount > 21) then
				tableOfBirdoEggs = NPC.get(40, -1); --update table
				if(hasTransformed == false) then
					tableOfBirdoEggs[table.getn(tableOfBirdoEggs)]:mem(0xE2, FIELD_WORD, 282); --modification
					playSFX(42); --big fireball
					hasTransformed = true; --so we don't re-transform anything else
				end
			end
        end
      end
    end
    if(tonumber(tableOfBirdo[1]:mem(0xF8, FIELD_DFLOAT)) == 280) then
      hasGenerated = false; --just reset everything
	  hasTransformed = false;
	  frameCount = 0;
    end
  end
end
