FACTION.name = "Civil Protection"
FACTION.description = "The Civil Protection Force of the Universal Union."
FACTION.color = Color(20, 120, 185)

FACTION.models = {
	"models/cfe_ragdoll/cfe_male_ragdoll/cfe_male_01_ragdoll.mdl"
}

ix.anim.SetModelClass("models/cfe_ragdoll/cfe_male_ragdoll/cfe_male_01_ragdoll.mdl", "metrocop")

function FACTION:ModifyPlayerStep(client, data)
	if ( data.ladder or data.submerged ) then
		return
	end

	local extraSounds = {}

	data.snd = string.Replace(data.snd, ".stepright", "")
	data.snd = string.Replace(data.snd, ".stepleft", "")

	for i = 1, 4 do
		extraSounds[#extraSounds + 1] = "player/footsteps/" .. data.snd .. i .. ".wav"
	end

	for _, v in ipairs(extraSounds) do
		EmitSound(v, client:GetPos(), client:EntIndex(), CHAN_AUTO, data.volume * (data.running and 0.5 or 0.4))
	end

	data.snd = "npc/metropolice/gear" .. math.random(1, 4) .. ".wav"
	data.volume = data.volume * (data.running and 0.5 or 0.4)
end

FACTION_CP = FACTION.index