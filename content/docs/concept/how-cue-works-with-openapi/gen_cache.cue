package site
{
	content: {
		docs: {
			concept: {
				"how-cue-works-with-openapi": {
					page: {
						cache: {
							upload: {
								"schema.cue":           "mNmKxSQdU+nFbqZ04Ke2fctmNS1RM/Sh5Pthsw6JVtc="
								"api.pet.yaml":         "5IbdVdqKN17CtX4qVIIdxMDYhJrSX2lJew52jWOCQmc="
								"api.pet.cue":          "DUOhrOGdNGdocvsUUQlzD2CNWGJxsvugOWHGF2riKuM="
								"jonathan.yml":         "LwhtzWyWY5HgEI0zwCsr0LB+ELnFOqHHj24wvP6bDeQ="
								"go emit openapi main": "oiNp/doqTVfx1wJ9kLhowjDWLp/mJ/vJIm8IZ3+nloc="
							}
							multi_step: {
								hash:       "DF456URVLJF9HVL3N3FM7D51OOD21PCMOI2STN7MEN9QA6SO39HG===="
								scriptHash: "O93Q4PU77P7IIOFGJMESSVGCKD6H7BN48VT14UNFE8S3ICGMBP7G===="
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
											kind: 3 errors in empty disjunction:
											kind: conflicting values "cat" and "tortoise":
											    ./api.pet.yaml:12:11
											    ./api.pet.yaml:26:11
											    ./jonathan.yml:2:7
											kind: conflicting values "dog" and "tortoise":
											    ./api.pet.yaml:13:11
											    ./api.pet.yaml:26:11
											    ./jonathan.yml:2:7
											kind: conflicting values "goldfish" and "tortoise":
											    ./api.pet.yaml:14:11
											    ./api.pet.yaml:26:11
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
									cmd:      "go get cuelang.org/go@v0.18.0-alpha.2.0.20261002131943-93402de82790"
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
