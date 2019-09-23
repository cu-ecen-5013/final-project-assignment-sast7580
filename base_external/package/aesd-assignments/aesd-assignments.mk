
##############################################################
#
# AESD-ASSIGNMENTS
#
##############################################################

# reference assignment 3
AESD_ASSIGNMENTS_VERSION = 'b197f60552e1e660d703b518737729c61b896968'
AESD_ASSIGNMENTS_SITE = 'https://github.com/cu-ecen-5013/aesd-assignments-3-and-later-sast7580.git'
AESD_ASSIGNMENTS_SITE_METHOD = git


define AESD_ASSIGNMENTS_BUILD_CMDS
	$(MAKE) $(TARGET_CONFIGURE_OPTS) -C $(@D) all
endef

#TODO: Add required executables or scripts below
define AESD_ASSIGNMENTS_INSTALL_TARGET_CMDS
	$(INSTALL) -m 0755 $(@D)/writer $(TARGET_DIR)/bin
endef


$(eval $(generic-package))
