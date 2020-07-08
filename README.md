# bitbucket-sync
Action for syncing the repo into bitbucket

Example:
```
jobs:
  build:
    runs-on: ubuntu-latest

    steps:
      - uses: actions/checkout@v2
      - uses: speareducation/action-bitbucket-sync
        with:
          id_rsa: ${{ secrets.BITBUCKET_RSA_KEY }}
          repository: bitbucket.org:organization/project.git
```