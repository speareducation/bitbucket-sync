# bitbucket-sync
Action for syncing the repo into bitbucket

Example:
```
jobs:
  sync:
    runs-on: ubuntu-latest

    steps:
      - uses: actions/checkout@v2
      - uses: speareducation/bitbucket-sync@master
        with:
          repository: bitbucket.org/speareducation/patient
          client_key: ${{ secrets.BITBUCKET_CLIENT_KEY }}
          client_secret: ${{ secrets.BITBUCKET_CLIENT_SECRET }}
```
