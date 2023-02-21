# catalog-connector-client

This is a client for communicating with [Fybrik](https://fybrik.io/) data catalog connector. It tests the validity of the connector response.

Requirements:

    make
    golang 1.19


## Quick Start


Building the client:

```bash
make all
```

Running get asset request:
```bash
make run-read
```

Running create asset request:
```bash
make run-write
```

Client options:

```
Data catalog connector client

Usage:
  catalog-connector-client [flags]

Flags:
      --creds string             Credential path (default "/v1/kubernetes-secrets/my-secret?namespace=default")
  -h, --help                     help for catalog-connector-client
      --operation-type string    Request operation. valid options are get-asset or create-asset (default "get-asset")
      --request-payload string   Json file containing the payload of the request (default "resources/read-request.json")
      --url string               Catalog connector Url (default "http://localhost:8888")
```

