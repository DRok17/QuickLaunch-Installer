# QuickLaunch-Installer

QuickLaunch Installer is now made in Lua Player Plus.

Originally created by 1upus, QuickLaunch Installer allows you to customize the quick menu shortcuts.
v1.4 has 6 User customizable slots and 1 preset slot.

![1](https://user-images.githubusercontent.com/81541725/136826031-204ffa20-25e3-4d58-9fda-ff325d17112b.png)

![2](https://user-images.githubusercontent.com/81541725/136826065-78d1ac20-3289-4e50-83ce-f01bb2015e7f.png)


## Customization

Customization can now be done within the application. Simply press Square to edit the selections.

Further customization can be done on a Windows PC. Old batch method is still available.

## Instructions

Install the VPK and data files and select from the pre-made selections, which include the following:

- Vita Launcher
- Adrenaline
- Easy VPK
- Vita Grafix
- RetroArch
- DaldaelusX64
- and more...

Selections will be written, and Vita will need to restart.

![image](https://user-images.githubusercontent.com/81541725/115171135-64189700-a090-11eb-8d6a-86f1b2db05ba.png)

## Edit Menu Customization

Customization can now be done within the Edit Menu. Simply press Square to view the available selections. Any custom images should be placed in ux0:/data/qlinstaller and labelled using the Title ID.

Edit Menu first scans the ux0:/data/qlinstaller/zimg folder for a PNG with the same Title ID. If not found, it will then scan to see if it's a HomeBrew or PS Vita game/application. If Homebrew game/app, Startup.png will be used. If PS Vita game, custom-0X.png file will be used.

There are 3 customizable PNG options to choose from. Press Triangle to sort cycle through them. Images can be replaced with User created ones if needed.

![3](https://user-images.githubusercontent.com/81541725/136826111-9bd42ec0-071e-414f-86d1-4fa0c079d494.png)

## USB/Batch Customization (Old Method)

If customization is needed, plug Vita into PC via USB.
You will need to access to ux0:data/qlinstaller/
Select any of the User Folders listed.

## PNG Switch and QuickLauncher ID (Old Method)

This batch application will allow easy editting of the file "whatsnew.xml" and swapping PNGs without having to manually rename them.
PNG Switch

Simply delete the PNG app# you want to replace and run the "z-png-switch.bat" file. New PNG will be renamed accordingly.

![image](https://user-images.githubusercontent.com/81541725/115171193-87dbdd00-a090-11eb-9d72-8612c6dfdeb6.png)

![image](https://user-images.githubusercontent.com/81541725/115171204-8ca09100-a090-11eb-837a-675fc01bf91f.png)


## QuickLauncher ID (Old Method)

Open the z-Replace-ID.bat to access this menu:

![image](https://user-images.githubusercontent.com/81541725/115171223-96c28f80-a090-11eb-9741-8092b98e0479.png)

Enter 9 digit Title ID and select which number it belongs to.

## More Options

If you would like to customize the User slots, please find the files in the zIMG folder under:
ux0:data/qlinstaller/


## Images

All PNGs need to be 282 x 108. If you would like to title it, I've placed a Pixlr X file in the data folder for easy customization.

![image](https://user-images.githubusercontent.com/81541725/136827300-af2de626-f748-4e1f-9209-84fe0194583f.png)

![image](https://user-images.githubusercontent.com/81541725/115172492-65978e80-a093-11eb-8f38-e2b296aca997.png)

## KNOWN ISSUES

- Crashes can occur in the Edit Menu. In some cases, it's best to re-install/extract the data files if the Edit Menu does not open.
- Images on Main Menu are stretched but are not in Edit Menu; this is normal and is due to a limitation with LPP-Vita.

## Special Thanks

Thanks to https://nodeadfolk.wordpress.com/2014/04/10/free-ps-vita-buttons-more-work/ for providing the PS Vita buttons used.



