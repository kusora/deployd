#!/usr/bin/env bash

set -e
echo "" > coverage.txt

for d in $(go list ./... | grep -Ev  'vendor|fixtures|utils'); do
    go test -v -race -coverprofile=profile.out -covermode=atomic $d
    if [ -f profile.out ]; then
        cat profile.out >> coverage.txt
        rm profile.out
    fi
done
