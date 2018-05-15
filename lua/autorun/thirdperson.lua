/*---------------------------------------------------------
	Original Code by AirBlack, modified by John Mason
---------------------------------------------------------*/
if CLIENT then
	CreateClientConVar("thirdperson_etp", 0, true, true)
	CreateClientConVar("thirdperson_etp_headpos", 0, true, true)
	CreateClientConVar("thirdperson_etp_offset_x", -40, true, true)
	CreateClientConVar("thirdperson_etp_offset_y", 20, true, true)
	CreateClientConVar("thirdperson_etp_offset_z", 0, true, true)
	CreateClientConVar("thirdperson_etp_angle_x", 0, true, true)
	CreateClientConVar("thirdperson_etp_angle_y", 0, true, true)
	CreateClientConVar("thirdperson_etp_angle_z", 0, true, true)
	CreateClientConVar("thirdperson_etp_fov", 75, true, true)
	CreateClientConVar("thirdperson_etp_bind", 0, true, true)
	CreateClientConVar("thirdperson_etp_aim", 1, true, true)
	CreateClientConVar("thirdperson_etp_crouchadd", 25, true, true)
	CreateClientConVar("thirdperson_etp_crosshair", 1, true, true)
	CreateClientConVar("thirdperson_etp_crosshair_r", 255, true, true)
	CreateClientConVar("thirdperson_etp_crosshair_g", 255, true, true)
	CreateClientConVar("thirdperson_etp_crosshair_b", 255, true, true)
	CreateClientConVar("thirdperson_etp_crosshair_alpha", 255, true, true)
	CreateClientConVar("thirdperson_etp_crosshair_size", 2, true, true)
	CreateClientConVar("thirdperson_etp_crosshair_outline", 1, true, true)
	CreateClientConVar("thirdperson_etp_crosshair_outline_r", 0, true, true)
	CreateClientConVar("thirdperson_etp_crosshair_outline_g", 0, true, true)
	CreateClientConVar("thirdperson_etp_crosshair_outline_b", 0, true, true)
	CreateClientConVar("thirdperson_etp_crosshair_outline_alpha", 255, true, true)
	CreateClientConVar("thirdperson_etp_crosshair_cone", 0, true, true)
	CreateClientConVar("thirdperson_etp_vehicles_sync", 1, true, true)
	CreateClientConVar("thirdperson_etp_addons_sync", 1, true, true)

	concommand.Add("thirdperson_enhanced_toggle", function(ply, cmd, args)
		local thirdPerson = GetConVar("thirdperson_etp")
		thirdPerson:SetBool(!thirdPerson:GetBool())

		if GetConVar("thirdperson_etp_addons_sync"):GetBool() then
			if thirdPerson:GetBool() then
				if GetConVar("gtvh_firstperson"):GetInt() == 1 then
					ply:ConCommand("gtvh_firstperson 0")
				end
			else
				if GetConVar("gtvh_firstperson"):GetInt() == 0 then
					ply:ConCommand("gtvh_firstperson 1")
				end
			end
		end
		
		local vsync = GetConVar("thirdperson_etp_vehicles_sync"):GetBool()

		if vsync and ply:InVehicle() then
			local veh = ply:GetVehicle()
			if thirdPerson:GetBool() then
				veh:SetThirdPersonMode(true)
			else
				veh:SetThirdPersonMode(false)
			end
		end
	end)

	hook.Add("CalcView", "thirdperson_etp", function(ply, pos, ang, fov, znear, zfar)
		local crouchadd = GetConVar("thirdperson_etp_crouchadd"):GetFloat()
		local thirdPersonEnabled = GetConVar("thirdperson_etp"):GetBool()
		local offsetX = GetConVar("thirdperson_etp_offset_x"):GetFloat()
		local offsetY = GetConVar("thirdperson_etp_offset_y"):GetFloat()
		local offsetZ = GetConVar("thirdperson_etp_offset_z"):GetFloat()
		local angleX = GetConVar("thirdperson_etp_angle_x"):GetFloat()
		local angleY = GetConVar("thirdperson_etp_angle_y"):GetFloat()
		local angleZ = GetConVar("thirdperson_etp_angle_z"):GetFloat()
		local useheadPos = GetConVar("thirdperson_etp_headpos"):GetBool()

		if ply:Crouching() and !useheadPos then offsetZ = offsetZ + crouchadd end
				if thirdPersonEnabled and !ply:InVehicle() and ply:Alive() then
					ply.CustomView = ply.CustomView or Angle()
					local newang = ply.CustomView
					local newpos = Vector(pos.x, pos.y, pos.z)
					if (useheadPos) then
						local headBone = ply:LookupBone("ValveBiped.Bip01_Head1")

						if (headBone and headBone > 0) then
							local headPos = ply:GetBonePosition(headBone)
							newpos = headPos
						end
					end

					newpos = newpos + newang:Right() * offsetY
					newpos = newpos + newang:Up() * offsetZ
					newpos = newpos + newang:Forward() * offsetX

					local tr2 = util.TraceHull({
						start = pos,
						endpos = newpos,
						filter = ply,
						maxs = Vector(5, 5, 5),
						mins = Vector(-5, -5, -5)

					})
					pos = tr2.HitPos
			if !GetConVar("thirdperson_etp_aim"):GetBool() then
				newang.x = angleX
				newang.y = angleY
				newang.z = angleZ
			end

			local view = {}
				view.drawviewer = true
				view.origin = pos
				view.fov = fov
				view.angles = newang + ply:GetViewPunchAngles()
				view.znear = znear
				view.zfar = zfar

			return view
		end
	end)


	local bindPressed = false

	local lastang = Angle()

	hook.Add("ShouldDrawLocalPlayer", "EnhancedThirdpersonShouldDrawLocalPlayer", function(ply)
		if !GetConVar("thirdperson_etp"):GetBool() then return end
		return true
	end)

	hook.Add("CreateMove", "EnhancedThirdpersonMouse", function(cmd)
		local ply = LocalPlayer()
		local thirdPersonEnabled = GetConVar("thirdperson_etp"):GetBool()
		local aim = GetConVar("thirdperson_etp_aim"):GetBool()

		if aim and thirdPersonEnabled and !ply:InVehicle() and ply:Alive() then
			ply.CustomView = ply.CustomView or Angle()
			local pos = EyePos()

			local tr = util.TraceLine({
				start = pos,
				endpos = pos + ply.CustomView:Forward() * 100000,
				filter = ply
			})

			local newEyeAng = (tr.HitPos - ply:EyePos()):Angle()
			newEyeAng = Angle(newEyeAng.p, newEyeAng.y, 0)
			newEyeAng = LerpAngle(FrameTime() * 20, ply:EyeAngles(), newEyeAng)
			local plyang = cmd:GetViewAngles()

			if lastang ~= plyang then
				local dif = (plyang - lastang)
				ply.CustomView.y = ply.CustomView.y + dif.y
				ply.CustomView.p = math.Clamp(ply.CustomView.p + dif.p, -89, 89)
			end

			cmd:SetViewAngles(newEyeAng)
			lastang = newEyeAng
			net.Start("thirdperson_etp")
			net.WriteAngle(ply.CustomView)
			net.SendToServer()
		end
		if (system.IsLinux() or system.HasFocus()) and !vgui.GetKeyboardFocus() and !gui.IsGameUIVisible() and !gui.IsConsoleVisible() then
			local bindKey = GetConVar("thirdperson_etp_bind"):GetInt()
			if input.IsKeyDown(bindKey) then
				bindPressed = true
			else
				if bindPressed then
					ply:ConCommand("thirdperson_enhanced_toggle")
					bindPressed = false
				end
			end
		end


	end)

	local recoilCone = 0

	hook.Add("HUDPaint", "EnhancedThirdpersonMouse", function()
		local ply = LocalPlayer()
		local thirdPersonEnabled = GetConVar("thirdperson_etp"):GetBool()
		local CsrR = GetConVar("thirdperson_etp_crosshair_r"):GetInt()
		local CsrG = GetConVar("thirdperson_etp_crosshair_g"):GetInt()
		local CsrB = GetConVar("thirdperson_etp_crosshair_b"):GetInt()
		local CsrA = GetConVar("thirdperson_etp_crosshair_alpha"):GetInt()
		local CsrSize = GetConVar("thirdperson_etp_crosshair_size"):GetInt()
		local outlineR = GetConVar("thirdperson_etp_crosshair_outline_r"):GetInt()
		local outlineG = GetConVar("thirdperson_etp_crosshair_outline_g"):GetInt()
		local outlineB = GetConVar("thirdperson_etp_crosshair_outline_b"):GetInt()
		local outlineA = GetConVar("thirdperson_etp_crosshair_outline_alpha"):GetInt()
		local outlineSize = CsrSize + 1
		local outline = GetConVar("thirdperson_etp_crosshair_outline"):GetBool()
		local cone = GetConVar("thirdperson_etp_crosshair_cone"):GetBool()
		local useCrossHair = GetConVar("thirdperson_etp_crosshair"):GetBool()

		if thirdPersonEnabled and useCrossHair and !ply:InVehicle() and ply:Alive() then

			local px = (ScrW() / 2)
			local py = (ScrH() / 2)

			if outline then
				surface.DrawCircle(px, py, outlineSize + 0.1, outlineR, outlineG, outlineB, outlineA)
			end
			for i = 1, CsrSize do
				surface.DrawCircle(px, py, i + 0.1, CsrR, CsrG, CsrB, CsrA)
			end

			if cone then
				local weapon = ply:GetActiveWeapon()
				if IsValid(weapon) and weapon.CalculateConeRecoil then
					recoilCone = math.Clamp((weapon:CalculateConeRecoil() * 90) / ply:GetFOV() * ScrH() / 1.44, 6, py)
				else
					recoilCone = Lerp(math.min(FrameTime() * 12, 1), recoilCone, 13)
					if IsValid(weapon) then
						if CurTime() < weapon:GetNextPrimaryFire() and weapon:Clip1() > 0 then
							recoilCone = math.Clamp(recoilCone + 1, 0, 30)
						end
					end
				end

				if outline then
					surface.DrawCircle(px, py, recoilCone + outlineSize + 0.1, outlineR, outlineG, outlineB, outlineA)
					surface.DrawCircle(px, py, recoilCone + 0.1, outlineR , outlineG, outlineB, outlineA)
				end
				for i = 1, CsrSize do
					surface.DrawCircle(px, py, recoilCone + i + 0.1, CsrR, CsrG, CsrB, CsrA)
				end
			end
		end
	end)

	hook.Add( "HUDShouldDraw", "EnhancedThirdpersonHideCrosshire", function(name)
		local thirdPersonEnabled = GetConVar("thirdperson_etp"):GetBool()
		local useCrossHair = GetConVar("thirdperson_etp_crosshair"):GetBool()
		if thirdPersonEnabled and useCrossHair then
			if (name == "CHudCrosshair") then
				return false
			end
		else
			if (name == "CHudCrosshair") then
				return true
			end
		end
	end)


	hook.Add("PopulateToolMenu", "ThirdpersonSandboxMenu", function()
		spawnmenu.AddToolMenuOption("Utilities", "User", "abthirdperson_options", "Thirdperson", "", "", function(panel)
			panel:SetName("Thirdperson")
			panel:AddControl("Header", {
				Text = "",
				Description = "Configuration menu for the Thirdperson."
			})
			local ConVarsDefault = {
				thirdperson_etp = "0",
				thirdperson_etp_headpos = "0",
				thirdperson_etp_crosshair = "2",
				thirdperson_etp_bind = "0",
				thirdperson_etp_offset_x = "-40",
				thirdperson_etp_offset_y = "20",
				thirdperson_etp_offset_z = "0",
				thirdperson_etp_angle_x = "0",
				thirdperson_etp_angle_y = "0",
				thirdperson_etp_angle_z = "0",
				thirdperson_etp_aim = "1",
				thirdperson_etp_fov = "75",
				thirdperson_etp_crosshair_r = "255",
				thirdperson_etp_crosshair_g = "255",
				thirdperson_etp_crosshair_b = "255",
				thirdperson_etp_crosshair_alpha = "255",
				thirdperson_etp_crosshair_size = "1",
				thirdperson_etp_crosshair_outline = "1",
				thirdperson_etp_crosshair_outline_r = "0",
				thirdperson_etp_crosshair_outline_g = "0",
				thirdperson_etp_crosshair_outline_b = "0",
				thirdperson_etp_crosshair_outline_alpha = "255",
				thirdperson_etp_crosshair_cone = "0",
				thirdperson_etp_vehicles_sync = "1",
				thirdperson_etp_addons_sync = "1"
			}

			panel:AddControl("ComboBox", {
				MenuButton = 1,
				Folder = "EnhancedThirdperson",
				Options = {[ "#preset.default" ] = ConVarsDefault },
				CVars = table.GetKeys(ConVarsDefault)
			})

			panel:AddControl("Checkbox", {
				Label = "Enable",
				Command = "thirdperson_etp"
			})

			panel:AddControl("Checkbox", {
				Label = "Use Head Position",
				Command = "thirdperson_etp_headpos"
			})

			panel:AddControl("Checkbox", {
				Label = "Use Sync for Default Vehicle",
				Command = "thirdperson_etp_vehicles_sync"
			})

			panel:AddControl("Checkbox", {
				Label = "Use Sync for Addons",
				Command = "thirdperson_etp_addons_sync"
			})

			panel:AddControl("Numpad", {
				Label = "Set the Bind-Key",
				Command = "thirdperson_etp_bind"
			})

			panel:AddControl("slider", {
				label = "Offset X",
				Command = "thirdperson_etp_offset_x",
				Min = - 70,
				Max = 70
			})

			panel:AddControl("slider", {
				label = "Offset Y",
				Command = "thirdperson_etp_offset_y",
				Min = - 70,
				Max = 70
			})

			panel:AddControl("slider", {
				label = "Offset Z",
				Command = "thirdperson_etp_offset_z",
				Min = - 70,
				Max = 70
			})

			panel:AddControl("Checkbox", {
				Label = "Enable Aiming",
				Command = "thirdperson_etp_aim"
			})

			panel:AddControl("label", {
				text = "If disable - Manual control angle"
			})

			panel:AddControl("slider", {
				label = "Angle X",
				Command = "thirdperson_etp_angle_x",
				Min = 0,
				Max = 360
			})

			panel:AddControl("slider", {
				label = "Angle Y",
				Command = "thirdperson_etp_angle_y",
				Min = 0,
				Max = 360
			})

			panel:AddControl("slider", {
				label = "Angle Z",
				Command = "thirdperson_etp_angle_z",
				Min = 0,
				Max = 360
			})

			panel:AddControl("slider", {
				label = "FOV",
				Command = "thirdperson_etp_fov",
				Min = 40,
				Max = 100
			})

			panel:AddControl("Checkbox", {
				Label = "Use Custom Crosshair",
				Command = "thirdperson_etp_crosshair"
			})

			panel:AddControl("Checkbox", {
				Label = "Crosshair Recoil Cone",
				Command = "thirdperson_etp_crosshair_cone"
			})

			panel:AddControl("slider", {
				label = "Сrosshair Size",
				Command = "thirdperson_etp_crosshair_size",
				Min = 1,
				Max = 4
			})

			panel:AddControl( "color", {
				Label = "Crosshair Color",
				Red = "thirdperson_etp_crosshair_r",
				Green = "thirdperson_etp_crosshair_g",
				Blue = "thirdperson_etp_crosshair_b",
				Alpha = "thirdperson_etp_crosshair_alpha"
			})

			panel:AddControl("Checkbox", {
				Label = "Crosshair Outline",
				Command = "thirdperson_etp_crosshair_outline"
			})

			panel:AddControl( "color", {
				Label = "Сrosshair Outline Color",
				Red = "thirdperson_etp_crosshair_outline_r",
				Green = "thirdperson_etp_crosshair_outline_g",
				Blue = "thirdperson_etp_crosshair_outline_b",
				Alpha = "thirdperson_etp_crosshair_outline_alpha"
			})
		end)
	end)


elseif SERVER then
	util.AddNetworkString("thirdperson_etp")

	net.Receive("thirdperson_etp", function(len, ply)
		ply.CustomView = net.ReadAngle()
	end)

	hook.Add("PlayerEnteredVehicle", "EnhancedThirdpersonСheckVehicleEntered", function(ply, veh, role)
		local thirdPersonEnabled = ply:GetInfoNum("thirdperson_etp", 0) == 1
		if IsValid(veh) then
			if thirdPersonEnabled then
				veh:SetThirdPersonMode(true)
			else
				veh:SetThirdPersonMode(false)
			end
		end
	end)

	hook.Add("PlayerLeaveVehicle", "EnhancedThirdpersonСheckVehicleLeave", function(ply, veh)
		if IsValid(veh) then
			if veh:GetThirdPersonMode() then
				ply:ConCommand("thirdperson_etp 1")
			else
				ply:ConCommand("thirdperson_etp 0")
			end
		end
	end)
end

hook.Add("SetupMove", "EnhancedThirdpersonMove", function(ply, mv)
	local thirdPersonEnabled = ply:GetInfoNum("thirdperson_etp", 0) == 1
	if thirdPersonEnabled and !ply:InVehicle() and ply:Alive() then
		ply.CustomView = ply.CustomView or Angle()
		mv:SetMoveAngles(ply.CustomView)
	end
end)
