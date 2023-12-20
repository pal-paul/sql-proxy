# Google Cloud SQL Proxy

run the Google Cloud SQL Proxy in a GitHub Action's context

## Usage

### Prerequisites

-   Running Cloud SQL instance with a public IP address
-   Service Account with Role `Cloud SQL Client`

``` yaml
on:
  push:
    branches: [ master ]

jobs:
  db-migrate:
    runs-on: ubuntu-latest

    steps:
      - name: Authenticate to Google Cloud
        id: auth
        uses: google-github-actions/auth@v0.8.0
        with:
          token_format: access_token
          workload_identity_provider: WORKLOAD_IDENTITY_PROVIDER
          service_account: SERVICE_ACCOUNT

      - name: Start CloudSQL Proxy
        uses: xxx@v2
        with:
          token: ${{ steps.auth.outputs.access_token }}
          connection: ${{ inputs.database-instance-name }}
          port: 5432
```

### Inputs

| input      | required | default         | description                                                        |
|------------|----------|-----------------|--------------------------------------------------------------------|
| token      | ✓        | `-`             | Service Account OIDC token                                         |
| connection | ✓        | `-`             | Cloud SQL connection name                                          |
| port       | ✓        | `-`             | *Listening port (MySQL: 3306, PostgreSQL: 5432, SQL Server: 1433)* |
| version    | ✗        | `1.22.0-alpine` | Cloud SQL Proxy [Version][]                                        |