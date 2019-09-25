
##############################################################
#
# AESD-ASSIGNMENTS
#
##############################################################

# reference assignment 3
AESD_ASSIGNMENTS_VERSION = 015e29c3c886fb62919b00052aa5353abc6773d1
AESD_ASSIGNMENTS_SITE = https://github.com/cu-ecen-5013/buildroot-assignments-sast7580.git
AESD_ASSIGNMENTS_SITE_METHOD = git


define AESD_ASSIGNMENTS_BUILD_CMDS
	$(MAKE) $(TARGET_CONFIGURE_OPTS) -C $(@D) all
endef

# required executables or scripts
define AESD_ASSIGNMENTS_INSTALL_TARGET_CMDS
	$(INSTALL) -m 0755 $(@D)/writer $(TARGET_DIR)/bin
	$(INSTALL) -m 0755 $(@D)/tester.sh $(TARGET_DIR)/bin
	$(INSTALL) -m 0755 $(@D)/finder.sh $(TARGET_DIR)/bin
endef


$(eval $(generic-package))
