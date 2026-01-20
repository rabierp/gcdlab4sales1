!#/usr/bin/sh
#
# create WIF profile
gcloud config configurations create gcd-paris-test
gcloud config configurations activate gcd-paris-test
#
# Define Universe and End-points 
gcloud config set universe_domain apis-berlin-build0.goog
AUDIENCE=locations/global/workforcePools/gotc01-dogfood-wfp/providers/gotc01-dogfood-corpsso-saml
UNIVERSE_WEB_DOMAIN="cloud.berlin-build0.goog”
UNIVERSE_API_DOMAIN="apis-berlin-build0.goog"
#
# Create the WIF configuration
gcloud iam workforce-pools create-login-config $AUDIENCE --universe-cloud-web-domain="$UNIVERSE_WEB_DOMAIN" --universe-domain="$UNIVERSE_API_DOMAIN" --output-file="wif-login-config.json" --activate
#
# Authenticate
gcloud auth login –login-config=wif-login-config.json
