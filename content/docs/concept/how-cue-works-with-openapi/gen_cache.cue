package site
{
	content: {
		docs: {
			concept: {
				"how-cue-works-with-openapi": {
					page: {
						cache: {
							upload: {
								"schema.cue":           "CwAFoHtTdlmgAsZEoy6ulQUO7PRpvvt5tkOg8xgz5zM="
								"api.pet.yaml":         "bKNF2G9gAHRKtEKAgue8ITfdXxgSp+BfO06Nahhc0m4="
								"api.pet.cue":          "iutum8NgWfQtmi5gIiCbNKC0D8pz2sGExvaiUnGbChg="
								"jonathan.yml":         "Mn0L4IExcqZB/d4OnZKaS0AJs29F/AcCm36sgzNlA50="
								"go emit openapi main": "YU5aIVhtj72ZEk5xWsMDFi63wYw9/ni6goa0AdmGhKw="
							}
							multi_step: {
								hash:       "J82433REMJN0HH6FBRONAFOU4GQOMQFLF3O94VH32385ICNF0CUG===="
								scriptHash: "1DQOAEJR8TG9VOECULMDPB2EKEVCFUE3FNCG3RS1A81CVRP7KP4G===="
								steps: [{
									doc:      ""
									cmd:      "export GOMODCACHE=/caches/gomodcache"
									exitCode: 0
									output:   ""
								}, {
									doc:      ""
									cmd:      "export GOCACHE=/caches/gobuild"
									exitCode: 0
									output:   ""
								}, {
									doc:      ""
									cmd:      "cue def schema.cue -o api.pet.yaml --out openapi+yaml"
									exitCode: 0
									output:   ""
								}, {
									doc:      ""
									cmd:      "cue import -p api api.pet.yaml"
									exitCode: 0
									output:   ""
								}, {
									doc:      ""
									cmd:      "cue vet -c api.pet.yaml jonathan.yml -d '#Pet'"
									exitCode: 1
									output: """
											kind: 2 errors in empty disjunction:
											kind: conflicting values "cat" and "tortoise":
											    ./api.pet.yaml:11:7
											    ./jonathan.yml:2:7
											kind: conflicting values "dog" and "tortoise":
											    ./jonathan.yml:2:7

											"""
								}, {
									doc:      ""
									cmd:      "go mod init mod.example"
									exitCode: 0
									output: """
											go: creating new go.mod: module mod.example

											"""
								}, {
									doc:      "#ellipsis 0"
									cmd:      "go get cuelang.org/go@v0.13.2"
									exitCode: 0
									output: """
											...

											"""
								}, {
									doc:      "#ellipsis 0"
									cmd:      "go mod tidy"
									exitCode: 0
									output: """
											...

											"""
								}, {
									doc:      "#ellipsis 10"
									cmd:      "go run ."
									exitCode: 0
									output: """
											{
											  "openapi": "3.0.0",
											  "info": {
											    "title": "A schema for the pet API.",
											    "version": "v1.2.3"
											  },
											  "paths": {},
											  "components": {
											    "schemas": {
											      "Kind": {
											...

											"""
								}, {
									doc:      ""
									cmd:      "go vet ./..."
									exitCode: 0
									output:   ""
								}, {
									doc:      "#ellipsis 0"
									cmd:      "go run honnef.co/go/tools/cmd/staticcheck@v0.6.0 ./..."
									exitCode: 0
									output: """
											...

											"""
								}]
							}
						}
					}
				}
			}
		}
	}
}
