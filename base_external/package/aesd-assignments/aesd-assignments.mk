##############################################################
#
# AESD-ASSIGNMENTS
#
##############################################################

#TODO: Fill up the contents below in order to reference your assignment 3 git contents
AESD_ASSIGNMENTS_VERSION = a79d7fc8379d2384bbcf88c8e31d5078d5e289ad
AESD_ASSIGNMENTS_SITE = git@github.com:cu-ecen-5013/final-project-assignment-MacRush7.git
AESD_ASSIGNMENTS_SITE_METHOD = git
AESD_ASSIGNMENTS_MODULE_SUBDIRS = aesd-char-driver/
AESD_ASSIGNMENTS_MODULE_SUBDIRS = buzzer-driver/
#AESD_ASSIGNMENTS_MODULE_SUBDIRS = fingerprint-driver/
#AESD_ASSIGNMENTS_MODULE_SUBDIRS = gsm-driver/
#AESD_ASSIGNMENTS_MODULE_SUBDIRS = nrf/

define AESD_ASSIGNMENTS_BUILD_CMDS
	$(MAKE) $(TARGET_CONFIGURE_OPTS) -C $(@D) all
endef

#TODO: Add required executables or scripts below
define AESD_ASSIGNMENTS_INSTALL_TARGET_CMDS
	$(INSTALL) -m 0755 $(@D)/buzzerdriver/initScript $(TARGET_DIR)/etc/init.d/S99buzzer
#	$(INSTALL) -m 0755 $(@D)/fingerprint-driver/initScript $(TARGET_DIR)/etc/init.d/S98fingerprint
	$(INSTALL) -m 0755 $(@D)/aesd-char-driver/S97aesdchar.sh $(TARGET_DIR)/etc/init.d/S97aesdchar
#	$(INSTALL) -m 0755 $(@D)/nrf/initScript $(TARGET_DIR)/etc/init.d/S98nrf

endef

$(eval $(kernel-module))
$(eval $(generic-package))
