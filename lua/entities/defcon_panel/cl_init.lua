include("shared.lua")

local size = -950 / 2

function math.inrange(val, min, max)
    return val <= max and val >= min
end

local arrow_icon = Material("materials/shared/arrow.png")
local implogo_icon = Material("materials/shared/implogo.png")
local replogo_icon = Material("materials/shared/replogo.png")
local security_icon = Material("materials/shared/security.png")
local impsecurity_icon = Material("materials/shared/impsecurity.png")

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
		draw.SimpleText("DEFCON Information", "FORMATION:Title", 0, size + 50, self.htextcolor, 1, 1)
		--[[Defcon Colored Squares]]
		draw.RoundedBox(15, -800, -350, 115, 115, self.def5color)
		draw.RoundedBox(15, -800, -220, 115, 115, self.def4color)
		draw.RoundedBox(15, -800, -90, 115, 115, self.def3color)
		draw.RoundedBox(15, -800, 40, 115, 115, self.def2color)
		draw.RoundedBox(15, -800, 170, 115, 115, self.def1color)
		--[[Defcon Numerical Values]]
		draw.SimpleText("5", "FORMATION:Title", -745, -290, self.deftextcolor, 1, 1)
		draw.SimpleText("4", "FORMATION:Title", -745, -160, self.deftextcolor, 1, 1)
		draw.SimpleText("3", "FORMATION:Title", -745, -30, self.deftextcolor, 1, 1)
		draw.SimpleText("2", "FORMATION:Title", -745, 100, self.deftextcolor, 1, 1)
		draw.SimpleText("1", "FORMATION:Title", -745, 230, self.deftextcolor, 1, 1)
		--[[Defcon Basic Outline]]
		draw.SimpleText("The DEFCON system is in place to shorten response time and", "FORMATION:Main", 0, -300, self.textcolor, 1, 1)
		draw.SimpleText("mitigate panic in emergency situations. There are 5 levels", "FORMATION:Main", 0, -250, self.textcolor, 1, 1)
		draw.SimpleText("in descending order of severity, with each level requiring", "FORMATION:Main", 0, -200, self.textcolor, 1, 1)
		draw.SimpleText("a specific response from Troopers, Command and Navy.", "FORMATION:Main", 0, -150, self.textcolor, 1, 1)
		--[[Defcon Panel Information]]
		draw.SimpleText("Each page will focus primarily on 1 of the 5 Levels of", "FORMATION:Main", 0, -60, self.textcolor, 1, 1)
		draw.SimpleText("DEFCON, Remember DEFCON levels count down in", "FORMATION:Main", 0, -10, self.textcolor, 1, 1)
		draw.SimpleText("descending order 5 being the lowest threat DEFCON", "FORMATION:Main", 0, 40, self.textcolor, 1, 1)
		draw.SimpleText("level and 1 being the highest level threat.", "FORMATION:Main", 0, 90, self.textcolor, 1, 1)
		--[[Defcon relevance to HUD]]
		draw.SimpleText("On the Left you will notice the color code for each DEFCON,", "FORMATION:Main", 0, 180, self.textcolor, 1, 1)
		draw.SimpleText("You will also notice on the HUD that it should match one of the", "FORMATION:Main", 0, 230, self.textcolor, 1, 1)
		draw.SimpleText("levels which is how you will know the current DEFCON Threat", "FORMATION:Main", 0, 280, self.textcolor, 1, 1)
		--[[How to change page 101]]
		draw.SimpleText("Press E [USE] On Arrows to change page", "FORMATION:Main", 0, 350, self.hinttext, 1, 1)
		if self.era == true then 
		surface.SetDrawColor(Color(255, 255, 255))
		surface.SetMaterial(security_icon)
		surface.DrawTexturedRectRotated(size + 1200, -size - 470, 392, 804, 0)
		elseif self.era == false then
		surface.SetDrawColor(Color(255, 255, 255))
		surface.SetMaterial(impsecurity_icon)
		surface.DrawTexturedRectRotated(size + 1200, -size - 470, 392, 804, 0)
		end
		end
		
	if number == 2 then 
		draw.SimpleText("DEFCON 5", "FORMATION:Title", 0, size + 50, self.htextcolor, 1, 1)
		draw.RoundedBox(15, -275, -465, 115, 115, Color(0, 255, 0))
		draw.SimpleText("Normal Duties", "FORMATION:Main", 0, -365, self.textcolor, 1, 1)
		--[[Defcon 5 Information]]
		draw.SimpleText("DEFCON 5 is the lowest level in the Defence Condition (DEFCON) system.", "FORMATION:Main", 0, -230, self.textcolor, 1, 1)
		draw.SimpleText("At this level:", "FORMATION:Main", 0, -180, self.textcolor, 1, 1)
		draw.SimpleText("• Personnel are to maintain (or return to) their standard duties", "FORMATION:Main", -700, -80, self.textcolor, 0, 1)
		draw.SimpleText("• All troopers other than security personnel are to have their weapons holstered", "FORMATION:Main", -700, -30, self.textcolor, 0, 1)
		draw.SimpleText("• Any suspicious behaviour should be reported to your commanding officer,", "FORMATION:Main", -700, 20, self.textcolor, 0, 1)
		draw.SimpleText("security personnel, or central command", "FORMATION:Main", -700, 70, self.textcolor, 0, 1)

	end

	if number == 3 then 
		draw.SimpleText("DEFCON 4", "FORMATION:Title", 0, size + 50, self.htextcolor, 1, 1)
		draw.RoundedBox(15, -275, -465, 115, 115, Color(132, 201, 62))
		draw.SimpleText("Alert", "FORMATION:Main", 0, -365, self.textcolor, 1, 1)
		--[[Defcon 4 Information]]
		draw.SimpleText("DEFCON 4 is the second level in the Defence Condition system, this level is enacted when", "FORMATION:Main", 0, -230, self.textcolor, 1, 1)
		draw.SimpleText("there are reports or supsicions of possible enemy activity within, or around the ship or base.", "FORMATION:Main", 0, -180, self.textcolor, 1, 1)
		draw.SimpleText(" This level may also be enacted when leaving an active combat situation.", "FORMATION:Main", 0, -130, self.textcolor, 1, 1)
		draw.SimpleText("At this level:", "FORMATION:Main", 0, -80, self.textcolor, 1, 1)
		draw.SimpleText("• Personnel are to maintain (or return to) their standard duties,", "FORMATION:Main", -700, 20, self.textcolor, 0, 1)
		draw.SimpleText("whilst remaining alert for any suspicious activity or behaviour", "FORMATION:Main", -700, 70, self.textcolor, 0, 1)
		draw.SimpleText("• Navy Starfighter Pilots must make themselves ready to deploy if required", "FORMATION:Main", -700, 120, self.textcolor, 0, 1)
		draw.SimpleText("• All personnel are permitted to unholster their weapons, but must remain", "FORMATION:Main", -700, 170, self.textcolor, 0, 1)
		draw.SimpleText("on safety unless otherwise required", "FORMATION:Main", -700, 220, self.textcolor, 0, 1)
		draw.SimpleText("• Any suspicious behaviour should be reported to your acting commander,", "FORMATION:Main", -700, 270, self.textcolor, 0, 1)
		draw.SimpleText("security personnel, or central command", "FORMATION:Main", -700, 320, self.textcolor, 0, 1)
	
	end
	
	if number == 4 then 
		draw.SimpleText("DEFCON 3", "FORMATION:Title", 0, size + 50, self.htextcolor, 1, 1)
		draw.RoundedBox(15, -275, -465, 115, 115, Color(255, 204, 0))
		draw.SimpleText("Man Battlestations", "FORMATION:Main", 20, -365, self.textcolor, 1, 1)
		--[[Defcon 3 Information]]
		draw.SimpleText("DEFCON 3 is the third level in the Defence Condition system, this level is enacted when", "FORMATION:Main", 0, -230, self.textcolor, 1, 1)
		draw.SimpleText("hostile contacts have begun an assault on the base or ship. Troopers will be led by", "FORMATION:Main", 0, -180, self.textcolor, 1, 1)
		draw.SimpleText("their acting commanders to their assigned stations from which they will repel any attacks", "FORMATION:Main", 0, -130, self.textcolor, 1, 1)
		draw.SimpleText("At this level:", "FORMATION:Main", 0, -80, self.textcolor, 1, 1)
		draw.SimpleText("• All active duty personnel must report to their designated battle stations", "FORMATION:Main", -700, 20, self.textcolor, 0, 1)
		draw.SimpleText("• All personnel must have their weapons unholstered and ready for combat", "FORMATION:Main", -700, 70, self.textcolor, 0, 1)
		draw.SimpleText("• No non-combat takeoff or landing requests will be granted", "FORMATION:Main", -700, 120, self.textcolor, 0, 1)
		draw.SimpleText("• All suspicious behaviour and hostile activities must be relayed to", "FORMATION:Main", -700, 170, self.textcolor, 0, 1)
		draw.SimpleText("the Central Command", "FORMATION:Main", -700, 220, self.textcolor, 0, 1)
	end

	if number == 5 then 
		draw.SimpleText("DEFCON 2", "FORMATION:Title", 0, size + 50, self.htextcolor, 1, 1)
		draw.RoundedBox(15, -275, -465, 115, 115, Color(255, 128, 0))
		draw.SimpleText("Lockdown Essential Areas", "FORMATION:Main", 85, -365, self.textcolor, 1, 1)
		--[[Defcon 2 Information]]
		draw.SimpleText("DEFCON 2 is the fourth level in the Defence Condition system, this level is enacted when", "FORMATION:Main", 0, -230, self.textcolor, 1, 1)
		draw.SimpleText("hostile contacts have breached the base or ship.", "FORMATION:Main", 0, -180, self.textcolor, 1, 1)
		draw.SimpleText("At this level:", "FORMATION:Main", 0, -130, self.textcolor, 1, 1)
		draw.SimpleText("• All active duty personnel are to report or fall back to critical areas", "FORMATION:Main", -700, -30, self.textcolor, 0, 1)
		draw.SimpleText("such as the command center, bridge, or engine/reactor room", "FORMATION:Main", -700, 20, self.textcolor, 0, 1)
		draw.SimpleText("• Personnel must hold these areas at all costs, as losing any of them would", "FORMATION:Main", -700, 70, self.textcolor, 0, 1)
		draw.SimpleText("constitute a critical failure, severely disrupting Military and Naval operations", "FORMATION:Main", -700, 120, self.textcolor, 0, 1)
		
	end

	if number == 6 then 
		draw.SimpleText("DEFCON 1", "FORMATION:Title", 0, size + 50, self.htextcolor, 1, 1)
		draw.RoundedBox(15, -275, -465, 115, 115, Color(255, 0, 0))
		draw.SimpleText("Evacuate", "FORMATION:Main", 0, -365, self.textcolor, 1, 1)
		--[[Defcon 1 Information]]
		draw.SimpleText("DEFCON 1 is the final level in the Defence Condition system, this level is enacted when", "FORMATION:Main", 0, -230, self.textcolor, 1, 1)
		draw.SimpleText("hostile contacts destroyed key areas of the base or ship, or have commandeered", "FORMATION:Main", 0, -180, self.textcolor, 1, 1)
		draw.SimpleText("either of these assets, and the situation is deemed unsalvagable.", "FORMATION:Main", 0, -130, self.textcolor, 1, 1)
		draw.SimpleText("At this level:", "FORMATION:Main", 0, -80, self.textcolor, 1, 1)
		draw.SimpleText("• All personnel should proceed to the nearest hangar bay or transport", "FORMATION:Main", -700, 20, self.textcolor, 0, 1)
		draw.SimpleText("area to board transports", "FORMATION:Main", -700, 70, self.textcolor, 0, 1)
		draw.SimpleText("•  Any personnel holding appropriate pilot licenses for their vehicle class", "FORMATION:Main", -700, 120, self.textcolor, 0, 1)
		draw.SimpleText("are to depart, once their vehicle has been loaded with personnel", "FORMATION:Main", -700, 170, self.textcolor, 0, 1)
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
		draw.RoundedBox(0, -1900 / 2, -950 / 2, 1900, 100, self.hcolor)
		draw.RoundedBox(0, -1900 / 2, -770 / 2, 1900, 860, self.bcolor)

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
		surface.DrawTexturedRectRotated(size + -420, -size - 905, 85, 85, 0)
	elseif self.era == false then
	surface.SetDrawColor(Color(255, 255, 255))
	surface.SetMaterial(implogo_icon)
	surface.DrawTexturedRectRotated(size + -420, -size - 905, 85, 85, 0)
	end
cam.End3D2D()

end 