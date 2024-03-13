package site
{
	content: {
		docs: {
			concept: {
				"how-cue-works-with-protocol-buffers": {
					page: {
						cache: {
							upload: {
								"basic.proto":            "z+QyiWN5Ej4Yb0rW51g2U7VWzL6dpivaWkIlm+SpBpc="
								"basic.cue":              "m0YBc+/vapq/Y7ZK2wifkPIyUUY72hMbsBRgJ9OLMkw="
								"go convert basic.proto": "zmTxY9kiOMR77tRwH7QuhGoe79/0QLGU5FV+j+WIU5I="
							}
							multi_step: {
								hash:       "SEFMCKMQ2RLAVFVI0PGM8HD14FSLFDG3LKT44OTGD8TQQBGLLN80===="
								scriptHash: "N5JURFTMSA5OGAMIPO7DFUVQR0AT92RG3JLI3K8URQBGV30B8SQ0===="
								steps: [{
									doc:      ""
									cmd:      "cue import basic.proto"
									exitCode: 0
									output:   ""
								}, {
									doc:      ""
									cmd:      "mv basic.cue .basic.cue"
									exitCode: 0
									output:   ""
								}, {
									doc:      ""
									cmd:      "diff basic.cue .basic.cue"
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
									cmd:      "rm basic.cue .basic.cue"
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
									cmd:      "go get cuelang.org/go@v0.8.0"
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
								}]
							}
						}
					}
				}
			}
		}
	}
}
