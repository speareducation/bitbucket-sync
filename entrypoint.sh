#!/bin/sh

# Get Token
ACCESS_TOKEN=$(
    curl -X POST -u "$INPUT_CLIENT_KEY:$INPUT_CLIENT_SECRET" \
        -d grant_type=client_credentials \
        https://bitbucket.org/site/oauth2/access_token |\
        jq -r .access_token
)

[ -z "$ACCESS_TOKEN" ] && echo "Failed to authenticate with bitbucket. Please check the client key and secret." && exit 1


OLD_ORIGIN=$(git remote get-url origin)
NEW_ORIGIN="https://x-token-auth:$ACCESS_TOKEN@$INPUT_REPOSITORY"

git remote add old "$OLD_ORIGIN"
git remote add new "$NEW_ORIGIN"

# Make sure we fetch all commits
git fetch --unshallow old

BRANCH=$(git rev-parse --abbrev-ref HEAD)

git push new "$BRANCH"
