# coder-ecr-sync

Workaround to get AWS ECR working in Coder / example of scripting with the [Coder REST API](https://apidocs.coder.com).

Run this script (in a cron operation) to update your registry in Coder with the latest ECR password. It also edits the registry name to include the date, so it is easy to debug if/when the script failed. Comment/edit that line to keep your existing registry name.

## Context

Coder currently only supports password-based authentication to registries. AWS ECR can [generate a password token](https://docs.aws.amazon.com/cli/latest/reference/ecr/get-login-password.html) but it only lasts 12 hours. This script, if ran in a cron operation, will update the Coder registry with the latest password. (username should remain as `AWS`).

## Requirements

- Coder API Token [(create one here)](https://github.com/cdr/coder-cli/blob/master/docs/coder_tokens_create.md)

- AWS CLI authenticated on this machine/runner (it uses the `aws ecr get-login-password` command)

- These values. Set inside the script or as env vars:

```text
CODER_URL
(ex. "https://coder.yoursite.com")

CODER_API_TOKEN
(get it with coder-cli):
$ coder tokens create ecr-sync

CODER_ORG_ID
(visit this coder when you are logged in):
https://coder.yoursite.com/api/v0/orgs

CODER_REGISTRY_ID
(visit this coder when you are logged in):
https://coder.yoursite.com/api/v0/registries?org={orgid}
```
