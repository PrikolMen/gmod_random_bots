local player_manager_AllValidModels = player_manager.AllValidModels
local timer_Simple = timer.Simple
local table_Random = table.Random
local math_random = math.random
local HSVToColor = HSVToColor
local IsValid = IsValid
local Vector = Vector
local ipairs = ipairs

hook.Add("PlayerSpawn", "Random Bots", function( ply )
	if ply:IsBot() then
		timer_Simple(0, function()
			if !IsValid( ply ) then return end
			local color = HSVToColor( math_random( 360 ) % 360, 0.9, 0.8 )
			ply:SetPlayerColor( Vector( color.r / 255, color.g / 255, color.b / 255 ) )
			ply:SetModel( table_Random( player_manager_AllValidModels() ) )
			ply:SetSkin( math_random( 0, ply:SkinCount() ) )

			for _, bodygroup in ipairs( ply:GetBodyGroups() ) do
				ply:SetBodygroup( bodygroup.id, math_random( 0, ply:GetBodygroupCount( bodygroup.id ) ) )
			end
		end)
	end
end)