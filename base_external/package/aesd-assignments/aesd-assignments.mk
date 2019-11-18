
##############################################################
#
# AESD-ASSIGNMENTS
#
##############################################################

# reference Rushi's repo
AESD_ASSIGNMENTS_VERSION = 1d19d06eceb245e8ad7cef0a1cd0a1ab31ff915a
AESD_ASSIGNMENTS_SITE = git@github.com:cu-ecen-5013/final-project-assignment-MacRush7.git
AESD_ASSIGNMENTS_SITE_METHOD = git
AESD_ASSIGNMENTS_LICENSE = GPL-2.0
AESD_ASSIGNMENTS_LICENSE_FILES = COPYING
AESD_ASSIGNMENTS_MODULE_SUBDIRS = aesd-char-driver/
AESD_ASSIGNMENTS_MODULE_SUBDIRS += fingerprint-driver/
AESD_ASSIGNMENTS_MODULE_SUBDIRS += rfid-driver/
AESD_ASSIGNMENTS_MODULE_SUBDIRS += buzzer-driver/
AESD_ASSIGNMENTS_MODULE_SUBDIRS += gsm-driver/

define AESD_ASSIGNMENTS_BUILD_CMDS
	$(MAKE) $(TARGET_CONFIGURE_OPTS) -C $(@D) all
endef

# required executables or scripts
define AESD_ASSIGNMENTS_INSTALL_TARGET_CMDS
	$(INSTALL) -m 0755 $(@D)/writer $(TARGET_DIR)/bin
	$(INSTALL) -m 0755 $(@D)/tester.sh $(TARGET_DIR)/bin
	$(INSTALL) -m 0755 $(@D)/finder.sh $(TARGET_DIR)/bin
	$(INSTALL) -m 0755 $(@D)/aesdsocket $(TARGET_DIR)/usr/bin
	$(INSTALL) -m 0755 $(@D)/fingerprint-driver/initScript $(TARGET_DIR)/etc/init.d/S97fscaninit.sh
	$(INSTALL) -m 0755 $(@D)/aesd-char-driver/initScript $(TARGET_DIR)/etc/init.d/S100aesdcharmodule
	$(INSTALL) -m 0755 $(@D)/rfid-driver/WHATISITCALLED $(TARGET_DIR)/etc/init.d/S96rfidinit.sh
	$(INSTALL) -m 0755 $(@D)/buzzer-driver/WHATISITCALLED $(TARGET_DIR)/etc/init.d/S94buzzinit.sh
	$(INSTALL) -m 0755 $(@D)/gsm-driver/WHATISITCALLED $(TARGET_DIR)/etc/init.d/S95gsminit.sh

endef

$(eval $(kernel-module))
$(eval $(generic-package))
