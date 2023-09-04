include("shared.lua")

local size = -950 / 2

function math.inrange(val, min, max)
    return val <= max and val >= min
end

local arrow_icon = Material("materials/shared/arrow.png")
local implogo_icon = Material("materials/shared/implogo.png")
local replogo_icon = Material("materials/shared/replogo.png")
local faces_icon = Material("materials/shared/faces.png")
local impfaces_icon = Material("materials/shared/impfaces.png")

surface.CreateFont("FORMATION:Main", {
	font = "Roboto",
	size = 50
})

surface.CreateFont("FORMATION:Title", {
	font = "Roboto",
	size = 80
})

function ENT:Initialize()
	self.x = 0
	self.lx = 0
	self.t = 0

	self.min = 0
	self.max = 0

	self.tpage = self:GetPage()

	self:Work()
end

function ENT:Work()
	self.t = !self.t

	if self.t then 
		self.x = self.min
	else
		self.x = self.max
	end

	timer.Simple(1, function()
		if not IsValid(self) then return end
		self:Work()
	end)
end

function ENT:OnPage()
	if self.tpage == 3 then 
		self.x = -25
		self.lx = -25
		return
	end
	
	self.x = 0
	self.lx = 0
end

function ENT:Think()
	if self:GetPage() != self.tpage then 
		self.tpage = self:GetPage()

		self:OnPage()
	end
end

function ENT:Page(number)
if number == 1 then 
		draw.SimpleText("Faces Information", "FORMATION:Title", 0, size + -180, self.htextcolor, 1, 1)
		draw.SimpleText("Press E [USE] On Arrows to change page", "FORMATION:Main", 0, 460, self.hinttext, 1, 1)
		draw.RoundedBox(45, -600, 520, 1200, 100, self.boxcolor)
		draw.SimpleText("Extended Faces Information on Page 2", "FORMATION:Title", 0, 570, self.boxtextcolor, 1, 1)
		draw.SimpleText("Faces Directions are relevant to Troopers", "FORMATION:Main", 250, -490, self.textcolor, 0, 1)
		draw.SimpleText("current forward facing position", "FORMATION:Main", 250, -440, self.textcolor, 0, 1)
		draw.SimpleText("Use the Diagram below to practice", "FORMATION:Main", 250, -350, self.textcolor, 0, 1)
		draw.SimpleText("using 'Ticks' to learn how to easily", "FORMATION:Main", 250, -300, self.textcolor, 0, 1)
		draw.SimpleText("perform faces. Ticks explained on page 2.", "FORMATION:Main", 250, -250, self.textcolor, 0, 1)
		
		if self.era == true then
		surface.SetDrawColor(Color(255, 255, 255))
		surface.SetMaterial(faces_icon)
		surface.DrawTexturedRectRotated(size + 400, -size - 630, 2000, 1000, 0)
		elseif self.era == false then
		surface.SetDrawColor(Color(255, 255, 255))
		surface.SetMaterial(impfaces_icon)
		surface.DrawTexturedRectRotated(size + 400, -size - 630, 2000, 1000, 0)
		end
		
		end
		
	if number == 2 then 
		draw.SimpleText("• When in third person, you will notice your character turns eight times to do a full 360 degree turn.", "FORMATION:Main", -1000, -550, self.textcolor, 0, 1)
		draw.SimpleText("Each of these turns is considered a 'tick'.[See Diagram on Page 1]", "FORMATION:Main", -1000, -500, self.textcolor, 0, 1)
		draw.SimpleText("• Incline: 1 Tick", "FORMATION:Main", -1000, -400, self.textcolor, 0, 1)
		draw.SimpleText("• Face: 2 Ticks", "FORMATION:Main", -1000, -300, self.textcolor, 0, 1)
		draw.SimpleText("• Decline: 3 Ticks", "FORMATION:Main", -1000, -200, self.textcolor, 0, 1)
		draw.SimpleText("• About Face: 4 Ticks", "FORMATION:Main", -1000, -100, self.textcolor, 0, 1)
		draw.SimpleText("• When asked to perform faces, you will always begin in a front face position.", "FORMATION:Main", -1000, 0, self.textcolor, 0, 1)
		draw.SimpleText("A front face will always face the individual ordering the faces.", "FORMATION:Main", -1000, 50, self.textcolor, 0, 1)
		draw.SimpleText("• Always turn to your right when performing a Front or About Face", "FORMATION:Main", -1000, 150, self.textcolor, 0, 1)
		draw.SimpleText("• Use third person when performing faces to ensure accuracy. You can create a bind for this", "FORMATION:Main", -1000, 250, self.textcolor, 0, 1)
		draw.SimpleText("by opening your console (~), and typing ''bind <key> stp''. For example, ''bind / stp''.", "FORMATION:Main", -1000, 300, self.textcolor, 0, 1)
	end
	end


function ENT:Draw()
	self:DrawModel()

	local trace = LocalPlayer():GetEyeTrace()
	if not trace.Entity == self then return end

	local cursor = self:WorldToLocal(trace.HitPos) * Vector(10, 10, 10)

	local pos = self:LocalToWorld(Vector(0, 0, 2.5))
	local ang = self:LocalToWorldAngles(Angle(0, 90, 0))
	--[[Change the distance at which clients will render the panel]]--
	if LocalPlayer():GetPos():Distance(self:GetPos()) >= 500 then return end 

	cam.Start3D2D(pos, ang, 0.1)
		draw.RoundedBox(0, -2370 / 2, -1420 / 2, 2370, 100, self.hcolor)
		draw.RoundedBox(0, -2370 / 2, -1240 / 2, 2370, 1330, self.bcolor)
		--[[---------------------------------------------------------
			Name: Arrows
		-----------------------------------------------------------]]
		if math.inrange(cursor.y, -size - 64 - 64, -size) and math.inrange(cursor.x, -size - 64 - 64, -size) then 
			surface.SetDrawColor(self.pcolor)
		else
			surface.SetDrawColor(Color(255, 255, 255))
		end
		
		surface.SetMaterial(arrow_icon)
		surface.DrawTexturedRectRotated(-size - 64, -size - 64, 64, 64, 180)

		if math.inrange(cursor.y, size , size + 64 + 64) and math.inrange(cursor.x, -size - 64 - 64, -size) then 
			surface.SetDrawColor(self.pcolor)
		else
			surface.SetDrawColor(Color(255, 255, 255))
		end
		
		surface.SetMaterial(arrow_icon)
		surface.DrawTexturedRectRotated(size + 64, -size - 64, 64, 64, 0)

		draw.SimpleText("Page ".. self:GetPage().. " of ".. self:GetMax(), "FORMATION:Main", 0, -size - 64, self.pagenum, 1, 1)

		self:Page(self:GetPage())
		
		

	cam.End3D2D()
	
	cam.Start3D2D(pos, ang, 0.1)
if self.era == true then 
		surface.SetDrawColor(Color(255, 255, 255))
		surface.SetMaterial(replogo_icon)
		surface.DrawTexturedRectRotated(size + -650, -size - 1140, 85, 85, 0)
	elseif self.era == false then
	surface.SetDrawColor(Color(255, 255, 255))
	surface.SetMaterial(implogo_icon)
	surface.DrawTexturedRectRotated(size + -650, -size - 1140, 85, 85, 0)
	end
cam.End3D2D()
	
end 