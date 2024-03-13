package site
{
	content: {
		docs: {
			concept: {
				"how-cue-works-with-protocol-buffers": {
					page: {
						cache: {
							upload: {
								"basic.proto":            "CbBjRJvsiwE9phibMLxjtZwRL7EXpyd4vJCT0dnPwM4="
								"basic.cue":              "qBgVACczCS0YG9ZpiAPj0xO7HGBQZ9orOVWu1XxkTcs="
								"go convert basic.proto": "VQ/HbHwgKieUuHnv/6C3dTUnfu/3dqgipxG3vpH/SFo="
							}
							multi_step: {
								"60LEO027E12VSKFNP4MFQ21PT22TB4ILJ00MPHI0TCOU8L23QE80====": [{
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
