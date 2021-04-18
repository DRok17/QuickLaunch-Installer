--[[
	QuickLaunch Installer v1.1 - DRok17 Edition

	Licensed by GNU General Public License v3.0

	(c) 2021 by DRok17
	based on sources from Team OneLua
]]

game.close()
color.loadpalette()

-- Set path
local uxpath = "ux0:data/qlinstall/"
files.mkdir(uxpath)
local urpath = "ur0:shell/whats_new/np/"

-- Loading UI GFX
back = image.load("resources/back.jpg")
box = image.load("resources/box.png")
defapp01 = image.load ("resources/installer/default/app01.png")
defapp02 = image.load ("resources/installer/default/app02.png")
defapp03 = image.load ("resources/installer/default/app03.png")
user1app01 = image.load ("resources/installer/user1/app01.png")
user1app02 = image.load ("resources/installer/user1/app02.png")
user1app03 = image.load ("resources/installer/user1/app03.png")
user2app01 = image.load ("resources/installer/user2/app01.png")
user2app02 = image.load ("resources/installer/user2/app02.png")
user2app03 = image.load ("resources/installer/user2/app03.png")
user3app01 = image.load ("resources/installer/user3/app01.png")
user3app02 = image.load ("resources/installer/user3/app02.png")
user3app03 = image.load ("resources/installer/user3/app03.png")
user4app01 = image.load ("resources/installer/user4/app01.png")
user4app02 = image.load ("resources/installer/user4/app02.png")
user4app03 = image.load ("resources/installer/user4/app03.png")
user5app01 = image.load ("resources/installer/user5/app01.png")
user5app02 = image.load ("resources/installer/user5/app02.png")
user5app03 = image.load ("resources/installer/user5/app03.png")
user6app01 = image.load ("resources/installer/user6/app01.png")
user6app02 = image.load ("resources/installer/user6/app02.png")
user6app03 = image.load ("resources/installer/user6/app03.png")

-- Loading Special chars
SYMBOL_CROSS	= string.char(0xe2)..string.char(0x95)..string.char(0xb3)
SYMBOL_SQUARE	= string.char(0xe2)..string.char(0x96)..string.char(0xa1)
SYMBOL_TRIANGLE	= string.char(0xe2)..string.char(0x96)..string.char(0xb3)
SYMBOL_CIRCLE	= string.char(0xe2)..string.char(0x97)..string.char(0x8b)

-- Loading language file
-- reading system language
__LANG = os.language()
-- reading lang strings from ux0:data/qlinstall/ if exist
if files.exists(uxpath.."lang/"..__LANG..".txt") then dofile(uxpath.."lang/"..__LANG..".txt")
else
-- reading lang strings fom app folder if exist
	if files.exists("resources/lang/"..__LANG..".txt") then dofile("resources/lang/"..__LANG..".txt")
	local cont = 0
	for key,value in pairs(strings) do cont += 1 end
	if cont < 23 then files.copy("resources/lang/english_us.txt",uxpath.."lang/") dofile("resources/lang/english_us.txt") end
-- reading default lang strings if no one translations founded
else files.copy("resources/lang/english_us.txt",uxpath.."lang/") dofile("resources/lang/english_us.txt") end
end

-- Loading custom ttf font if exits
if files.exists(uxpath.."/resources/"..__LANG..".ttf") then font.setdefault(uxpath.."/resources/"..__LANG..".ttf")
else
 if files.exists("resources/"..__LANG..".ttf") then font.setdefault("resources/"..__LANG..".ttf")
 end
end

if os.access() == 0 then
	if back2 then back2:blit(0,0) end
	screen.flip()
	custom.message(strings.unsafe,0)
	os.exit()
end

------------------------------------------Main--------------------------------------------------------------
-- Copy sample data to ux0:data/mmminstal
 if not files.exists(uxpath.."app01.png") then files.copy("resources/installer/app01.png",uxpath) end
 if not files.exists(uxpath.."app02.png") then files.copy("resources/installer/app02.png",uxpath) end
 if not files.exists(uxpath.."app03.png") then files.copy("resources/installer/app03.png",uxpath) end
 if not files.exists(uxpath.."whatsnew.xml") then files.copy("resources/installer/whatsnew.xml",uxpath) end

dofile("system/commons.lua")

options = { strings.menuline01, strings.menuline02, strings.menuline03, strings.menuline04, strings.menuline05, strings.menuline06, strings.menuline07, strings.menuline08, strings.menuline09}
sel = 1

buttons.interval(10,12)
while true do
	buttons.read()

	if back then back:blit(0,0) end
	draw.fillrect(0,0,960,30, 0x64545353) --UP
	screen.print(10,10,strings.caption,1,color.white,color.blue,__ALEFT)
	screen.print(641,10,os.date("%r  %d/%m/%y"),1,color.white,color.blue,__ALEFT)


	local y = 45
	for i=1,#options do
		if i == sel then
			draw.fillrect(40,y-2,360,21, color.blue:a(150))
			draw.rect(40,y-2,360,21, color.green:a(100))
		end
		screen.print(49,y,options[i],1.0,color.white,color.gray,__ALEFT)
		y += 25
	end

	--Controls
	if buttons.up then sel-=1 end
	if buttons.down then sel+=1 end

	if sel > #options then sel=1 end
	if sel < 1 then sel=#options end
    if sel == 1 then modprev00() end
    if sel == 2 then modprev01() end
    if sel == 3 then modprev02() end
    if sel == 4 then modprev03() end
    if sel == 5 then modprev04() end
    if sel == 6 then modprev05() end
    if sel == 7 then modprev06() end
	if buttons.cross then
		if sel == 1 then modinstall00()
		elseif sel == 2 then modinstall01()
		  elseif sel == 3 then modinstall02()
		    elseif sel == 4 then modinstall03()
		      elseif sel == 5 then modinstall04()
		        elseif sel == 6 then modinstall05()
		          elseif sel == 7 then modinstall06()
			          elseif sel == 8 then modreset()
				          elseif sel == 9 then os.exit() buttons.homepopup(1)
		end
	end

	screen.flip()

end
