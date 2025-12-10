#!/bin/bash

# Entering an MFA code
read -p "Enter the MFA code: " mfacode

# Obtaining temporary credentials
creds=$(aws sts get-session-token \
  --profile mfa \
  --serial-number arn:aws:iam::340822112160:mfa/dan_it \
  --token-code "$mfacode")

# Verifying the success of obtaining credentials
if [ $? -ne 0 ]; then
  echo "Error retrieving temporary credentials."
  exit 1
fi

# Export credentials
export AWS_ACCESS_KEY_ID=$(echo $creds | jq -r .Credentials.AccessKeyId)
export AWS_SECRET_ACCESS_KEY=$(echo $creds | jq -r .Credentials.SecretAccessKey)
export AWS_SESSION_TOKEN=$(echo $creds | jq -r .Credentials.SessionToken)

# Verifying
echo "Temporary credentials successfully received. Checking..."

aws sts get-caller-identity
