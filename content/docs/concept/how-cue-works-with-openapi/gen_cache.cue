package site
{
	content: {
		docs: {
			concept: {
				"how-cue-works-with-openapi": {
					page: {
						cache: {
							upload: {
								"schema.cue":           "iqVw7nbO23NrGFGlAhSB5MoWQ7anBgFUQXI5iyggB9k="
								"api.pet.yaml":         "BMEezsksr/IbWLaw98/EXcNg3kLiwfrwI8tlFP9AiaU="
								"api.pet.cue":          "sG2nuyV5ExjQk3icwOUwq3S8cMsITV+GuJ9TKN2Jd+k="
								"jonathan.yml":         "FyWtj6CjFYKxVEy/GabjiIqlAfOtlPYlFOR/qG0dPbI="
								"go emit openapi main": "FmOVMlkzQrlcxW2ana6YC38g9s+PsHu4YnlOG5J+HJ8="
							}
							multi_step: {
								hash:       "P81NCAFJ0UI5H9PJLNN432OUB17PJN9AC7I4RFGO6R5URC6H7M9G===="
								scriptHash: "2BVN4S5VNQCBS8G4S2DHJKE72RSLV8GUKSJ3CNHBOAJM3JO6JGD0===="
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
									cmd:      "export STATICCHECK_CACHE=/caches/staticcheck"
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
									cmd:      "go get cuelang.org/go@v0.14.1"
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
									cmd:      "staticcheck ./..."
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
