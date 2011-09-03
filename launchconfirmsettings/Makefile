SDKVERSION=4.0
include theos/makefiles/common.mk

BUNDLE_NAME = LaunchConfirmSettings
LaunchConfirmSettings_FILES = LaunchConfirmSettings.mm
LaunchConfirmSettings_INSTALL_PATH = /Library/PreferenceBundles
LaunchConfirmSettings_FRAMEWORKS = UIKit
LaunchConfirmSettings_PRIVATE_FRAMEWORKS = Preferences
GO_EASY_ON_ME = 1
LaunchConfirm_LDFLAGS = -AppList


include $(THEOS_MAKE_PATH)/bundle.mk

internal-stage::
	$(ECHO_NOTHING)mkdir -p $(THEOS_STAGING_DIR)/Library/PreferenceLoader/Preferences$(ECHO_END)
	$(ECHO_NOTHING)cp entry.plist $(THEOS_STAGING_DIR)/Library/PreferenceLoader/Preferences/LaunchConfirmSettings.plist$(ECHO_END)
