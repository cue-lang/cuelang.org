package site
{
	content: {
		docs: {
			concept: {
				"how-cue-works-with-openapi": {
					page: {
						cache: {
							upload: {
								"schema.cue":           "FghUlUoiyNfBf2/34kIYk7+N46NMp7vrSqI3I9KXwDM="
								"api.pet.yaml":         "x9Fj402D66s0Blu4kJylse6MAJo9wq4qUqN4X1lcrZ4="
								"api.pet.cue":          "7x3FUbNlZ8UXzFPXKNAyoiQIyQo4elP5N486bYoa/Tk="
								"go emit openapi main": "WH6PV3SGnRpwbeAggHhCumlkUCAuxR/xf3QIcYhfNTc="
							}
							multi_step: {
								hash:       "B9EQU3FQFFIB3E03KNMSAQF2HQD1BI2OK41GEPKI7G13CQG848O0===="
								scriptHash: "4M1CFTVIPV6RJPE5F4II4TA9J8C0INSAQVSQDS8E6IOETFKA7T1G===="
								steps: [{
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
									cmd:      "go mod init mod.example"
									exitCode: 0
									output: """
											go: creating new go.mod: module mod.example

											"""
								}, {
									doc:      ""
									cmd:      "go get cuelang.org/go@v0.9.0-alpha.3"
									exitCode: 0
									output: """
											go: downloading cuelang.org/go v0.9.0-alpha.3
											go: added cuelang.org/go v0.9.0-alpha.3

											"""
								}, {
									doc:      ""
									cmd:      "go mod tidy"
									exitCode: 0
									output: """
											go: downloading github.com/go-quicktest/qt v1.101.0
											go: downloading golang.org/x/tools v0.19.0
											go: downloading github.com/cockroachdb/apd/v3 v3.2.1
											go: downloading github.com/google/go-cmp v0.6.0
											go: downloading cuelabs.dev/go/oci/ociregistry v0.0.0-20240404174027-a39bec0462d2
											go: downloading golang.org/x/oauth2 v0.18.0
											go: downloading golang.org/x/sync v0.6.0
											go: downloading golang.org/x/text v0.14.0
											go: downloading github.com/rogpeppe/go-internal v1.12.0
											go: downloading github.com/emicklei/proto v1.10.0
											go: downloading github.com/protocolbuffers/txtpbfmt v0.0.0-20230328191034-3462fbc510c0
											go: downloading github.com/opencontainers/go-digest v1.0.0
											go: downloading github.com/opencontainers/image-spec v1.1.0
											go: downloading golang.org/x/mod v0.16.0
											go: downloading github.com/kr/pretty v0.3.1
											go: downloading gopkg.in/yaml.v3 v3.0.1
											go: downloading golang.org/x/net v0.22.0
											go: downloading github.com/google/uuid v1.6.0
											go: downloading github.com/mitchellh/go-wordwrap v1.0.1
											go: downloading golang.org/x/sys v0.18.0
											go: downloading github.com/kr/text v0.2.0
											go: downloading gopkg.in/check.v1 v1.0.0-20180628173108-788fd7840127
											go: downloading google.golang.org/appengine v1.6.7
											go: downloading github.com/golang/protobuf v1.5.3
											go: downloading google.golang.org/protobuf v1.31.0
											go: downloading github.com/lib/pq v1.10.7
											go: downloading github.com/kylelemons/godebug v1.1.0

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
