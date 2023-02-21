GOARCH = amd64
OS = linux

.DEFAULT_GOAL := all

all: source-build

.PHONY: source-build
source-build:
	CGO_ENABLED=0 GOOS="$(OS)" GOARCH="$(GOARCH)" go build 

.PHONY: run-read
run-read:
	./catalog-connector-client --request-payload resources/read-request.json --operation-type "get-asset" --creds "qqq" --url "http://localhost:888"

.PHONY: run-write
run-write:
	./catalog-connector-client --request-payload resources/write-request-mysql.json --operation-type "create-asset" --creds "qqq" --url "http://localhost:888"

include hack/make-rules/verify.mk

