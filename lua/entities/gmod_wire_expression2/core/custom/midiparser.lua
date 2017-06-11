E2Lib.RegisterExtension("midiparser", true, "Adds MIDI parser functionality.")

local DEFAULT = { n = {}, ntypes = {}, s = {}, stypes = {}, size = 0 }

local antispam_lookup = {}
local function antispam(self)
	if antispam_lookup[self.uid] and antispam_lookup[self.uid] > CurTime() then
		return false
	end

	antispam_lookup[self.uid] = CurTime() + 0.5
	return true
end

__e2setcost(25) -- temporary

--- Parses a given MIDI data as a '''string'''. Returns 1 if MIDI data is successfully parsed into the midiResult '''table'''; otherwise, it returns 0
e2function number midiParse(string midiData, table midiResult)
	if not midiData or midiData == "" then return 0 end

	self.prf = self.prf + #midiData / 2

	local success, result = pcall(midi.Parse, midiData)

	if not success then
		if not antispam(self) then return 0 end
		WireLib.ClientError("midi.Parse error: " .. result, self.player)
		return 0
	end

	table.Empty(midiResult)
	local resultTable = table.Copy(DEFAULT)
	-- [TODO] --

	return 1
end
