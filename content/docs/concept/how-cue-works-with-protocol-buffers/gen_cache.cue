package site
{
	content: {
		docs: {
			concept: {
				"how-cue-works-with-protocol-buffers": {
					page: {
						cache: {
							upload: {
								"basic.proto":            "78LAfdGuOVkcoERmNliZew22kj+TlNnwP/7sAlZDWaY="
								"basic.cue":              "H23ugJLR0Dt/2ngWbmWxZRnKhrjFTLndE3Lu6OoqnE8="
								"go convert basic.proto": "091PYDWm8nhvqAmaLh5Y9mNl0+qDgiSr8CLMQDCoSKg="
							}
							multi_step: {
								hash:       "7JQ5I535D7D0BPR790RV9NJFVAHRJ4S3506KQUQ1EHFB585RT78G===="
								scriptHash: "KHJBL5K76TCVK56P7S5ATNODALOHNG4NBF90K8CB189U6LVF3KAG===="
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
									cmd:      "go get cuelang.org/go@v0.16.1"
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
