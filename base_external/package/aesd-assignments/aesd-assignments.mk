
##############################################################
#
# AESD-ASSIGNMENTS
#
##############################################################

# reference assignment 3
AESD_ASSIGNMENTS_VERSION = 73de302e1b36ec34d7f8753861cf0f583fdd1452
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
endef


$(eval $(generic-package))
