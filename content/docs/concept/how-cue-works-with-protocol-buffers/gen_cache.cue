package site
{
	content: {
		docs: {
			concept: {
				"how-cue-works-with-protocol-buffers": {
					page: {
						cache: {
							code: {
								"cue import basic.proto": "s77VCnZkL8Ob+GN1KG7Qa9IKwZFvqbSQ8iuXTU5Vm9c="
							}
							upload: {
								"go convert basic.proto": "CQs3X6v2JVn7Qm04lpWWVc58cJ4r41MFN2uBbMETy5Q="
								"basic.proto":            "vd/2fXkSJvAkgbX4Kc2lvd8YCOQJNOVdmrzrKMSdJfw="
							}
							multi_step: {
								"32SCPPED6C8KHN11B7U42O3NHGJAHOEGT1PU4OL7E4KSFKMD06O0====": [{
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
									cmd:      "go mod init cue.example"
									exitCode: 0
									output: """
											go: creating new go.mod: module cue.example
											go: to add module requirements and sums:
											\tgo mod tidy

											"""
								}, {
									doc:      "#ellipsis 0"
									cmd:      "go get cuelang.org/go@v0.7.1"
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
