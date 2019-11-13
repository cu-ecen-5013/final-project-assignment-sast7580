##############################################################
#
# AESDCHAR
#
##############################################################

#TODO: Fill up the contents below in order to reference your assignment 3 git contents

AESDCHAR_VERSION = a07ef67b9959ce6aa4c8f496bae1d4872bee9f80
AESDCHAR_SITE = git@github.com:MacRush7/aesdchar.git

#AESDCHAR_VERSION = 7ac45c925e5170f99cbf6268492f3adec620a098
#AESDCHAR_SITE = git@github.com:cu-ecen-5013/aesd-assignments-3-and-later-MacRush7.git

AESDCHAR_SITE_METHOD = git
AESDCHAR_MODULE_SUBDIRS = aesd-char-driver/
 
$(eval $(kernel-module))
$(eval $(generic-package))
