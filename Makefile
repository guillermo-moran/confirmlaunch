include theos/makefiles/common.mk

TWEAK_NAME = ConfirmLaunch
ConfirmLaunch_FILES = Tweak.xm
ConfirmLaunch_FRAMEWORKS = UIKit
SUBPROJECTS = launchconfirmsettings

include $(THEOS_MAKE_PATH)/tweak.mk
include $(THEOS_MAKE_PATH)/aggregate.mk
