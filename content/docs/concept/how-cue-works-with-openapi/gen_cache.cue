package site
{
	content: {
		docs: {
			concept: {
				"how-cue-works-with-openapi": {
					page: {
						cache: {
							upload: {
								"schema.cue":           "bmIpEu6QuAH7pI4bsWbhjzpDHJW7MMG7u4rmhNn0ASI="
								"api.pet.yaml":         "SQH2PXPpclnkLS21LMR8s29kJxqLxzeBoVsh4311hZ4="
								"api.pet.cue":          "NzMFrBPlGG7aq2faB9Hwp5S8CnN+CRw9rJ9AxvHOgyU="
								"jonathan.yml":         "vy70W9aKZylXVRsUHWQ+ViLJfmfhzTXAzmOGqvowG3U="
								"go emit openapi main": "Fq+2WPlUXzvySpyXik80Up8MMp1W47JxCYWopH95GwM="
							}
							multi_step: {
								hash:       "7B5NIDAPDJ0NSREKIHDKJG2K572G3T1QH4V9AFQBKTEE0T87SUB0===="
								scriptHash: "O8VANGDJAVO5C1QCJ5EPRMK4LGG3QNLG9N525R7GL7MLHB760SG0===="
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
