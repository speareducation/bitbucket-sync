#!/bin/sh

CLIENT_KEY="$INPUT_BITBUCKET_CLIENT_KEY"
CLIENT_SECRET="$INPUT_BITBUCKET_CLIENT_SECRET"

# Get Token
ACCESS_TOKEN=$(
    curl -X POST -u "$CLIENT_KEY:$CLIENT_SECRET" \
        -d grant_type=client_credentials \
        https://bitbucket.org/site/oauth2/access_token |\
        jq -r .access_token
)

[ -z "$ACCESS_TOKEN" ] && echo "Failed to authenticate with bitbucket. Please check the client key and secret." && exit 1


git remote set-url origin "https://x-token-auth:$ACCESS_TOKEN@$INPUT_REPOSITORY"

git push origin "$(git rev-parse --abbrev-ref HEAD)"
