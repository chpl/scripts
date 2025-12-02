#!/usr/bin/env bash
set -e

STAGE=$1
#socond argument is the org id or default to cia
ORG_ID=${2:-'bd12a04a-b051-4f51-9a8a-8a32ac198802'}

if [[ $(aws sts get-caller-identity --output json | jq .Account) != '"170412844252"' ]]
then
  echo "Please make sure you have you AWS DEV credentials set in the terminal";
  exit 1;
fi

if [[ -z $AWS_DEFAULT_REGION ]]
then
  echo "Please set aws region variable (AWS_DEFAULT_REGION)"
  exit 1;
fi

if [[ -z $STAGE ]]
then
  echo "You did not pick a pr environment. Please run the script as follows: './add-cia-to-pr.sh prXXXX'";
  exit 1;
fi

echo "Checking whether org exists in your PR $STAGE"
org_in_pr=$(aws dynamodb get-item --output json --table-name organization-service-$STAGE-organizations --key="{ \"id\": { \"S\": \"${ORG_ID}\" }}" | jq -r .Item)
if [[ ! -z $org_in_pr ]]
then
  echo "Org already exists on the PR!"
else
  echo "Creating org in your PR $STAGE. Copying org from dev..."
  aws dynamodb put-item --table-name "organization-service-$STAGE-organizations" --item "$(aws dynamodb get-item --output json --table-name organization-service-dev-organizations --key="{ \"id\": { \"S\": \"${ORG_ID}\" }}" | jq -r .Item)"
  echo "Done creating org!"
fi

