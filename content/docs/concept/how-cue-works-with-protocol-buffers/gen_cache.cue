package site
{
	content: {
		docs: {
			concept: {
				"how-cue-works-with-protocol-buffers": {
					page: {
						cache: {
							upload: {
								"basic.proto":            "i4rkoKgnsDZe9BIUN4xPqMcz4TZbF2A0UTK5F7aVNYQ="
								"basic.cue":              "gFMddh0GetaNiLvsnb/gKNCC/yJybUC+9QBKGMNZRnk="
								"go convert basic.proto": "XmZpTrYzKfGZyHeBzDUQRjbQdSb/VTxkcMM3s30LdBc="
							}
							multi_step: {
								hash:       "S27I5D96CTKKKE4BVHP6B178I366G2KCGNEQ1B3E8J053DER3UNG===="
								scriptHash: "P6631IO6K3MALBL8QQ4Q1KL6JKIS272IG4QMQO8H51UUTB7MC4L0===="
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
									cmd:      "go get cuelang.org/go@v0.9.0-alpha.3"
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
