package site
{
	content: {
		docs: {
			concept: {
				"how-cue-works-with-openapi": {
					page: {
						cache: {
							upload: {
								"schema.cue":           "25/ynlkDHL/aIpAhKbCLArinf2vwtTWOlQJJNfKUh98="
								"api.pet.yaml":         "3qG5iGWtwMPmAFt9jvN0+snNqGQCvwRjI6G8/pYKpfQ="
								"api.pet.cue":          "bw+35klIWVf9ulvj2XGQ1XIAzvzYBFsFw/KIpQUkIPk="
								"jonathan.yml":         "uVb8VfYZXM0QJT9Q3IL17o1shuE3btLmbdhrDmATyxk="
								"go emit openapi main": "Ux0BWCSwcjFWwXcunjYSrZR0BZnFFaNcvGXGA4cavzw="
							}
							multi_step: {
								hash:       "O7B3EJ8CTE38KO39J5LJM9TMKQK9M8Q8BPF21POD9SIB36ACMHV0===="
								scriptHash: "QM2SDBH11CMV013DN77P9DFG1S0LR9AKTJJEO7OD57D0L52J7DC0===="
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
									cmd:      "go get cuelang.org/go@v0.14.0"
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
