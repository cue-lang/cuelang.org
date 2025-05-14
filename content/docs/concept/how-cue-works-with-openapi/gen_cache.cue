package site
{
	content: {
		docs: {
			concept: {
				"how-cue-works-with-openapi": {
					page: {
						cache: {
							upload: {
								"schema.cue":           "WUYOw2grpQi5C/gcm7aGkDTYQ+xVhyoafjRDHfgjeg0="
								"api.pet.yaml":         "91IptHPqhuClht0exI8eXOSCST+LY/6GSUDAmPH65aw="
								"api.pet.cue":          "6K9PXB6lufSjN+HLi/F8/bGX0wnsRvRDOxPfwpwc6rE="
								"jonathan.yml":         "hvB8+0OukwqD4ixzU4O+ejWWtZWQ3qV98sOcqMJEjRg="
								"go emit openapi main": "nMPeZFutNnX9GXf4lGL4XGNCmvyukYqSs5DlUug1FRk="
							}
							multi_step: {
								hash:       "GPCDMPS8S6DE5HUC1DH8ADMHIKCTR8TCTRU4CS40M8KSCNUJF5TG===="
								scriptHash: "0JPDR4GSSJCUJ5C61HGE2E2QM9BT7ACALRDLKLJUFLB9SQRL6TNG===="
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
									cmd:      "go get cuelang.org/go@v0.12.1"
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
