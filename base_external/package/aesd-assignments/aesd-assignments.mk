
##############################################################
#
# AESD-ASSIGNMENTS
#
##############################################################

# reference assignment 3
AESD_ASSIGNMENTS_VERSION = 6fdd10b0249e831f3655c93aca8206df3c09c44d
AESD_ASSIGNMENTS_SITE = git@github.com:cu-ecen-5013/aesd-assignments-3-and-later-sast7580.git
AESD_ASSIGNMENTS_SITE_METHOD = git
AESD_ASSIGNMENTS_LICENSE = GPL-2.0
AESD_ASSIGNMENTS_LICENSE_FILES = COPYING
AESD_ASSIGNMENTS_MODULE_SUBDIRS = aesd-char-driver/

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
	$(INSTALL) -m 0755 $(@D)/aesd-char-driver/initScript $(TARGET_DIR)/etc/init.d/S100aesdcharmodule
	$(INSTALL) -m 0755 $(@D)/sockettest.sh $(TARGET_DIR)/user/bin
endef

$(eval $(kernel-module))
$(eval $(generic-package))
