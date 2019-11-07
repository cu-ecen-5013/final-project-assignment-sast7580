##############################################################
#
# AESDCHAR
#
##############################################################

#TODO: Fill up the contents below in order to reference your assignment 3 git contents
AESDCHAR_VERSION = b2030b9229deff23b01b52170493c97bb6202d06
AESDCHAR_SITE = git@github.com:cu-ecen-5013/aesd-assignments-3-and-later-MacRush7.git
AESDCHAR_SITE_METHOD = git
AESDCHAR_MODULE_SUBDIRS = aesd-char-driver/
 
$(eval $(kernel-module))
$(eval $(generic-package))
