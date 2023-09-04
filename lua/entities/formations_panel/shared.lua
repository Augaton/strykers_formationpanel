ENT.Base = "gmod_base"
ENT.Type = "anim"
ENT.Base = "base_gmodentity"
 
ENT.PrintName = "Formation Panel"
ENT.Category = "Stryker's Information Panels"
ENT.Spawnable = true

function ENT:SetupDataTables()
	self:NetworkVar("Float", 0, "Page")
	self:NetworkVar("Float", 1, "Max")
	
	--[[CONFIG]]--
	
	--[[change max pages here]]--
	--[[You would do this if you plan on adding more pages with information or removing unnesscary pages]]--
	self:SetPage(1)
	self:SetMax(10) --[[Set This Value to 7 to hide the extra Formations - Staggered Column | Left Echelon | Right Echelon ]]--

	--[[true = Republic | false = Imperial]]--
	self.era = true 
	
	--[[Commander And Trooper Box Colors]]--
	self.comcolor = Color(191, 0, 0)
	self.troopcolor = Color(0, 90, 255)
	--[[Header Color and Background Color]]--
	self.hcolor = Color(25, 122, 248)
	self.bcolor = Color(34, 36, 43)
	--[[Header Text Color and Text Color]]--
	self.htextcolor = Color(255, 255, 255)
	self.textcolor = Color(255, 255, 255)
	--[[Page changing hint text color and page number color]]--
	self.hinttext = Color(255, 255, 255)
	self.pagenum = Color(255, 255, 255)
	--[[Changes the shade of the arrows when hovered over]]--
	self.pcolor = Color(0, 90, 255)
	
end