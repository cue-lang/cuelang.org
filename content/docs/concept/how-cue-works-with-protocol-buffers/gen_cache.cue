package site
{
	content: {
		docs: {
			concept: {
				"how-cue-works-with-protocol-buffers": {
					page: {
						cache: {
							code: {
								"cue import basic.proto": "w7CjKYr9Gao8Cjh+8Z2kVncwmKbIWtmvLnlFh+MIqSk="
							}
							upload: {
								"go convert basic.proto": "Dd9J4x8qnWJPeTQMvPf87qw5rKFY9GE9oOu08PC1CJA="
								"basic.proto":            "ZP2MzjSl5WQ7Ut6Y0FS1lPy9E6bKYgV6a64sUoSeeYs="
							}
							multi_step: {
								"1AF9N6T6Q1MTVLRAJ66GBV9HK11O4B3BLTPMJNF5UOP1392SV6H0====": [{
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
									doc:      ""
									cmd:      "go get cuelang.org/go@v0.7.1"
									exitCode: 0
									output: """
											go: added cuelang.org/go v0.7.1

											"""
								}, {
									doc:      ""
									cmd:      "go mod tidy"
									exitCode: 0
									output:   ""
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
