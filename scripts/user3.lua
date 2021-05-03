local white = Color.new(255,255,255)

-- Load an image
local image = Graphics.loadImage("app0:/resources/sysmsg.png")

-- Main loop
while true do

	-- Shows System Message menu)
	Graphics.initBlend()
	Graphics.drawImage(0, 0, image)
	Graphics.termBlend()

	-- Check for input
	if Controls.check(Controls.read(), SCE_CTRL_TRIANGLE) then
		modinstall03()
		break
	elseif Controls.check(Controls.read(), SCE_CTRL_CIRCLE) then
		Graphics.freeImage(image)
		break
	end

	-- Flip screen
	Screen.flip()

end
