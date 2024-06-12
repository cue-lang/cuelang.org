package site
{
	content: {
		docs: {
			concept: {
				"how-cue-works-with-protocol-buffers": {
					page: {
						cache: {
							upload: {
								"basic.proto":            "NKgsoixhZFptYdjVe7vJgdjCKJlGrRXGdT1BF92we94="
								"basic.cue":              "bkF/XFhz3CKWmuntuooihDvTWMnGzoO9XSSBURYAoHQ="
								"go convert basic.proto": "GK4j99DXyQSvGZJkBTghK4d9+9H41zeShnq/M8GZ6j8="
							}
							multi_step: {
								hash:       "MFQL6G4PQKALDFAT5CFF99ULCK8CDBFM5R0H9MHHE1CKPVLDTQBG===="
								scriptHash: "AC9JPEDHKT3CV7OI3FLTG9I7JOMA9OS95S4QDDVMS1MGR8HA3GE0===="
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
									cmd:      "go get cuelang.org/go@v0.9.1"
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
