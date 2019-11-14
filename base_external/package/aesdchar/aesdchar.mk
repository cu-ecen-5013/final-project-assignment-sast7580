##############################################################
#
# AESDCHAR
#
##############################################################

#TODO: Fill up the contents below in order to reference your assignment 3 git contents

AESDCHAR_VERSION = 8cfe362efa38e8087c687682e8084ea57220a27d
AESDCHAR_SITE = git@github.com:cu-ecen-5013/aesd-assignments-3-and-later-MacRush7.git

AESDCHAR_SITE_METHOD = git
AESDCHAR_MODULE_SUBDIRS = aesd-char-driver/
 
$(eval $(kernel-module))
$(eval $(generic-package))
