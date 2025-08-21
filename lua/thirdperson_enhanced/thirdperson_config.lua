if CLIENT then

	CreateClientConVar("thirdperson_etp", 							0, 		true, true)
	CreateClientConVar("thirdperson_etp_headpos", 					0, 		true, true)
	CreateClientConVar("thirdperson_etp_offset_x",					-40.0, 	true, true)
	CreateClientConVar("thirdperson_etp_offset_y",					20.0, 	true, true)
	CreateClientConVar("thirdperson_etp_offset_z", 					0.0, 	true, true)
	CreateClientConVar("thirdperson_etp_angle_x", 					0.0, 	true, true)
	CreateClientConVar("thirdperson_etp_angle_y", 					0.0, 	true, true)
	CreateClientConVar("thirdperson_etp_angle_z", 					0.0, 	true, true)
	CreateClientConVar("thirdperson_etp_fov", 						75, 	true, true)
	CreateClientConVar("thirdperson_etp_smoothing", 				0, 		true, true)
	CreateClientConVar("thirdperson_etp_smoothing_speed",			60.0, 	true, true)
	CreateClientConVar("thirdperson_etp_bind", 						0, 		true, true)
	CreateClientConVar("thirdperson_etp_freelook_bind", 			0, 		true, true)
	CreateClientConVar("thirdperson_etp_aim", 						1, 		true, true)
	CreateClientConVar("thirdperson_etp_crouchadd", 				25, 	true, true)
	CreateClientConVar("thirdperson_etp_crosshair", 				1, 		true, true)
	CreateClientConVar("thirdperson_etp_crosshair_dot", 			1, 		true, true)
	CreateClientConVar("thirdperson_etp_crosshair_gap", 			1.0, 	true, true)
	CreateClientConVar("thirdperson_etp_crosshair_r", 				255, 	true, true)
	CreateClientConVar("thirdperson_etp_crosshair_g", 				255, 	true, true)
	CreateClientConVar("thirdperson_etp_crosshair_b", 				255, 	true, true)
	CreateClientConVar("thirdperson_etp_crosshair_alpha", 			255, 	true, true)
	CreateClientConVar("thirdperson_etp_crosshair_size", 			1.0, 	true, true)
	CreateClientConVar("thirdperson_etp_crosshair_outline", 		1, 		true, true)
	CreateClientConVar("thirdperson_etp_crosshair_outline_r", 		0, 		true, true)
	CreateClientConVar("thirdperson_etp_crosshair_outline_g", 		0, 		true, true)
	CreateClientConVar("thirdperson_etp_crosshair_outline_b", 		0, 		true, true)
	CreateClientConVar("thirdperson_etp_crosshair_outline_alpha", 	255, 	true, true)
	CreateClientConVar("thirdperson_etp_crosshair_style", 			0, 		true, true)
	CreateClientConVar("thirdperson_etp_vehicles_sync", 			1,		true, true)
	CreateClientConVar("thirdperson_etp_addons_sync", 				1,		true, true)
	language.Add( "Thirdperson", "Thirdperson" )

	hook.Add("PopulateToolMenu", "ThirdpersonSandboxMenu", function()
		spawnmenu.AddToolMenuOption("Utilities", "User", "thirdperson_etp_options", "Thirdperson", "", "", function(panel)
			panel:ClearControls()
			panel:Help("Configuration menu for the Thirdperson.")
			local defaults = {
				thirdperson_etp_headpos = "0",
				thirdperson_etp_offset_x = "-40.0",
				thirdperson_etp_offset_y = "20.0",
				thirdperson_etp_offset_z = "0.0",
				thirdperson_etp_angle_x = "0.0",
				thirdperson_etp_angle_y = "0.0",
				thirdperson_etp_angle_z = "0.0",
				thirdperson_etp_aim = "1",
				thirdperson_etp_fov = "75",
				thirdperson_etp_smoothing = "0",
				thirdperson_etp_smoothing_speed = "60.0",
				thirdperson_etp_crosshair = "0",
				thirdperson_etp_crosshair_style = "0",
				thirdperson_etp_crosshair_dot = "1",
				thirdperson_etp_crosshair_gap = "1.0",
				thirdperson_etp_crosshair_r = "255",
				thirdperson_etp_crosshair_g = "255",
				thirdperson_etp_crosshair_b = "255",
				thirdperson_etp_crosshair_alpha = "255",
				thirdperson_etp_crosshair_size = "1.0",
				thirdperson_etp_crosshair_outline = "0",
				thirdperson_etp_crosshair_outline_r = "0",
				thirdperson_etp_crosshair_outline_g = "0",
				thirdperson_etp_crosshair_outline_b = "0",
				thirdperson_etp_crosshair_outline_alpha = "255"
			}

			local toolPresets = panel:ToolPresets("util_thirdperson_extension", defaults)

			local preloadedOptions = {
				[ "GTA V/Max Payne 3" ] = {
					thirdperson_etp_headpos = "0",
					thirdperson_etp_offset_x = "-100.0",
					thirdperson_etp_offset_y = "35.0",
					thirdperson_etp_offset_z = "0.0",
					thirdperson_etp_angle_x = "0.0",
					thirdperson_etp_angle_y = "0.0",
					thirdperson_etp_angle_z = "0.0",
					thirdperson_etp_aim = "1",
					thirdperson_etp_fov = "85",
					thirdperson_etp_smoothing = "0",
					thirdperson_etp_smoothing_speed = "60.0",
					thirdperson_etp_crosshair = "1",
					thirdperson_etp_crosshair_style = "0",
					thirdperson_etp_crosshair_dot = "1",
					thirdperson_etp_crosshair_gap = "1.0",
					thirdperson_etp_crosshair_r = "255",
					thirdperson_etp_crosshair_g = "255",
					thirdperson_etp_crosshair_b = "255",
					thirdperson_etp_crosshair_alpha = "255",
					thirdperson_etp_crosshair_size = "1.0",
					thirdperson_etp_crosshair_outline = "1",
					thirdperson_etp_crosshair_outline_r = "0",
					thirdperson_etp_crosshair_outline_g = "0",
					thirdperson_etp_crosshair_outline_b = "0",
					thirdperson_etp_crosshair_outline_alpha = "255"
				},
				[ "GTA IV" ] = {
					thirdperson_etp_headpos = "0",
					thirdperson_etp_offset_x = "-100.0",
					thirdperson_etp_offset_y = "35.0",
					thirdperson_etp_offset_z = "0.0",
					thirdperson_etp_angle_x = "0.0",
					thirdperson_etp_angle_y = "0.0",
					thirdperson_etp_angle_z = "0.0",
					thirdperson_etp_aim = "1",
					thirdperson_etp_fov = "80",
					thirdperson_etp_smoothing = "0",
					thirdperson_etp_smoothing_speed = "60.0",
					thirdperson_etp_crosshair = "1",
					thirdperson_etp_crosshair_style = "1",
					thirdperson_etp_crosshair_dot = "1",
					thirdperson_etp_crosshair_gap = "1.5",
					thirdperson_etp_crosshair_r = "255",
					thirdperson_etp_crosshair_g = "255",
					thirdperson_etp_crosshair_b = "255",
					thirdperson_etp_crosshair_alpha = "25",
					thirdperson_etp_crosshair_size = "1.0",
					thirdperson_etp_crosshair_outline = "0",
					thirdperson_etp_crosshair_outline_r = "0",
					thirdperson_etp_crosshair_outline_g = "0",
					thirdperson_etp_crosshair_outline_b = "0",
					thirdperson_etp_crosshair_outline_alpha = "255"
				},
				[ "GTA IV TLAD" ] = {
					thirdperson_etp_headpos = "0",
					thirdperson_etp_offset_x = "-100.0",
					thirdperson_etp_offset_y = "35.0",
					thirdperson_etp_offset_z = "0.0",
					thirdperson_etp_angle_x = "0.0",
					thirdperson_etp_angle_y = "0.0",
					thirdperson_etp_angle_z = "0.0",
					thirdperson_etp_aim = "1",
					thirdperson_etp_fov = "80",
					thirdperson_etp_smoothing = "0",
					thirdperson_etp_smoothing_speed = "60.0",
					thirdperson_etp_crosshair = "1",
					thirdperson_etp_crosshair_style = "1",
					thirdperson_etp_crosshair_dot = "1",
					thirdperson_etp_crosshair_gap = "1.5",
					thirdperson_etp_crosshair_r = "255",
					thirdperson_etp_crosshair_g = "135",
					thirdperson_etp_crosshair_b = "135",
					thirdperson_etp_crosshair_alpha = "25",
					thirdperson_etp_crosshair_size = "1.0",
					thirdperson_etp_crosshair_outline = "0",
					thirdperson_etp_crosshair_outline_r = "0",
					thirdperson_etp_crosshair_outline_g = "0",
					thirdperson_etp_crosshair_outline_b = "0",
					thirdperson_etp_crosshair_outline_alpha = "255"
				},
				[ "GTA IV TBOGT" ] = {
					thirdperson_etp_headpos = "0",
					thirdperson_etp_offset_x = "-100.0",
					thirdperson_etp_offset_y = "35.0",
					thirdperson_etp_offset_z = "0.0",
					thirdperson_etp_angle_x = "0.0",
					thirdperson_etp_angle_y = "0.0",
					thirdperson_etp_angle_z = "0.0",
					thirdperson_etp_aim = "1",
					thirdperson_etp_fov = "80",
					thirdperson_etp_smoothing = "0",
					thirdperson_etp_smoothing_speed = "60.0",
					thirdperson_etp_crosshair = "1",
					thirdperson_etp_crosshair_style = "1",
					thirdperson_etp_crosshair_dot = "1",
					thirdperson_etp_crosshair_gap = "1.5",
					thirdperson_etp_crosshair_r = "255",
					thirdperson_etp_crosshair_g = "135",
					thirdperson_etp_crosshair_b = "225",
					thirdperson_etp_crosshair_alpha = "25",
					thirdperson_etp_crosshair_size = "1.0",
					thirdperson_etp_crosshair_outline = "0",
					thirdperson_etp_crosshair_outline_r = "0",
					thirdperson_etp_crosshair_outline_g = "0",
					thirdperson_etp_crosshair_outline_b = "0",
					thirdperson_etp_crosshair_outline_alpha = "255"
				},
				[ "Saints Row/Just Cause" ] = {
					thirdperson_etp_headpos = "0",
					thirdperson_etp_offset_x = "-100.0",
					thirdperson_etp_offset_y = "35.0",
					thirdperson_etp_offset_z = "0.0",
					thirdperson_etp_angle_x = "0.0",
					thirdperson_etp_angle_y = "0.0",
					thirdperson_etp_angle_z = "0.0",
					thirdperson_etp_aim = "1",
					thirdperson_etp_fov = "80",
					thirdperson_etp_smoothing = "0",
					thirdperson_etp_smoothing_speed = "60.0",
					thirdperson_etp_crosshair = "1",
					thirdperson_etp_crosshair_style = "2",
					thirdperson_etp_crosshair_dot = "0",
					thirdperson_etp_crosshair_gap = "1.5",
					thirdperson_etp_crosshair_r = "255",
					thirdperson_etp_crosshair_g = "255",
					thirdperson_etp_crosshair_b = "255",
					thirdperson_etp_crosshair_alpha = "255",
					thirdperson_etp_crosshair_size = "2.0",
					thirdperson_etp_crosshair_outline = "1",
					thirdperson_etp_crosshair_outline_r = "0",
					thirdperson_etp_crosshair_outline_g = "0",
					thirdperson_etp_crosshair_outline_b = "0",
					thirdperson_etp_crosshair_outline_alpha = "255"
				},
				[ "Machinima" ] = {
					thirdperson_etp_headpos = "0",
					thirdperson_etp_offset_x = "-200.0",
					thirdperson_etp_offset_y = "0.0",
					thirdperson_etp_offset_z = "0.0",
					thirdperson_etp_angle_x = "0.0",
					thirdperson_etp_angle_y = "0.0",
					thirdperson_etp_angle_z = "0.0",
					thirdperson_etp_aim = "1",
					thirdperson_etp_fov = "35",
					thirdperson_etp_smoothing = "1",
					thirdperson_etp_smoothing_speed = "5.0",
					thirdperson_etp_crosshair = "1",
					thirdperson_etp_crosshair_style = "0",
					thirdperson_etp_crosshair_dot = "0",
					thirdperson_etp_crosshair_gap = "1.0",
					thirdperson_etp_crosshair_r = "255",
					thirdperson_etp_crosshair_g = "255",
					thirdperson_etp_crosshair_b = "255",
					thirdperson_etp_crosshair_alpha = "255",
					thirdperson_etp_crosshair_size = "1.0",
					thirdperson_etp_crosshair_outline = "0",
					thirdperson_etp_crosshair_outline_r = "0",
					thirdperson_etp_crosshair_outline_g = "0",
					thirdperson_etp_crosshair_outline_b = "0",
					thirdperson_etp_crosshair_outline_alpha = "255"
				},
				[ "Minecraft" ] = {
					thirdperson_etp_headpos = "0",
					thirdperson_etp_offset_x = "-150.00",
					thirdperson_etp_offset_y = "0.0",
					thirdperson_etp_offset_z = "20.0",
					thirdperson_etp_angle_x = "0.0",
					thirdperson_etp_angle_y = "0.0",
					thirdperson_etp_angle_z = "0.0",
					thirdperson_etp_aim = "1",
					thirdperson_etp_fov = "75",
					thirdperson_etp_smoothing = "0",
					thirdperson_etp_smoothing_speed = "100.0",
					thirdperson_etp_crosshair = "1",
					thirdperson_etp_crosshair_style = "2",
					thirdperson_etp_crosshair_dot = "0",
					thirdperson_etp_crosshair_gap = "0.0",
					thirdperson_etp_crosshair_r = "255",
					thirdperson_etp_crosshair_g = "255",
					thirdperson_etp_crosshair_b = "255",
					thirdperson_etp_crosshair_alpha = "255",
					thirdperson_etp_crosshair_size = "3.0",
					thirdperson_etp_crosshair_outline = "0",
					thirdperson_etp_crosshair_outline_r = "0",
					thirdperson_etp_crosshair_outline_g = "0",
					thirdperson_etp_crosshair_outline_b = "0",
					thirdperson_etp_crosshair_outline_alpha = "255"
				},
				[ "Mass Effect" ] = {
					thirdperson_etp_headpos = "0",
					thirdperson_etp_offset_x = "-50.0",
					thirdperson_etp_offset_y = "20.0",
					thirdperson_etp_offset_z = "0.0",
					thirdperson_etp_angle_x = "0.0",
					thirdperson_etp_angle_y = "0.0",
					thirdperson_etp_angle_z = "0.0",
					thirdperson_etp_aim = "1",
					thirdperson_etp_fov = "75",
					thirdperson_etp_smoothing = "0",
					thirdperson_etp_smoothing_speed = "60.0",
					thirdperson_etp_crosshair = "1",
					thirdperson_etp_crosshair_style = "1",
					thirdperson_etp_crosshair_dot = "0",
					thirdperson_etp_crosshair_gap = "2.0",
					thirdperson_etp_crosshair_r = "255",
					thirdperson_etp_crosshair_g = "160",
					thirdperson_etp_crosshair_b = "0",
					thirdperson_etp_crosshair_alpha = "65",
					thirdperson_etp_crosshair_size = "2.0",
					thirdperson_etp_crosshair_outline = "0",
					thirdperson_etp_crosshair_outline_r = "0",
					thirdperson_etp_crosshair_outline_g = "0",
					thirdperson_etp_crosshair_outline_b = "0",
					thirdperson_etp_crosshair_outline_alpha = "255"
				},
				[ "Firstperson" ] = {
					thirdperson_etp_headpos = "1",
					thirdperson_etp_offset_x = "5.0",
					thirdperson_etp_offset_y = "0.0",
					thirdperson_etp_offset_z = "0.0",
					thirdperson_etp_angle_x = "0.0",
					thirdperson_etp_angle_y = "0.0",
					thirdperson_etp_angle_z = "0.0",
					thirdperson_etp_aim = "1",
					thirdperson_etp_fov = "85",
					thirdperson_etp_smoothing = "0",
					thirdperson_etp_smoothing_speed = "100.0",
					thirdperson_etp_crosshair = "1",
					thirdperson_etp_crosshair_style = "2",
					thirdperson_etp_crosshair_dot = "0",
					thirdperson_etp_crosshair_gap = "1.0",
					thirdperson_etp_crosshair_r = "255",
					thirdperson_etp_crosshair_g = "255",
					thirdperson_etp_crosshair_b = "255",
					thirdperson_etp_crosshair_alpha = "255",
					thirdperson_etp_crosshair_size = "1.0",
					thirdperson_etp_crosshair_outline = "0",
					thirdperson_etp_crosshair_outline_r = "0",
					thirdperson_etp_crosshair_outline_g = "0",
					thirdperson_etp_crosshair_outline_b = "0",
					thirdperson_etp_crosshair_outline_alpha = "255"
				}
			}

			for optionName, optionConvars in pairs(preloadedOptions) do
				toolPresets:AddOption(optionName, optionConvars)
			end

			panel:CheckBox("Enable", "thirdperson_etp")
			panel:ControlHelp("Not saved in presets")

			panel:CheckBox("Use Sync for Default Vehicle", "thirdperson_etp_vehicles_sync")
			panel:ControlHelp("Not saved in presets")

			panel:CheckBox("Use Sync for Addons", "thirdperson_etp_addons_sync")
			panel:ControlHelp("Not saved in presets")

			panel:CheckBox("Use Head Position", "thirdperson_etp_headpos")

			panel:KeyBinder("Set the Bind-Key", "thirdperson_etp_bind", "Set the free-look Bind-Key", "thirdperson_etp_freelook_bind")
			panel:ControlHelp("Binds are not saved in presets")

			panel:NumSlider("Offset X", "thirdperson_etp_offset_x", -150.0, 150.0)
			panel:NumSlider("Offset Y", "thirdperson_etp_offset_y", -150.0, 150.0)
			panel:NumSlider("Offset Z", "thirdperson_etp_offset_z", -150.0, 150.0)
			panel:NumSlider("FOV", "thirdperson_etp_fov", "25", 100, 0)

			local aimingCheckbox = panel:CheckBox("Enable Aiming", "thirdperson_etp_aim")

			panel:ControlHelp("If disabled - Manual view angle control trough sliders below")

			local angleSliders = {
				panel:NumSlider("Angle X", "thirdperson_etp_angle_x", -90.0, 90.0),
				panel:NumSlider("Angle Y", "thirdperson_etp_angle_y", 0.0, 360.0),
				panel:NumSlider("Angle Z", "thirdperson_etp_angle_z", 0.0, 360.0)
			}

			aimingCheckbox.OnChange = function(_, aimingEnabled)
				for _, slider in ipairs(angleSliders) do
					slider:SetEnabled(!aimingEnabled)
				end
			end

			local smoothCheckbox = panel:CheckBox("Smooth Camera Moving", "thirdperson_etp_smoothing")

			local smoothSlider = panel:NumSlider("Speed Smooth Camera", "thirdperson_etp_smoothing_speed", 0.0, 100.0)

			smoothCheckbox.OnChange = function(_, smoothEnabled)
				smoothSlider:SetEnabled(smoothEnabled)
			end

			local crosshairCheckbox = panel:CheckBox("Use Custom Crosshair", "thirdperson_etp_crosshair")


			local function createCrosshairCombobox()
				local combobox, _ = panel:ComboBox("Crosshair Style", "thirdperson_etp_crosshair_style")

				combobox:AddChoice("Nothing", 0)
				combobox:AddChoice("Cone", 1)
				combobox:AddChoice("Lines", 2)

				return combobox
			end

			local crosshairViews = {
				panel:CheckBox("Use Crosshair Dot", "thirdperson_etp_crosshair_dot"),
				createCrosshairCombobox(),
				panel:NumSlider("Сrosshair Gap Scale", "thirdperson_etp_crosshair_gap", 0.0, 2.0),
				panel:NumSlider("Сrosshair Size", "thirdperson_etp_crosshair_size", 1.0, 3.0),

				panel:ColorPicker(
					"Crosshair Color",
					"thirdperson_etp_crosshair_r",
					"thirdperson_etp_crosshair_g",
					"thirdperson_etp_crosshair_b",
					"thirdperson_etp_crosshair_alpha"
				)
			}

			local crosshairOutlineCheckbox = panel:CheckBox("Crosshair Outline", "thirdperson_etp_crosshair_outline")

			crosshairViews[#crosshairViews + 1] = crosshairOutlineCheckbox

			local crosshairOutlinePicker = panel:ColorPicker(
				"Сrosshair Outline Color",
				"thirdperson_etp_crosshair_outline_r",
				"thirdperson_etp_crosshair_outline_g",
				"thirdperson_etp_crosshair_outline_b",
				"thirdperson_etp_crosshair_outline_alpha"
			)

			crosshairOutlineCheckbox.OnChange = function(_, outlineEnabled)
				crosshairOutlinePicker:SetEnabled(crosshairCheckbox:GetChecked() and outlineEnabled)
			end

			crosshairCheckbox.OnChange = function(_, crosshairEnabled)
				for _, view in ipairs(crosshairViews) do
					view:SetEnabled(crosshairEnabled)
				end
				crosshairOutlinePicker:SetEnabled(crosshairOutlineCheckbox:GetChecked() and crosshairEnabled)
			end
		end)
	end)
end