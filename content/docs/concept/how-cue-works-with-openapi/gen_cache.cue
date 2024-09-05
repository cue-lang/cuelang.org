package site
{
	content: {
		docs: {
			concept: {
				"how-cue-works-with-openapi": {
					page: {
						cache: {
							upload: {
								"schema.cue":           "WrMoau7M5+bwZq0kBhKZARrZF1wAuXRCZtZSk4DCFCY="
								"api.pet.yaml":         "JgaQoR2UwgVnK+sWN0P4YGNpRMe72l4CiY1qAPUQYSQ="
								"api.pet.cue":          "fp0/04CyP2+74KGiOok9ntnrdBYcMQvrOfk9cwgiA+c="
								"jonathan.yml":         "orCPhg1SUdcokkvYw5ayZcKLWiiTn3fPQE79KOthgTI="
								"go emit openapi main": "W4i2qRpYs+yackHHU9xbCCuYIsh75fELYNoPLizflT0="
							}
							multi_step: {
								hash:       "2VBQECPHI5ONB438VRIILL3LOUT36S30U4C6PE4TFB1IC2RCQPGG===="
								scriptHash: "1V7UFAMT7FRI5I04C16KM620ILLQ4GRI80ASNBLDG3NMT0N1MTLG===="
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
											kind: 3 errors in empty disjunction:
											kind: conflicting values "cat" and "tortoise":
											    ./api.pet.yaml:11:7
											    ./api.pet.yaml:26:11
											    ./jonathan.yml:2:7
											kind: conflicting values "dog" and "tortoise":
											    ./api.pet.yaml:26:11
											    ./jonathan.yml:2:7
											kind: conflicting values "goldfish" and "tortoise":
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
									cmd:      "go get cuelang.org/go@v0.10.0"
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
								}]
							}
						}
					}
				}
			}
		}
	}
}
