package site
{
	content: {
		docs: {
			concept: {
				"how-cue-works-with-protocol-buffers": {
					page: {
						cache: {
							upload: {
								"basic.proto":            "gAEDmRDqDcheR5fS6j3vEBAgltIEu2V/YtXCjhHZlAo="
								"basic.cue":              "UgQq7epZKjtgfKwslzueFFRzhIScM2cCxDAjlwgSmlU="
								"go convert basic.proto": "2bKyj71yZejtI0mT/j1DOKObybrFkACoIG5MDXb8PzM="
							}
							multi_step: {
								hash:       "VMBNMF0UO3B5PVJGU1D1T9GL5JFFM3I7O2SO8SHHVM3O1EKJQN9G===="
								scriptHash: "72E41OE75TT61ICPGBQLDVKJ351O5OMUF2OGME7UMJLV8N3K0BH0===="
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
									cmd:      "go get cuelang.org/go@v0.19.0-0.dev.0.20261127222705-d53722b2b9cd"
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
