package site
{
	content: {
		docs: {
			concept: {
				"how-cue-works-with-protocol-buffers": {
					page: {
						cache: {
							upload: {
								"basic.proto":            "com8ejKJBeJrs58gOPEDaghLrSRfmof75JPoNQp6Jh4="
								"basic.cue":              "JIYjOa1YU+m2yEqrEkm/OjjA9vz/kcxgkfRvKAz4Kt8="
								"go convert basic.proto": "YjSzR8YiNdahErUaczA9keTIk2QM2unja4pcOVFFMX4="
							}
							multi_step: {
								hash:       "A27DVM108QE2QLGHH3Q4DM6VMJTMDIB3RHSDH1GTOLJ90IV87RPG===="
								scriptHash: "6KEPCPQDUISQMISMDU4GIGKFCSRO7PG0BG1LC0R8QVJE08REO8I0===="
								steps: [{
									doc:      ""
									cmd:      "cue import basic.proto"
									exitCode: 0
									output:   ""
								}, {
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
									cmd:      "rm basic.cue"
									exitCode: 0
									output:   ""
								}, {
									doc:      ""
									cmd:      "go mod init cue.example"
									exitCode: 0
									output: """
											go: creating new go.mod: module cue.example
											go: to add module requirements and sums:
											\tgo mod tidy

											"""
								}, {
									doc:      "#ellipsis 0"
									cmd:      "go get cuelang.org/go@v0.16.0-alpha.2.0.20260220153551-3dfa50a46189"
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
									doc:      ""
									cmd:      "go run main.go"
									exitCode: 0
									output: """
											// Package basic is rather basic.
											package basic

											// This is my type.
											#MyType: {
											\tstringValue?: string @protobuf(1,string,name=string_value) // Some string value

											\t// A method must start with a capital letter.
											\tmethod?: [...string] @protobuf(2,string)
											\tmethod?: [...=~"^[A-Z]"]
											}


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
