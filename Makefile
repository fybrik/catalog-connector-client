GOARCH = amd64
OS = linux

.DEFAULT_GOAL := all

all: source-build

.PHONY: source-build
source-build:
	CGO_ENABLED=0 GOOS="$(OS)" GOARCH="$(GOARCH)" go build 

.PHONY: run-read
run-read:
	./catalog-connector-client --request-payload resources/read-request.json --operation-type "get-asset" --creds "/v1/kubernetes-secrets/dummy-creds?namespace=dummy-namespace2" --url "http://localhost:8080"

.PHONY: run-write
run-write:
	./catalog-connector-client --request-payload resources/write-request-mysql.json --operation-type "create-asset" --creds "/v1/kubernetes-secrets/dummy-creds?namespace=dummy-namespace2" --url "http://localhost:8080"

include hack/make-rules/verify.mk

