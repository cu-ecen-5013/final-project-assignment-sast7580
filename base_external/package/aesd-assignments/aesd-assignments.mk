##############################################################
#
# AESD-ASSIGNMENTS
#
##############################################################

#TODO: Fill up the contents below in order to reference your assignment 3 git contents
AESD_ASSIGNMENTS_VERSION = 75f122d61f2cd3a7c9d4f85462807f0f34bc23b3
AESD_ASSIGNMENTS_SITE = git@github.com:cu-ecen-5013/final-project-assignment-MacRush7.git
AESD_ASSIGNMENTS_SITE_METHOD= git
AESD_ASSIGNMENTS_LDFLAGS = $(LDFLAGS_FOR_BUILD) -lwiringPi -lwiringPiDev -lpthread -ldialog -ltinfo -lncurses -lm -lcrypt -lrt
AESD_ASSIGNMENTS_MODULE_SUBDIRS = aesd-char-driver/

define AESD_ASSIGNMENTS_BUILD_CMDS
	$(MAKE) $(TARGET_CONFIGURE_OPTS) -C $(@D) LDFLAGS="$(AESD_ASSIGNMENTS_LDFLAGS)" all
endef

#TODO: Add required executables or scripts below
define AESD_ASSIGNMENTS_INSTALL_TARGET_CMDS
	$(INSTALL) -m 0755 $(@D)/buzzer-init.sh $(TARGET_DIR)/etc/init.d/S99buzzer
	$(INSTALL) -m 0755 $(@D)/fingerprintModule $(TARGET_DIR)/bin
	$(INSTALL) -m 0755 $(@D)/buzzerModule $(TARGET_DIR)/usr/bin

endef

$(eval $(kernel-module))
$(eval $(generic-package))
