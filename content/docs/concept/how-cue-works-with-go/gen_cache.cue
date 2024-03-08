package site
{
	content: {
		docs: {
			concept: {
				"how-cue-works-with-go": {
					page: {
						cache: {
							upload: {
								"cue get go - main cue":      "qYHVXJOwTD28sYeSZK0XowkVna7WTKz9qya4oAyRT0A="
								"load cue - cue data":        "K5rowKmZNfCz5g5qGuzJps+ZhuMgvQB5KDyaxdfnes8="
								"load cue - main.go":         "Wdmj+uc7L1hWttkHAGexzo2jQUqIQ8aT1l6by8VcKCk="
								"load non-cue - main.go":     "JNsA8R8jGSY2yF/BzYYinXFoSp/CtRjGKquZF0arACc="
								"load non-cue - yaml file":   "lcJGNhxMWC2kEZFpQpErdblFoFyV0aJbYL3QhS4SJhY="
								"check go data - cue schema": "g6fHVpyc5YhxG9dCoU7IY8sIPqij4rYU9bvw/4iXQfU="
								"check go data - main.go":    "+hZ+beBb6rCl7ii/xUXdZt927WeklAM6iXKp/ah9+qo="
							}
							multi_step: {
								hash:       "VQE5BBEN6NCB3FIR2MS09VODGELRFG7DG3TEU2UVUK7NSVGNMPV0===="
								scriptHash: "8E4BAIUM2TB4OBH19OK98J9HR7E4RQ2IP4FDBAAASRU85CJSUVIG===="
								steps: [{
									doc:      ""
									cmd:      "export LC_ALL=C"
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
									cmd:      "rm -rf $HOME/*"
									exitCode: 0
									output:   ""
								}, {
									doc:      ""
									cmd:      "cue mod init cue.example"
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
									cmd:      "go get k8s.io/api/apps/v1@v0.29.3"
									exitCode: 0
									output: """
											...

											"""
								}, {
									doc:      ""
									cmd:      "cue get go k8s.io/api/apps/v1"
									exitCode: 0
									output:   ""
								}, {
									doc:      "#ellipsis 20"
									cmd:      "tree cue.mod/gen/k8s.io"
									exitCode: 0
									output: """
											cue.mod/gen/k8s.io
											|-- api
											|   |-- apps
											|   |   `-- v1
											|   |       |-- register_go_gen.cue
											|   |       `-- types_go_gen.cue
											|   `-- core
											|       `-- v1
											|           |-- annotation_key_constants_go_gen.cue
											|           |-- doc_go_gen.cue
											|           |-- register_go_gen.cue
											|           |-- types_go_gen.cue
											|           |-- well_known_labels_go_gen.cue
											|           `-- well_known_taints_go_gen.cue
											`-- apimachinery
											    `-- pkg
											        |-- api
											        |   `-- resource
											        |       |-- amount_go_gen.cue
											        |       |-- math_go_gen.cue
											...

											"""
								}, {
									doc:      ""
									cmd:      "cue eval"
									exitCode: 0
									output: """
											service: {}
											deployment: {}
											daemonSet: {}
											statefulSet: {}

											"""
								}, {
									doc:      ""
									cmd:      "rm -rf $HOME/*"
									exitCode: 0
									output:   ""
								}, {
									doc:      ""
									cmd:      "go mod init cue.example"
									exitCode: 0
									output: """
											go: creating new go.mod: module cue.example

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
									cmd:      "go run ."
									exitCode: 0
									output: """
											{
											\tl: [1, 2, 3]
											\tv: "hello"
											\tmessage: {
											\t\thello: "world!"
											\t}
											}

											"""
								}, {
									doc:      ""
									cmd:      "rm -rf $HOME/*"
									exitCode: 0
									output:   ""
								}, {
									doc:      ""
									cmd:      "go mod init cue.example"
									exitCode: 0
									output: """
											go: creating new go.mod: module cue.example

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
									cmd:      "go run ."
									exitCode: 0
									output: """
											✅ YAML: ok

											"""
								}, {
									doc:      ""
									cmd:      "rm -rf $HOME/*"
									exitCode: 0
									output:   ""
								}, {
									doc:      ""
									cmd:      "go mod init cue.example"
									exitCode: 0
									output: """
											go: creating new go.mod: module cue.example

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
									cmd:      "go run ."
									exitCode: 1
									output: """
											❌ Person: NOT ok
											main.go:37: #person.age: invalid value 999 (out of bound <=150)
											exit status 1

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
