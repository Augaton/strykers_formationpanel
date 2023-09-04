include("shared.lua")

local size = -950 / 2

function math.inrange(val, min, max)
    return val <= max and val >= min
end

local arrow_icon = Material("materials/shared/arrow.png")
local implogo_icon = Material("materials/shared/implogo.png")
local replogo_icon = Material("materials/shared/replogo.png")

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
		draw.SimpleText("Formation Information", "FORMATION:Title", 0, size + 50, self.htextcolor, 1, 1)
		draw.RoundedBox(0, -330, -300, 128, 128, self.comcolor)
		draw.RoundedBox(0, -330, -150, 128, 128, self.troopcolor)
		draw.SimpleText("Commanding Officer", "FORMATION:Main", -150, -230, self.textcolor, 0, 1)
		draw.SimpleText("Trooper(s)", "FORMATION:Main", -150, -80, self.textcolor, 0, 1)
		draw.SimpleText("During formations troopers will", "FORMATION:Main", 0, 100, self.textcolor, 1, 1)
		draw.SimpleText("line up in highest ranking order.", "FORMATION:Main", 0, 150, self.textcolor, 1, 1)
		draw.SimpleText("Press E [USE] On Arrows to change page", "FORMATION:Main", 0, 350, self.hinttext, 1, 1)
		end
		
	if number == 2 then 
		draw.SimpleText("Single Column", "FORMATION:Title", 0, size + 50, self.htextcolor, 1, 1)
		draw.RoundedBox(0, -64, -300, 128, 128, self.comcolor)

		for i=1, 3 do 
			draw.RoundedBox(0, -64, -300 + (135 * i), 128, 128, self.troopcolor)
		end
	end

	if number == 3 then 
		draw.SimpleText("Dual Column", "FORMATION:Title", 0, size + 50, self.htextcolor, 1, 1)

		draw.RoundedBox(0, -64, -300, 128, 128, self.comcolor)

		for i=1, 3 do 
			draw.RoundedBox(0, -128 - 64, -300 + (135 * i), 128, 128, self.troopcolor)
		end

		for i=1, 3 do 
			draw.RoundedBox(0, 64, -300 + (135 * i), 128, 128, self.troopcolor)
		end
	end
	
	if number == 4 then 
		draw.SimpleText("Tight/Loose Wedge", "FORMATION:Title", 0, size + 50, self.htextcolor, 1, 1)

		draw.RoundedBox(0, -64, -300, 110, 110, self.comcolor)

		self.min = -110
		self.max = -50

		self.lx = Lerp(FrameTime() * 5, self.lx, self.x)

		for i=1, 3 do 
			draw.RoundedBox(0, -128 + (self.lx * i), -300 + (135 * i), 110, 110, self.troopcolor)
		end

		for i=1, 3 do 
			draw.RoundedBox(0, 0 - (self.lx * i), -300 + (135 * i), 110, 110, self.troopcolor)
		end
	end

	if number == 5 then 
		draw.SimpleText("Diamond | VIP | Prisoner", "FORMATION:Title", 0, size + 50, self.htextcolor, 1, 1)

		draw.RoundedBox(0, -64, -64, 128, 128, self.comcolor)

		self.min = 0
		self.max = 100

		self.lx = Lerp(FrameTime() * 5, self.lx, self.x)

		draw.RoundedBox(0, -64, -64 + (150 + self.lx), 128, 128, self.troopcolor)
		draw.RoundedBox(0, -64, -64 - (150 + self.lx), 128, 128, self.troopcolor)
		draw.RoundedBox(0, -64 + (150 + self.lx), -64, 128, 128, self.troopcolor)
		draw.RoundedBox(0, -64 - (150 + self.lx), -64, 128, 128, self.troopcolor)
	end

	if number == 6 then 
		draw.SimpleText("Firing Line", "FORMATION:Title", 0, size + 50, self.htextcolor, 1, 1)

		for i=1, 5 do  
			draw.RoundedBox(0, size + 135 * i + 10, -64, 128, 128, self.troopcolor)

			if i == 3 then 
				draw.RoundedBox(0, size + 135 * i + 10, -64, 128, 128, self.comcolor)
			end
		end
	end
	
		if number == 7 then 
		draw.SimpleText("Advanced Firing Line", "FORMATION:Title", 0, size + 50, self.htextcolor, 1, 1)

		for i=1, 5 do  
			draw.RoundedBox(0, size + 135 * i + 10, -135, 128, 128, self.troopcolor)
		end

		for i=1, 5 do  
			draw.RoundedBox(0, size + 135 * i + 10, 0, 128, 128, self.troopcolor)

			if i == 3 then 
				draw.RoundedBox(0, size + 135 * i + 10, 0, 128, 128, self.comcolor)
			end
		end
	end
	
	if number == 8 then 
		draw.SimpleText("Staggered Column", "FORMATION:Title", 0, size + 50, self.htextcolor, 1, 1)

			draw.RoundedBox(0, -150 - 64, -310, 128, 128, self.comcolor)
			draw.RoundedBox(0, 100 - 40, -140, 128, 128, self.troopcolor)
			draw.RoundedBox(0, -150 - 64, 30, 128, 128, self.troopcolor)
			draw.RoundedBox(0, 100 - 40, 200, 128, 128, self.troopcolor)
		end
	
	if number == 9 then 
		draw.SimpleText("Left Echelon", "FORMATION:Title", 0, size + 50, self.htextcolor, 1, 1)
		
			draw.RoundedBox(0, 150, -300, 128, 128, self.comcolor)
			draw.RoundedBox(0, 0, -150, 128, 128, self.troopcolor)
			draw.RoundedBox(0, -150, 0, 128, 128, self.troopcolor)
			draw.RoundedBox(0, -300, 150, 128, 128, self.troopcolor)
		end
		
	if number == 10 then 
		draw.SimpleText("Right Echelon", "FORMATION:Title", 0, size + 50, self.htextcolor, 1, 1)
		
			draw.RoundedBox(0, -300, -300, 128, 128, self.comcolor)
			draw.RoundedBox(0, -150, -150, 128, 128, self.troopcolor)
			draw.RoundedBox(0, 0, 0, 128, 128, self.troopcolor)
			draw.RoundedBox(0, 150, 150, 128, 128, self.troopcolor)
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
		draw.RoundedBox(0, -950 / 2, -950 / 2, 950, 100, self.hcolor)
		draw.RoundedBox(0, -950 / 2, -770 / 2, 950, 860, self.bcolor)

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
		surface.DrawTexturedRectRotated(size + 60, -size - 905, 85, 85, 0)
	elseif self.era == false then
	surface.SetDrawColor(Color(255, 255, 255))
	surface.SetMaterial(implogo_icon)
	surface.DrawTexturedRectRotated(size + 60, -size - 905, 85, 85, 0)
	end
cam.End3D2D()

end 