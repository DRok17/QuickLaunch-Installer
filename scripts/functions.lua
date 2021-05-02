-- Functions --

-- Set path
local urpath = "ur0:/shell/whats_new/np/"
local img = "ur0:/shell/whats_new/np/img/"
local img2 = "ur0:/shell/whats_new/np/img2/"

-- Install default QL data function
function modinstall00()
  System.deleteFile(img.."app01.png")
  System.deleteFile(img.."app02.png")
  System.deleteFile(img.."app03.png")
  System.createDirectory(img)
  System.deleteFile(urpath.."whatsnew.xml")
  System.copyFile("ux0:/data/qlinstaller/default/app01.png", img.."app01.png")
  System.copyFile("ux0:/data/qlinstaller/default/app02.png", img.."app02.png")
  System.copyFile("ux0:/data/qlinstaller/default/app03.png", img.."app03.png")
  System.copyFile("ux0:/data/qlinstaller/default/whatsnew.xml", urpath.."whatsnew.xml")
  System.wait(500000)
  System.reboot()
  end

-- Install user1 QL data function
function modinstall01()
  System.deleteFile(img.."app01.png")
  System.deleteFile(img.."app02.png")
  System.deleteFile(img.."app03.png")
  System.createDirectory(img)
  System.deleteFile(urpath.."whatsnew.xml")
  System.copyFile("ux0:/data/qlinstaller/user1/app01.png", img.."app01.png")
  System.copyFile("ux0:/data/qlinstaller/user1/app02.png", img.."app02.png")
  System.copyFile("ux0:/data/qlinstaller/user1/app03.png", img.."app03.png")
  System.copyFile("ux0:/data/qlinstaller/user1/whatsnew.xml", urpath.."whatsnew.xml")
  System.wait(500000)
  System.reboot()
  end

-- Install user2 QL data function
function modinstall02()
  System.deleteFile(img.."app01.png")
  System.deleteFile(img.."app02.png")
  System.deleteFile(img.."app03.png")
  System.createDirectory(img)
  System.deleteFile(urpath.."whatsnew.xml")
  System.copyFile("ux0:/data/qlinstaller/user2/app01.png", img.."app01.png")
  System.copyFile("ux0:/data/qlinstaller/user2/app02.png", img.."app02.png")
  System.copyFile("ux0:/data/qlinstaller/user2/app03.png", img.."app03.png")
  System.copyFile("ux0:/data/qlinstaller/user2/whatsnew.xml", urpath.."whatsnew.xml")
  System.wait(500000)
  System.reboot()
  end

-- Install user3 QL data function
function modinstall03()
  System.deleteFile(img.."app01.png")
  System.deleteFile(img.."app02.png")
  System.deleteFile(img.."app03.png")
  System.createDirectory(img)
  System.deleteFile(urpath.."whatsnew.xml")
  System.copyFile("ux0:/data/qlinstaller/user3/app01.png", img.."app01.png")
  System.copyFile("ux0:/data/qlinstaller/user3/app02.png", img.."app02.png")
  System.copyFile("ux0:/data/qlinstaller/user3/app03.png", img.."app03.png")
  System.copyFile("ux0:/data/qlinstaller/user3/whatsnew.xml", urpath.."whatsnew.xml")
  System.wait(500000)
  System.reboot()
  end

-- Install user4 QL data function
function modinstall04()
  System.deleteFile(img.."app01.png")
  System.deleteFile(img.."app02.png")
  System.deleteFile(img.."app03.png")
  System.createDirectory(img)
  System.deleteFile(urpath.."whatsnew.xml")
  System.copyFile("ux0:/data/qlinstaller/user4/app01.png", img.."app01.png")
  System.copyFile("ux0:/data/qlinstaller/user4/app02.png", img.."app02.png")
  System.copyFile("ux0:/data/qlinstaller/user4/app03.png", img.."app03.png")
  System.copyFile("ux0:/data/qlinstaller/user4/whatsnew.xml", urpath.."whatsnew.xml")
  System.wait(500000)
  System.reboot()
  end

-- Install user5 QL data function
function modinstall05()
  System.deleteFile(img.."app01.png")
  System.deleteFile(img.."app02.png")
  System.deleteFile(img.."app03.png")
  System.createDirectory(img)
  System.deleteFile(urpath.."whatsnew.xml")
  System.copyFile("ux0:/data/qlinstaller/user5/app01.png", img.."app01.png")
  System.copyFile("ux0:/data/qlinstaller/user5/app02.png", img.."app02.png")
  System.copyFile("ux0:/data/qlinstaller/user5/app03.png", img.."app03.png")
  System.copyFile("ux0:/data/qlinstaller/user5/whatsnew.xml", urpath.."whatsnew.xml")
  System.wait(500000)
  System.reboot()
  end

-- Install user6 QL data function
function modinstall06()
  System.deleteFile(img.."app01.png")
  System.deleteFile(img.."app02.png")
  System.deleteFile(img.."app03.png")
  System.createDirectory(img)
  System.deleteFile(urpath.."whatsnew.xml")
  System.copyFile("ux0:/data/qlinstaller/user6/app01.png", img.."app01.png")
  System.copyFile("ux0:/data/qlinstaller/user6/app02.png", img.."app02.png")
  System.copyFile("ux0:/data/qlinstaller/user6/app03.png", img.."app03.png")
  System.copyFile("ux0:/data/qlinstaller/user6/whatsnew.xml", urpath.."whatsnew.xml")
  System.wait(500000)
  System.reboot()
  end

-- Reset mod data function
function modreset()
 System.deleteFile(img.."app01.png")
 System.deleteFile(img.."app02.png")
 System.deleteFile(img.."app03.png")
 System.deleteFile(urpath.."whatsnew.xml")
 System.wait(500000)
 System.reboot()
end

-- Exit function
function modexit()
 System.wait(500000)
 System.exit()
end
