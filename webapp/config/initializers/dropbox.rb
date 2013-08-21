# you might want to put the key and secret in a configuration file
# that's not versioned with application code
#Dropbox::API::Config.app_key    = 'cwi11tahscdlt3e'
#Dropbox::API::Config.app_secret = 'gx8mm837rg6k3ik'
# 'sandbox' mode because designated app-exclusive directory is fine for us
#Dropbox::API::Config.mode       = 'dropbox'

DROPBOX_APP_KEY = 'cwi11tahscdlt3e'
DROPBOX_APP_SECRET = 'gx8mm837rg6k3ik'
DROPBOX_MODE = 'dropbox'

require 'dropbox_sdk'