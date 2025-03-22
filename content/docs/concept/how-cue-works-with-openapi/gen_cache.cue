package site
{
	content: {
		docs: {
			concept: {
				"how-cue-works-with-openapi": {
					page: {
						cache: {
							upload: {
								"schema.cue":           "XnMHVspypDpyNTdNs86mgYLA0Z6+39sscyDZcINwlio="
								"api.pet.yaml":         "wQLx7lvWj17W0oNLqbj4vJkDTOH8t63YOdBclaKCPGE="
								"api.pet.cue":          "B7Aw8kF3fcy/eoVefY27J+6fqCFMVMtB5/07n6a2aB4="
								"jonathan.yml":         "UIo9nctKpPlCVtf30o6Eargf5aler/gDek5cLg+qmKs="
								"go emit openapi main": "uh0KowxEERm2QjElafqCJFwVccHnYl6LNAXFlbNBWEQ="
							}
							multi_step: {
								hash:       "C8NAE7G8MTQB73BEE90KQA3BI91O3978I8TEMRPF02E0SDNFK5N0===="
								scriptHash: "8O0SCTKT4M8JHNKQSD6BSSJ42RI09O3P5SBLDNOUO3JJ9JQBH9MG===="
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
									cmd:      "mv api.pet.yaml .api.pet.yaml"
									exitCode: 0
									output:   ""
								}, {
									doc:      ""
									cmd:      "diff -wu api.pet.yaml .api.pet.yaml"
									exitCode: 0
									output:   ""
								}, {
									doc:      ""
									cmd:      "rm .api.pet.yaml # tidy up"
									exitCode: 0
									output:   ""
								}, {
									doc:      ""
									cmd:      "cue import -p api api.pet.yaml"
									exitCode: 0
									output:   ""
								}, {
									doc:      ""
									cmd:      "mv api.pet.cue .api.pet.cue"
									exitCode: 0
									output:   ""
								}, {
									doc:      ""
									cmd:      "diff -wu api.pet.cue .api.pet.cue"
									exitCode: 0
									output:   ""
								}, {
									doc:      ""
									cmd:      "rm .api.pet.cue # tidy up"
									exitCode: 0
									output:   ""
								}, {
									doc:      ""
									cmd:      "cue vet api.pet.yaml jonathan.yml -d '#Pet'"
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
									cmd:      "go get cuelang.org/go@v0.13.0-alpha.1.0.20250322080417-cfbeb48088c9"
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
