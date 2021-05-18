# actions-event-register
A GitHub action for registering Events to PipeCD

## Inputs

### `api-address`

**Required**: gRPC address to the PipeCD api server.

### `api-key`

**Required**: API key to which the READ_WRITE role is attached.

### `event-name`

**Required**: The name of Event.

### `data`

**Required**: The string value of event data.

### `labels`

**Optional**: The comma-separated list of labels for the event. Format: key=value,key2=value2

## Example usage

```yaml
# .github/workflows/register-event.yml
name: "Register an event on PipeCD"
on:
  push:
    branches:
    - main

jobs:
  comment-run:
    runs-on: ubuntu-latest
    steps:
    - uses: actions/checkout@v2
    - uses: pipe-cd/actions-event-register@v1.0
      with:
        api-address: ${{ secrets.PIPECD_API_ADDRESS }}
        api-key: ${{ secrets.PIPECD_API_KEY }}
        event-name: image-update
        labels: app=foo,env=dev
        data: $GITHUB_REF
```
