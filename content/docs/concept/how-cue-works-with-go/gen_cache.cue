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
								"load non-cue - main.go":     "STFeJM9eArxRG5zFFXSe8SBJs9vuv1xDhTvQobyCa4w="
								"load non-cue - yaml file":   "lcJGNhxMWC2kEZFpQpErdblFoFyV0aJbYL3QhS4SJhY="
								"check go data - cue schema": "ehVnPzKB7nzvkRvH7wW/yMknz/uHB6AmzcVjaWKGelc="
								"check go data - main.go":    "m6Lw6o6zp7/XQ/evetyu1HuT1bSbA8tmvg9lDl9i8pE="
							}
							multi_step: {
								hash:       "E8COA6UMFHK69C3LDQ72P5CUSR4NAM3UD6PRQFIUK6493F16JTE0===="
								scriptHash: "R1EG55CGKL4TCRO2ODM8MM3OISP5P73O31N695VBBUOCQD3F57G0===="
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
											main.go:34: #Person.age: invalid value 999 (out of bound <=150)
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
