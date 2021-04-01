# coder-ecr-sync

Workaround to get AWS ECR working in Coder / example of scripting with the [Coder REST API](https://apidocs.coder.com).

Run this script to update your registry in Coder with the latest ECR password.

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
