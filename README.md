# actions-event-register
A GitHub action for registering Events to PipeCD. This action makes it easier to use the Event watcher feature in a GitHub Actions workflow.
For Event watcher, see: [the documentation](https://pipecd.dev/docs/user-guide/event-watcher)

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

## Examples
At first, you need to create new secrets with the name `PIPECD_API_ADDRESS` and `PIPECD_API_KEY`.
The value of `PIPECD_API_ADDRESS` must be in a format like "host:443" because the communication is done via gRPC.

### Using the commit SHA as data:

```yaml
name: "Register an event on PipeCD"
on:
  push:
    branches:
    - main
jobs:
  register-event:
    runs-on: ubuntu-latest
    steps:
    - uses: pipe-cd/actions-event-register@v1
      with:
        api-address: ${{ secrets.PIPECD_API_ADDRESS }}
        api-key: ${{ secrets.PIPECD_API_KEY }}
        event-name: image-update
        labels: app=foo,env=dev
        data: ${{ github.sha }}
```

### Using git tag as data:

```yaml
name: "Register an event on PipeCD"
on:
  push:
    branches:
    - main
jobs:
  register-event:
    runs-on: ubuntu-latest
    steps:
    - uses: actions/checkout@v2
      with:
        fetch-depth: 0
    - run: echo "TAG=`git describe --tags`" >> $GITHUB_ENV
    - uses: pipe-cd/actions-event-register@v1
      with:
        api-address: ${{ secrets.PIPECD_API_ADDRESS }}
        api-key: ${{ secrets.PIPECD_API_KEY }}
        event-name: image-update
        labels: app=foo,env=dev
        data: ${{ env.TAG }}
```
