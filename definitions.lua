---@meta

--- Types for language server compatibility

--- @class Player
--- @field CustomViewAngles Angle Camera view angles when thirdperson is on
--- @field CustomMoveAngles Angle Movement direction when thirdperson is on

--- @class Weapon
--- @field CalculateConeRecoil? fun(): number Some weapon bases calculate cone recoil, I don't quite remember which

---@class DCheckBoxLabel
DCheckBoxLabel = { }
---![(Client and menu)](https://github.com/user-attachments/assets/25d1a1c8-4288-4a51-9867-5e3bb51b9981) Called when the "checked" state is changed. This is meant to be Overriden
---
---[View wiki]https://wiki.facepunch.com/gmod/DCheckBoxLabel:OnChange()
---@param bVal any
function DCheckBoxLabel:OnChange(bVal) end

---@class DForm
DForm = { }
---![(Client and menu)](https://github.com/user-attachments/assets/25d1a1c8-4288-4a51-9867-5e3bb51b9981) Adds a [DCheckBoxLabel](https://wiki.facepunch.com/gmod/DCheckBoxLabel) onto the [DForm](https://wiki.facepunch.com/gmod/DForm).
--- **NOTE**: This will run [DCheckBoxLabel:OnChange](https://wiki.facepunch.com/gmod/DCheckBoxLabel:OnChange) when being added. This is caused by [Panel:SetConVar](https://wiki.facepunch.com/gmod/Panel:SetConVar) being used when this function is used. To avoid this, use [DForm:AddItem](https://wiki.facepunch.com/gmod/DForm:AddItem) with a [DCheckBoxLabel](https://wiki.facepunch.com/gmod/DCheckBoxLabel).
---
---[View wiki](https://wiki.facepunch.com/gmod/DForm:CheckBox)
---@param label string The label to be set next to the check box
---@param convar string The console variable to change when this is changed
---@return DCheckBoxLabel # The created DCheckBoxLabel
function DForm:CheckBox(label, convar) end

---![(Client and menu)](https://github.com/user-attachments/assets/25d1a1c8-4288-4a51-9867-5e3bb51b9981) Adds a [DComboBox](https://wiki.facepunch.com/gmod/DComboBox) onto the [DForm](https://wiki.facepunch.com/gmod/DForm)
---
---[View wiki](https://wiki.facepunch.com/gmod/DForm:ComboBox)
---@param title string Text to the left of the combo box
---@param convar string Console variable to change when the user selects something from the dropdown.
---@return DComboBox # The created DComboBox
---@return DLabel # The created DLabel
function DForm:ComboBox(title, convar) end

surface = {}

---![(Client and menu)](https://github.com/user-attachments/assets/25d1a1c8-4288-4a51-9867-5e3bb51b9981) Draws a hollow circle, made of lines. For a filled circle, see examples for [surface.DrawPoly](https://wiki.facepunch.com/gmod/surface.DrawPoly).
---
---[View wiki](https://wiki.facepunch.com/gmod/surface.DrawCircle)
---@param originX number The center x integer coordinate.
---@param originY number The center y integer coordinate.
---@param radius number The radius of the circle.
---@param color Color A Color object/table to read the color from.
function surface.DrawCircle(originX, originY, radius, color) end

---@class ControlPanel
ControlPanel = {}

---![(Client)](https://github.com/user-attachments/assets/a5f6ba64-374d-42f0-b2f4-50e5c964e808) Creates a [ControlPresets](https://wiki.facepunch.com/gmod/ControlPresets) panel and adds it as an [item](https://wiki.facepunch.com/gmod/ControlPanel:AddPanel).
---
---[View wiki](https://wiki.facepunch.com/gmod/ControlPanel:ToolPresets)
---@param group string The presets group. Must be unique.
---@param cvarList table A table of convar names as keys and their defaults as the values. Typically the output of Tool:BuildConVarList.
---@return ControlPresets # The created ControlPresets panel.
function ControlPanel:ToolPresets(group, cvarList) end