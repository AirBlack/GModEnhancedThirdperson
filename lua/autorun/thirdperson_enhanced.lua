THIRDPERSON_ENHANCED = {}

local function IncludeFile(file)
	if SERVER then
		include(file);
		AddCSLuaFile(file);
	end
	if CLIENT then
		include(file);
	end
end

local files, _ = file.Find("thirdperson_enhanced/*.lua", "LUA");
for _, fileName in pairs(files) do
	IncludeFile("thirdperson_enhanced/" .. fileName);
end
