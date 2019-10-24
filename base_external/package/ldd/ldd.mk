
##############################################################
#
# LDD
#
##############################################################

#TODO: Fill up the contents below in order to reference your assignment 3 git contents
LDD_VERSION = f406ae89f022e0609bb3a4323607c4477670ca88
LDD_SITE = git@github.com:cu-ecen-5013/assignment-7-buildroot-and-yocto-kernel-builds-MacRush7.git/misc-modules
LDD_SITE_METHOD = git
LDD_MODULE_SUBDIRS = misc-modules

define KERNEL_MODULE_BUILD_CMDS
        $(MAKE) -C '$(@D)' LINUX_DIR='$(LINUX_DIR)' CC='$(TARGET_CC)' LD='$(TARGET_LD)' modules
endef
 
$(eval $(kernel-module))
$(eval $(autotools-package))
#$(eval $(generic-package))
