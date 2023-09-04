AddCSLuaFile("cl_init.lua")
AddCSLuaFile("shared.lua")

include("shared.lua")

resource.AddFile("materials/shared/arrow.png")
resource.AddFile("materials/shared/implogo.png")
resource.AddFile("materials/shared/replogo.png")
resource.AddFile("materials/vgui/entities/formations_panel.vmt")

function math.inrange(val, min, max)
    return val <= max and val >= min
end

function ENT:Initialize()
	self:SetModel("models/hunter/plates/plate2x2.mdl")
	self:PhysicsInit(SOLID_VPHYSICS)
	self:SetMoveType(MOVETYPE_VPHYSICS)
	self:SetSolid(SOLID_VPHYSICS)
	self:SetUseType(SIMPLE_USE)

	self:SetMaterial("models/debug/debugwhite")
	self:SetColor(Color(50, 50, 50))
 
    local phys = self:GetPhysicsObject()
	
	if IsValid(phys) then
		phys:EnableMotion(false)
	end
end

local size = -950 / 2

function ENT:Use(caller)
	local trace = caller:GetEyeTrace()
	if not trace.Entity == self then return end

	local cursor = self:WorldToLocal(trace.HitPos) * Vector(10, 10, 10)

	if math.inrange(cursor.y, -size - 64 - 64, -size) and math.inrange(cursor.x, -size - 64 - 64, -size) then 
		if self:GetPage() >= self:GetMax() then return end

		self:SetPage(self:GetPage() + 1)
		self:EmitSound("buttons/blip1.wav")
	end

	if math.inrange(cursor.y, size , size + 64 + 64) and math.inrange(cursor.x, -size - 64 - 64, -size) then 
		if self:GetPage() <= 1 then return end

		self:SetPage(self:GetPage() - 1)
		self:EmitSound("buttons/blip1.wav")
	end
end

