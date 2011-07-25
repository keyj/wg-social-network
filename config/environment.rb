# Load the rails application
DEFAULT_PAPERCLIP_OPTIONS = {}

DEVISE_MAILER_FROM       = "please-change-me@example.com"
LIVE_PERSONS_EMAIL       = 'help@example.com'

FACEBOOK_APP_ID          = "203803142975088"
FACEBOOK_APP_SECRET      = "97e2e3dee356fd5bb13094b2dc8e8262"
FACEBOOK_APP_PERMISSIONS = "email,offline_access,publish_stream"

DEFAULT_FB_SHARE_IMAGE   = "http://localhost:3000/images/missing.png"
DEFAULT_FB_POST_NAME     = "This Site's Name"

DEFAULT_PAGE_TITLE       = "meine super WG"
DEFAULT_PAGE_DESCRIPTION = "unser Wohnzimmer im Internet"

TWITTER_SECRET_KEY       = "L0LJGa5g4TWNUJfK9jmACNt3i2P2ykUw0TVbysQinIg"
TWITTER_CONSUMER_KEY     = "D4sOenvRrSaI1GIGTTEeSQ"

DEFAULT_SHARE_URL        = "http://localhost:3000"

STEUERSATZ_MWS					 = 0.19

require File.expand_path('../application', __FILE__)

# Initialize the rails application
OmniauthDeviseExample::Application.initialize!
