-- Constants

APP_REPO = "theheroGAC"
APP_PROJECT = "QuickLaunch_installer_fork_for_PSVita"			--here name of repo in github...your vpk is QuickLaunch_installer_for_PSVita.vpk

APP_VERSION_MAJOR = 0x00 -- major.minor
APP_VERSION_MINOR = 0x04

APP_VERSION = ((APP_VERSION_MAJOR << 0x18) | (APP_VERSION_MINOR << 0x10)) -- Union Binary
