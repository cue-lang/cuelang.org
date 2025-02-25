package site
{
	content: {
		docs: {
			concept: {
				"how-cue-works-with-openapi": {
					page: {
						cache: {
							upload: {
								"schema.cue":           "ORjiCMQaMu74IlPmbTnp6Omg+Gmt4cs97yyJEoi8MdI="
								"api.pet.yaml":         "Tm4SI8jIkOoURawyqLrvVcDz3n6OR2d1dRXAFKnxW+U="
								"api.pet.cue":          "5zRvVST4fVT983veWt3l8d64/gvrllhpoqvThKDGKAk="
								"jonathan.yml":         "RCnyPLNl4a0mHRc3TZULDmHsNn+JiCLIITJQlzTtGH4="
								"go emit openapi main": "tb8vuCetCiwwREBAvV1g0t5jfC++P1TgQNTA6JtjZms="
							}
							multi_step: {
								hash:       "F2CFKUER37G31NDKMMT6JB99MIUTM1Q0FUTCI9D5B55M88PVRLS0===="
								scriptHash: "TNDK8UALPJGGVMFVVAGSMV3QJA3CTFB1OD27P0HB9NBS0FPB1APG===="
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
									cmd:      "go get cuelang.org/go@v0.12.0"
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
