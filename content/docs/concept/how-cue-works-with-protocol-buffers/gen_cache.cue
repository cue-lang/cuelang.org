package site
{
	content: {
		docs: {
			concept: {
				"how-cue-works-with-protocol-buffers": {
					page: {
						cache: {
							code: {
								"cue import basic.proto": "l3ANJiQdlT+LUEHgE6BlvnGhyOsWbnOCzEom4QRxYes="
							}
							upload: {
								"go convert basic.proto": "Xmmc9mYzcpxsJEjqzZiaj5OtA6LJ/iHBa4l91Dgw7gY="
								"basic.proto":            "/nxfLF2le/SymTv8F2Y4lq57nGoVjw3Y9OUa+rc+y8k="
							}
							multi_step: {
								"NIEKSBI4T1BL9H5R11T47L3A07VI0FH23FAKVLM1SRTAE597K8A0====": [{
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
