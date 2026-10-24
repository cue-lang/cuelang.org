package site
{
	content: {
		docs: {
			concept: {
				"how-cue-works-with-openapi": {
					page: {
						cache: {
							upload: {
								"schema.cue":           "otQDphktEY09XFRebTHCs3Ox+CscDs1FJQaN2EVWnFs="
								"api.pet.yaml":         "voZvlCJsNUoFA7hjCPZOqv2od3c7x7AH5iKtmNkhqJw="
								"api.pet.cue":          "3tNczEsIfAb2atu97oYIjVkWPpXNIhqMtopPtMYd0kk="
								"jonathan.yml":         "Roa21JCQ1Uj4DaOvS2CeFxu1Xz8726pUeA/NqxCBxzI="
								"go emit openapi main": "PeOwZqPjSaJvee4xdXK8iGUnHRu9VItf7f9JzoK/oRA="
							}
							multi_step: {
								hash:       "RNLBIU2FSN0508L8CNMGCJ3FRJJMBHN4TFPOSO11EN96Q0UKLK40===="
								scriptHash: "PNK4HDVEF8DR2T92NULGSNIO37NRAKO3LJTK38JEB5259QDF5TQG===="
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
									cmd:      "go get cuelang.org/go@v0.18.0-rc.1.0.20261023142911-c9393fa32ac5"
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
