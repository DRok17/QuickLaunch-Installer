--- User Apps

-- Colours
local white = Color.new(255, 255, 255)
local yellow = Color.new(255, 255, 0)
local red = Color.new(255, 0, 0)
local cyan = Color.new(0,254,202)
local oldpad = SCE_CTRL_CROSS

-- Font
font = Font.load("app0:/resources/font.ttf")
Font.setPixelSizes(font,23)

-- List App Folder
local appfold = System.listDirectory("ux0:/app/")

-- Load Paths and Shortcuts
local appposx = "413" -- 115, 413, 716
local xmlpos = "483" -- 197, 483, 769
local qlapp = "app02" -- app01, app02, app03
local next = "app03" -- app01, app02, app03
local cursys = "sys-2.txt"
local curreadout = "z-2.txt"
local user0 = "user3/"
local replaceid = "ux0:/data/qlinstaller/" ..user0.. "replace-id/"
local user = "ux0:/data/qlinstaller/" ..user0.. ""
local app = "ux0:/app/"
local zimg = "ux0:/data/qlinstaller/zimg/"
local livearea = "/sce_sys/livearea/contents/"
local PSN = "/sce_pfs/"
local qqlapp = "v1.4"


-- Load Text Files
local app01displayin = System.openFile(replaceid.."z-1.txt", FREAD)
local app01displayout = System.readFile(app01displayin, 9)
local app02displayin = System.openFile(replaceid.."z-2.txt", FREAD)
local app02displayout = System.readFile(app02displayin, 9)
local app03displayin = System.openFile(replaceid.."z-3.txt", FREAD)
local app03displayout = System.readFile(app03displayin, 9)

-- Load Images
barlow = Graphics.loadImage("app0:/resources/bar-low.png")
edit = Graphics.loadImage("app0:/resources/editmenu.png")
Graphics.freeImage(user1app02)
user1app01 = Graphics.loadImage(user.."app01.png")
user1app02 = Graphics.loadImage(user.."app02.png")
user1app03 = Graphics.loadImage(user.."app03.png")


-- Index
local i = 1

-- Main loop
while true do

	-- Reset y axis for menu blending
	local y = 225

	-- Write title on screen
	Graphics.initBlend()
	Screen.clear()
	Graphics.drawImage(0, 0, bg)
	Graphics.drawImage(0, 0, bar)
	Graphics.drawImage(0, 0, edit)
	Font.print(font, 350, 0, "QuickLaunch Installer " ..ver.. "", cyan) --227
	Graphics.debugPrint(115, 410, "" ..app01displayout, cyan)
	Graphics.debugPrint(413, 410, "" ..app02displayout, cyan)
	Graphics.debugPrint(716, 410, "" ..app03displayout, cyan)


	-- Write visible menu entries
	for j, file in pairs(appfold) do
		x = appposx -- 115, 413, 716
		if j >= i and y < 400 then
			if i == j then
				color = yellow
				x = appposx
				info = System.extractSfo(app.."" ..appfold[i].name.. "/sce_sys/param.sfo")
			else
				color = white
			end
			-- Font.print(font, 45, 45, info.title, color)
			Graphics.debugPrint(115, 60, "Title: " ..info.title, white)
			Graphics.debugPrint(x, y, file.name, color)
			y = y + 30
		end
	end
	Graphics.drawImage(0, 0, barlow)

	if System.doesFileExist(replaceid.."sys-1.txt") then
		Graphics.drawScaleImage(40, 436, user1app01, 1, 0.7)
	end
  if not System.doesFileExist(replaceid.."sys-1.txt") then
		Graphics.drawImage(40, 436, user1app01)
	end
	if System.doesFileExist(replaceid.."sys-2.txt") then
		Graphics.drawScaleImage(339, 436, user1app02, 1, 0.7)
	end
  if not System.doesFileExist(replaceid.."sys-2.txt") then
		Graphics.drawImage(339, 436, user1app02)
	end
	if System.doesFileExist(replaceid.."sys-3.txt") then
		Graphics.drawScaleImage(641, 436, user1app03, 1, 0.7)
	end
  if not System.doesFileExist(replaceid.."sys-3.txt") then
		Graphics.drawImage(641, 436, user1app03)
	end

	Graphics.termBlend()

	-- Check for input
	pad = Controls.read()
	if Controls.check(pad, SCE_CTRL_CROSS) and not Controls.check(oldpad, SCE_CTRL_CROSS) then
		if appfold[i].directory then
			System.wait(250000)
			System.deleteFile(replaceid.."1.txt")
			System.deleteFile(replaceid.."2.txt")
			System.deleteFile(replaceid.."3.txt")
			System.deleteFile(replaceid.."" ..curreadout.. "")
			local xml = System.openFile(user.."whatsnew.xml", FRDWR)
			System.seekFile(xml, xmlpos, CUR) -- 197, 483, 769
			System.writeFile(xml, "psgm:play?titleid=" ..appfold[i].name.. "", 27)
			local app01display = System.openFile(replaceid.."" ..curreadout.. "", FCREATE)
			System.writeFile(app01display, ""..appfold[i].name, 9)
			System.closeFile(app01display)
			if System.doesFileExist(zimg.."" ..appfold[i].name.. ".png") then
				System.copyFile(zimg.."" ..appfold[i].name.. ".png", zimg.."" ..appfold[i].name.. "1.png")
				System.deleteFile(user.."" ..qlapp.. ".png")
				System.rename(zimg.."" ..appfold[i].name.. "1.png", user.."" ..qlapp.. ".png")
				System.deleteFile(replaceid.."" ..cursys.. "")
			end
			if not System.doesFileExist(zimg.."" ..appfold[i].name.. ".png") then
				if System.doesFileExist(app.."" ..appfold[i].name.. "" ..PSN.."files.db") then
					local one = System.openFile(replaceid.."1.txt", FCREATE)
					System.writeFile(one, "TEST", 4)
					System.deleteFile(replaceid.."3.txt")
					System.copyFile(zimg.."custom-01.png", zimg.."custom-011.png")
					System.deleteFile(replaceid.."" ..cursys.. "")
				end
				if not System.doesFileExist(app.."" ..appfold[i].name.. "" ..PSN.."files.db") then
				 if System.doesFileExist(app.."" ..appfold[i].name.. "" ..livearea.."startup.png") then
					 local sys = System.openFile(replaceid.."" ..cursys.. "", FCREATE)
					 System.writeFile(sys, "Don't delete me...ok?", 21)
					 System.copyFile(app.."" ..appfold[i].name.. "" ..livearea.."startup.png", zimg.."custom-011.png")
				 end
				 if not System.doesFileExist(app.."" ..appfold[i].name.. "" ..livearea.."startup.png") then
					 if System.doesFileExist(app.."" ..appfold[i].name.. "" ..livearea.."default_gate.png") then
						 local sys = System.openFile(replaceid.."" ..cursys.. "", FCREATE)
						 System.writeFile(sys, "Don't delete me...ok?", 21)
						 System.copyFile(app.."" ..appfold[i].name.. "" ..livearea.."default_gate.png", zimg.."custom-011.png")
					 end
					 if not System.doesFileExist(app.."" ..appfold[i].name.. "" ..livearea.."default_gate.png") then
						 System.copyFile(zimg.."custom-01.png", zimg.."custom-011.png")
						 System.deleteFile(replaceid.."" ..cursys.. "")
					 end
			 end
			end
				System.deleteFile(user.."" ..qlapp.. ".png")
				System.rename(zimg.."custom-011.png", user.."" ..qlapp.. ".png")
			end
			Graphics.freeImage(user1app02)
			user1app02 = Graphics.loadImage(user.."" ..qlapp.. ".png")
			local white = Color.new(255, 0, 0)
		end
	elseif Controls.check(pad, SCE_CTRL_SQUARE) and not Controls.check(oldpad, SCE_CTRL_SQUARE) then
		System.wait(250000)
		dofile("app0:/scripts/" ..user0.."" ..next.. ".lua")
	elseif Controls.check(pad, SCE_CTRL_RTRIGGER) and not Controls.check(oldpad, SCE_CTRL_RTRIGGER) then
		System.wait(250000)
		dofile("app0:/scripts/" ..user0.."" ..qlapp.. ".lua")
	elseif Controls.check(pad, SCE_CTRL_TRIANGLE) and not Controls.check(oldpad, SCE_CTRL_TRIANGLE) then
		if not System.doesFileExist(replaceid.."" ..cursys.. "") then
			System.wait(250000)
			local sys = System.openFile(replaceid.."" ..cursys.. "", FCREATE)
			System.writeFile(sys, "Don't delete me...ok?", 21)
		end
		if System.doesFileExist(replaceid.."2.txt") then
			System.wait(250000)
			local three = System.openFile(replaceid.."3.txt", FCREATE)
			System.writeFile(three, "TEST", 4)
			System.copyFile(zimg.."custom-03.png", zimg.."custom-011.png")
			System.deleteFile(user.."" ..qlapp.. ".png")
			System.rename(zimg.."custom-011.png", user.."" ..qlapp.. ".png")
			System.deleteFile(replaceid.."2.txt")
			System.deleteFile(replaceid.."" ..cursys.. "")
			Graphics.freeImage(user1app02)
			user1app02 = Graphics.loadImage(user.."" ..qlapp.. ".png")
		end
		if System.doesFileExist(replaceid.."1.txt") then
			System.wait(250000)
			local two = System.openFile(replaceid.."2.txt", FCREATE)
			System.writeFile(two, "TEST", 4)
			System.copyFile(zimg.."custom-02.png", zimg.."custom-011.png")
			System.deleteFile(user.."" ..qlapp.. ".png")
			System.rename(zimg.."custom-011.png", user.."" ..qlapp.. ".png")
			System.deleteFile(replaceid.."1.txt")
			System.deleteFile(replaceid.."" ..cursys.. "")
			Graphics.freeImage(user1app02)
			user1app02 = Graphics.loadImage(user.."" ..qlapp.. ".png")
		end
		if System.doesFileExist(replaceid.."" ..cursys.. "") then
			System.wait(250000)
			local one = System.openFile(replaceid.."1.txt", FCREATE)
			System.writeFile(one, "TEST", 4)
			System.copyFile(zimg.."custom-01.png", zimg.."custom-011.png")
			System.deleteFile(user.."" ..qlapp.. ".png")
			System.rename(zimg.."custom-011.png", user.."" ..qlapp.. ".png")
			System.deleteFile(replaceid.."" ..cursys.. "")
			System.deleteFile(replaceid.."3.txt")
			Graphics.freeImage(user1app02)
			user1app02 = Graphics.loadImage(user.."" ..qlapp.. ".png")
		end
	elseif Controls.check(pad, SCE_CTRL_UP) and not Controls.check(oldpad, SCE_CTRL_UP) then
		i = i - 1
	elseif Controls.check(pad, SCE_CTRL_DOWN) and not Controls.check(oldpad, SCE_CTRL_DOWN) then
		i = i + 1
	elseif Controls.check(pad, SCE_CTRL_RIGHT) and not Controls.check(oldpad, SCE_CTRL_RIGHT) then
		i = i + 10
	elseif Controls.check(pad, SCE_CTRL_LEFT) and not Controls.check(oldpad, SCE_CTRL_LEFT) then
		i = i - 10
	elseif Controls.check(pad, SCE_CTRL_CIRCLE) then
		System.wait(250000)
		dofile("app0:/index.lua")
	end

	-- Check for out of bounds in menu
	if i > #appfold then
		i = 1
	elseif i < 1 then
		i = #appfold
	end
	-- Custom Button Assignment
        if Controls.check(pad, select) then
	    System.launchApp("VITASHELL")
	end
	-- Update oldpad and flip screen
	oldpad = pad
	Screen.flip()

end
