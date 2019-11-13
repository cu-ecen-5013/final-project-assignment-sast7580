##############################################################
#
# AESDCHAR
#
##############################################################

#TODO: Fill up the contents below in order to reference your assignment 3 git contents

AESDCHAR_VERSION = 0cdc0bcb4006a7080e31e53f0deba1b6886c68d
AESDCHAR_SITE = git@github.com:MacRush7/aesdtestx.git

#AESDCHAR_VERSION = 7ac45c925e5170f99cbf6268492f3adec620a098
#AESDCHAR_SITE = git@github.com:cu-ecen-5013/aesd-assignments-3-and-later-MacRush7.git

AESDCHAR_SITE_METHOD = git
AESDCHAR_MODULE_SUBDIRS = aesd-char-driver/
 
$(eval $(kernel-module))
$(eval $(generic-package))
