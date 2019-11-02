
##############################################################
#
# AESD-ASSIGNMENTS
#
##############################################################

# reference assignment 3
AESD_ASSIGNMENTS_VERSION = 93f45cb3a53bcdbaa94521a01e715bb5af592c3e
AESD_ASSIGNMENTS_SITE = git@github.com:cu-ecen-5013/aesd-assignments-3-and-later-sast7580.git
AESD_ASSIGNMENTS_SITE_METHOD = git


define AESD_ASSIGNMENTS_BUILD_CMDS
	$(MAKE) $(TARGET_CONFIGURE_OPTS) -C $(@D) all
endef

# required executables or scripts
define AESD_ASSIGNMENTS_INSTALL_TARGET_CMDS
	$(INSTALL) -m 0755 $(@D)/writer $(TARGET_DIR)/bin
	$(INSTALL) -m 0755 $(@D)/tester.sh $(TARGET_DIR)/bin
	$(INSTALL) -m 0755 $(@D)/finder.sh $(TARGET_DIR)/bin
	$(INSTALL) -m 0755 $(@D)/aesdsocket $(TARGET_DIR)/usr/bin
	$(INSTALL) -m 0755 $(@D)/aesdsocket-start-stop.sh $(TARGET_DIR)/etc/init.d/S99aesdsocket
	$(INSTALL) -m 0755 $(@D)/aesd-char-driver/initScript $(TARGET_DIR)/etc/init.d
endef


$(eval $(generic-package))
