#!/usr/bin/sh
#
# create WIF profile
gcloud config configurations create gcd-paris-test
gcloud config configurations activate gcd-paris-test
#
# Define Universe and End-points 
gcloud config set universe_domain s3nsapis.fr
AUDIENCE="locations/global/workforcePools/customerfacing-pool/providers/saml"
UNIVERSE_WEB_DOMAIN="cloud.s3nscloud.fr"
UNIVERSE_API_DOMAIN="s3nsapis.fr"
#
# Create the WIF configuration
gcloud iam workforce-pools create-login-config $AUDIENCE --universe-cloud-web-domain="$UNIVERSE_WEB_DOMAIN" --universe-domain="$UNIVERSE_API_DOMAIN" --output-file="wif-login-config.json" --activate
#
# Authenticate
gcloud auth login –login-config=wif-login-config.json
