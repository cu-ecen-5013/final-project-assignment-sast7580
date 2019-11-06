##############################################################
#
# LDD
#
##############################################################

#TODO: Fill up the contents below in order to reference your assignment 3 git contents
LDD_VERSION = 5065f15fad0ec608558accdff2e4694d6e8aa6ce
LDD_SITE = git@github.com:cu-ecen-5013/assignment-7-buildroot-and-yocto-kernel-builds-MacRush7.git
LDD_SITE_METHOD = git
LDD_MODULE_SUBDIRS = misc-modules/
LDD_MODULE_SUBDIRS += scull/
 
$(eval $(kernel-module))
$(eval $(generic-package))
