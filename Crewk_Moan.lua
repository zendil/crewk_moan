--Created by Zendil-The Underbog (US) - 03 June 2017
--Define locals
local f = Crewk_Moan_Frame
local names = {
	["Crewk"] = true,
}
local spells = {
	["Revival"] = true,
}
--Register Events
f:RegisterEvent("COMBAT_LOG_EVENT_UNFILTERED")
f:SetScript("OnEvent", f.event)
--Define Function
function f:event(event, ...)
	--If combat lof event
	if event == "COMBAT_LOG_EVENT_UNFILTERED" then
		local _, eventType, _, sourceGUID, sourceName, sourceFlags, sourceRaidFlags, _, _, _, _, ... = ...
		--and spell cast success
		if eventType == "SPELL_CAST_SUCCESS" then
			local spellId, spellName, _ = ...
			--If caster was in names list
			if names[sourceName] then
				--and spell was in spells list
				if spells[spellName] then
					--play the moan
					PlaySoundFile("Interface\\Addons\\Crewk_Moan\\media\\crewk_moan.ogg","Master")
				end
			end
		end
	end
end