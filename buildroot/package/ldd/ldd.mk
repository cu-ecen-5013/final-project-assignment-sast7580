##############################################################
#
# LDD
#
##############################################################

# reference assignment 7 ldd3 repo
LDD_VERSION = 3318cc1019cce3548fa988215beddd890ffc4942
LDD_SITE = git@github.com:cu-ecen-5013/assignment-7-buildroot-and-yocto-kernel-builds-sast7580.git
LDD_SITE_METHOD = git
LDD_LICENSE = GPL-2.0
LDD_LICENSE_FILES = COPYING
LDD_MODULE_SUBDIRS = misc-modules
LDD_MODULE_SUBDIRS += scull

$(eval $(kernel-module)) #generates all Makefile rules and vars
$(eval $(generic-package))
