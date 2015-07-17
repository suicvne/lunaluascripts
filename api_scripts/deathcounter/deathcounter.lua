local deathCounterApi = {}
--functions go in between these

--Variables
local deathAniState = 0;
local hasDied = false;
local dataInstance = Data(Data.DATA_WORLD, true);
local deathCount = 0;
--registers
function deathCounterApi.onInitAPI()
  ---have to put the onLoad() stuff here..
  deathCount = tonumber(dataInstance:get("deathCount"));
  if (deathCount == nil) then
    deathCount = 0;
  end

  registerEvent(deathCounterApi, "onLoop", "loopFrame");
  registerEvent(deathCounterApi, "onExitLevel", "exitLevel");
end

--internal funcs
function deathCounterApi.loopFrame()
  deathAniState = player:mem(0x13E, FIELD_WORD);
  Text.print("DEATHS: " .. tostring(deathCount), 3, 2, 2);
  if (hasDied == false) then
    if (deathAniState > 0) then
      deathCount = deathCount + 1;
      hasDied = true;
    end
  end
end

function deathCounterApi.exitLevel()
  dataInstance:set("deathCount", tostring(deathCount));
  dataInstance:save();
end

function deathCounterApi.getDeathCount()
  if (deathCount == nil) then
    deathCount = tonumber(dataInstance:get("deathCount"));
    if(deathCount == nil) then
      return 0;
    else
      return deathCount;
    end
  end
end
--end with this
return deathCounterApi;
