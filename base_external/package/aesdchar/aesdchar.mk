##############################################################
#
# AESDCHAR
#
##############################################################

#TODO: Fill up the contents below in order to reference your assignment 3 git contents
AESDCHAR_MODULE_VERSION = 2a85d905f57e5b0be7c4447e2a5a638cc8d220f2
AESDCHAR_SITE = git@github.com:cu-ecen-5013/aesd-assignments-3-and-later-MacRush7.git
AESDCHAR_SITE_METHOD = git
AESDCHAR_MODULE_SUBDIRS = aesd-char-driver

define KERNEL_MODULE_BUILD_CMDS
        $(MAKE) -C '$(@D)' LINUX_DIR='$(LINUX_DIR)' CC='$(TARGET_CC)' LD='$(TARGET_LD)' modules
endef
 
$(eval $(kernel-module))
$(eval $(generic-package))
