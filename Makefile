export THEOS_DEVICE_IP=192.168.1.11
export ARCHS := armv7 arm64
export TARGET := iphone:clang::7.0

export SDKVERSION = 7.0

include theos/makefiles/common.mk

TWEAK_NAME = BetterFolders
BetterFolders_FILES = Tweak.xm
BetterFolders_FRAMEWORKS = UIKit

include $(THEOS_MAKE_PATH)/tweak.mk

after-install::
	install.exec "killall -9 SpringBoard"
