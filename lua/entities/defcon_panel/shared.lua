ENT.Base = "gmod_base"
ENT.Type = "anim"
ENT.Base = "base_gmodentity"
 
ENT.PrintName = "Defcon Panel"
ENT.Category = "Stryker's Information Panels"
ENT.Spawnable = true

function ENT:SetupDataTables()
	self:NetworkVar("Float", 0, "Page")
	self:NetworkVar("Float", 1, "Max")

	--[[CONFIG]]--
	
	--[[change max pages here]]--
	--[[You would do this if you plan on adding more pages with information or removing unnesscary pages]]--
	self:SetPage(1)
	self:SetMax(6) 
	
	--[[true = Republic | false = Imperial]]--
	self.era = true 
	
	--[[Header Color and Background Color]]--
	self.hcolor = Color(25, 122, 248)
	self.bcolor = Color(34, 36, 43)
	--[[Header Text Color and Text Color]]--
	self.htextcolor = Color(255, 255, 255)
	self.textcolor = Color(255, 255, 255)
	--[[Defcon Number Text and Individual Colors for Each Defcon Level]]--
	self.deftextcolor = Color(0, 0, 0)
	self.def5color = Color(0, 255, 0)
	self.def4color = Color(132, 201, 62)
	self.def3color = Color(255, 204, 0)
	self.def2color = Color(255, 128, 0)
	self.def1color = Color(255, 0, 0)
	--[[Page changing hint text color and page number color]]--
	self.hinttext = Color(255, 255, 255)
	self.pagenum = Color(255, 255, 255)
	--[[Changes the shade of the arrows when hovered over]]--
	self.pcolor = Color(0, 90, 255)
end


