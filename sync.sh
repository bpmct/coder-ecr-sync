#!/bin/sh

# a simple script to edit a registry in Coder, and update the
# password with the latest AWS ECR password token.

# run this periodically (every <12 hours) to keep the ECR
# authentication up to date in Coder

# uses Coder's REST API: https://apidocs.coder.com

# you can set the variables here
# CODER_URL=htttps://dev.coding.pics
# CODER_API_TOKEN=
# CODER_REGISTRY_ID=
# CODER_ORG_ID=default

# generate date to edit image name
DATE=$(date +'%d/%m/%y')

# get the password from aws cli
PASSWORD=$(aws ecr get-login-password)

curl --request PATCH \
  --url "$CODER_URL/api/v0/registries/$CODER_REGISTRY_ID" \
  --header 'Content-Type: application/json' \
  --header "Session-Token: $CODER_API_TOKEN" \
  --data "{
  \"friendly_name\": \"AWS ECR ($DATE)\",
  \"password:\": \"$PASSWORD\"
}"