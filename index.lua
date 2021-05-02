--[[
QuickLaunch Installer - Lua Player Plus Edition v1.3

Created by DRok17
Based on QuickLaunch Intstaller by 1upus in OneLUA
]]


-- Set path
local uxpath = "ux0:/data/qlinstall/"
local urpath = "ur0:/shell/whats_new/np/"
local img = "ur0:/shell/whats_new/np/img/"

--\*init images*/
bg = Graphics.loadImage("app0:/resources/bg.jpg")
bar = Graphics.loadImage("app0:/resources/bar.png")
barlow = Graphics.loadImage("app0:/resources/bar-low.png")
resapp01 = Graphics.loadImage("ux0:/data/qlinstaller/restore/app01.png")
resapp02 = Graphics.loadImage("ux0:/data/qlinstaller/restore/app02.png")
resapp03 = Graphics.loadImage("ux0:/data/qlinstaller/restore/app03.png")
defapp01 = Graphics.loadImage("ux0:/data/qlinstaller/default/app01.png")
defapp02 = Graphics.loadImage("ux0:/data/qlinstaller/default/app02.png")
defapp03 = Graphics.loadImage("ux0:/data/qlinstaller/default/app03.png")
user1app01 = Graphics.loadImage("ux0:/data/qlinstaller/user1/app01.png")
user1app02 = Graphics.loadImage("ux0:/data/qlinstaller/user1/app02.png")
user1app03 = Graphics.loadImage("ux0:/data/qlinstaller/user1/app03.png")
user2app01 = Graphics.loadImage("ux0:/data/qlinstaller/user2/app01.png")
user2app02 = Graphics.loadImage("ux0:/data/qlinstaller/user2/app02.png")
user2app03 = Graphics.loadImage("ux0:/data/qlinstaller/user2/app03.png")
user3app01 = Graphics.loadImage("ux0:/data/qlinstaller/user3/app01.png")
user3app02 = Graphics.loadImage("ux0:/data/qlinstaller/user3/app02.png")
user3app03 = Graphics.loadImage("ux0:/data/qlinstaller/user3/app03.png")
user4app01 = Graphics.loadImage("ux0:/data/qlinstaller/user4/app01.png")
user4app02 = Graphics.loadImage("ux0:/data/qlinstaller/user4/app02.png")
user4app03 = Graphics.loadImage("ux0:/data/qlinstaller/user4/app03.png")
user5app01 = Graphics.loadImage("ux0:/data/qlinstaller/user5/app01.png")
user5app02 = Graphics.loadImage("ux0:/data/qlinstaller/user5/app02.png")
user5app03 = Graphics.loadImage("ux0:/data/qlinstaller/user5/app03.png")
user6app01 = Graphics.loadImage("ux0:/data/qlinstaller/user6/app01.png")
user6app02 = Graphics.loadImage("ux0:/data/qlinstaller/user6/app02.png")
user6app03 = Graphics.loadImage("ux0:/data/qlinstaller/user6/app03.png")

--\* Strings*/
local samples = {
	{["name"] = "            Preset QL", ["id"] = "default", ["desc1"] = defapp01, ["desc2"] = defapp02, ["desc3"] = defapp03},
	{["name"] = "            User 1 QL", ["id"] = "user1", ["desc1"] = user1app01, ["desc2"] = user1app02, ["desc3"] = user1app03},
	{["name"] = "            User 2 QL", ["id"] = "user2", ["desc1"] = user2app01, ["desc2"] = user2app02, ["desc3"] = user2app03},
	{["name"] = "            User 3 QL", ["id"] = "user3", ["desc1"] = user3app01, ["desc2"] = user3app02, ["desc3"] = user3app03},
	{["name"] = "            User 4 QL", ["id"] = "user4", ["desc1"] = user4app01, ["desc2"] = user4app02, ["desc3"] = user4app03},
	{["name"] = "            User 5 QL", ["id"] = "user5", ["desc1"] = user5app01, ["desc2"] = user5app02, ["desc3"] = user5app03},
	{["name"] = "            User 6 QL", ["id"] = "user6", ["desc1"] = user6app01, ["desc2"] = user6app02, ["desc3"] = user6app03},
	{["name"] = "Clear/Restore QL data", ["id"] = "z-reset", ["desc1"] = resapp01, ["desc2"] = resapp02, ["desc3"] = resapp03},
	{["name"] = "     Exit to LiveArea", ["id"] = "zz-exit"},
}

-- Initializing oldpad variable
oldpad = SCE_CTRL_CROSS

--\*init colors*/
local white = Color.new(255,255,255,255)
local yellow = Color.new(255,255,0,255)
local red = Color.new(255,0,0,255)
local green = Color.new(25, 200, 120)
local gray_transparent = Color.new(195, 195, 195, 80)
local black = Color.new(0,0,0)
local blue = Color.new(67,178,255)
local cyan = Color.new(0,254,202)

-- Cursor index
local idx = 1

--\*init font*/
font = Font.load("app0:/resources/font.ttf")
Font.setPixelSizes(font,23)


--\*init short button names*/
cross = SCE_CTRL_CROSS
square = SCE_CTRL_SQUARE
circle = SCE_CTRL_CIRCLE
triangle = SCE_CTRL_TRIANGLE
start = SCE_CTRL_START
select = SCE_CTRL_SELECT
rtrigger = SCE_CTRL_RTRIGGER
ltrigger = SCE_CTRL_LTRIGGER

--\*main loop*/
while true do

	--\* ui */
	--\*Starting drawing phase*/
	Graphics.initBlend()
	Screen.clear()

	--\* Display background */
	Graphics.drawImage(0, 0, bg)
	Graphics.drawImage(0, 0, bar)

	--\* Display info */
	Font.print(font, 227, 0, "QuickLaunch Installer v1.3 - Lua Player Plus Edition", cyan)
	Screen.flip()

-- Functions --
dofile("app0:/scripts/functions.lua")


-- Drawing samples selector
local y = 20
for i,sample in pairs(samples) do
	local x = 360
	local color = white
	if i == idx then
		color = yellow
		x = 360
	end
	Graphics.debugPrint(x, y + 25*i, sample.name, color)
end

-- GFX
if samples[idx].desc1 then
	Font.print(font, 17, 405, "QuickLaunch Preview", white)
	Graphics.drawImage(0, 0, barlow)
	Graphics.drawImage(40, 436, samples[idx].desc1)
end

if samples[idx].desc2 then
	Graphics.drawImage(339, 436, samples[idx].desc2)
end

if samples[idx].desc3 then
	Graphics.drawImage(641, 436, samples[idx].desc3)
end

-- Terminating drawing phase
Graphics.termBlend()
Screen.flip()

	--\* Controls*/
	pad = Controls.read()
	if Controls.check(pad, SCE_CTRL_UP) and not Controls.check(oldpad, SCE_CTRL_UP) then
		idx = idx - 1
		if idx == 0 then
			idx = #samples
		end
	elseif Controls.check(pad, SCE_CTRL_DOWN) and not Controls.check(oldpad, SCE_CTRL_DOWN) then
		idx = idx + 1
		if idx > #samples then
			idx = 1
		end
	elseif Controls.check(pad, SCE_CTRL_CROSS) and not Controls.check(oldpad, SCE_CTRL_CROSS) then
		dofile("app0:/scripts/" .. samples[idx].id .. ".lua")
	end

	--\* Controls to exit app */
        if Controls.check(pad, ltrigger) and Controls.check(pad, rtrigger) then
	    System.exit()
	end

	-- Saving old controls scheme
oldpad = pad

end
