package site
{
	content: {
		docs: {
			concept: {
				"how-cue-works-with-openapi": {
					page: {
						cache: {
							upload: {
								"schema.cue":           "TompmFH4FLE1a6q2I33gQ1A0+8OLith1RJsypr/39QI="
								"api.pet.yaml":         "A8WLVGSCd+QMXe7QnzaxwaOjP9Z+EjyhBAAUPjtn1Ok="
								"api.pet.cue":          "7HPJRFJri5yir1Rly6BEL8I8bsV2Gr39CZdwTCf2wys="
								"jonathan.yml":         "xJ5673M8S9GsFhqZOPPjdSs9HyCSCfxvrtj2zcFseI8="
								"go emit openapi main": "ui8Yo/ZFANZuZJ8kX+rflaPoVGpM3zFvXkWO1d59K9A="
							}
							multi_step: {
								hash:       "LISGE1NRBDCULFMQATF08UF17SA1ICI0LJ9F8J1GLK0946U1C7L0===="
								scriptHash: "DCNBST3Q12VKQEB0P2GK9KOJLBGK7HMLD4AU6EA09EQ1FAMI3OE0===="
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
									cmd:      "go get cuelang.org/go@v0.13.1"
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
