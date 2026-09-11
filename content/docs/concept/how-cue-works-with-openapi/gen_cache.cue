package site
{
	content: {
		docs: {
			concept: {
				"how-cue-works-with-openapi": {
					page: {
						cache: {
							upload: {
								"schema.cue":           "Eb7acR1zydG4XOhj8ddhelbiewtLRLYiD82sSxX1+dI="
								"api.pet.yaml":         "X+GHVsHixQl7lftpHpmnIkzGMf/rgLmwOk5d7eakVhs="
								"api.pet.cue":          "AM3RUMGoaVCDYK4oRadpU0Tkg8ZuVtY6mA0ir7krVMg="
								"jonathan.yml":         "HxKTVlmHTsTtquB1fPFA65X9p2MPoHJzU0eJ9IclNcw="
								"go emit openapi main": "cHcT30hudF6VHsYI/td2h1S5bjvfcaminZ8qW/4tabQ="
							}
							multi_step: {
								hash:       "73PH6405VRFL8QIAI8G3COG5P23MAAGU0LF7290KBP7RAIEUR0K0===="
								scriptHash: "V5F4J5N55RFK351FKFVB2PU5QBMOG18GIB1F4D6UI0847N3D2U40===="
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
									cmd:      "go get cuelang.org/go@v0.0.0-goreleaser.202609101448"
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
