package site
{
	content: {
		docs: {
			concept: {
				"how-cue-works-with-go": {
					page: {
						cache: {
							upload: {
								"cue get go - main cue":      "e64QUifGNmAWCYlIf4CJMo9Y7u44wtsfC4V7PeZQnUg="
								"load cue - cue data":        "8AaqJOcqmq7OV16TlyVrEplN+GnrTzHrLxpuUaXogRo="
								"load cue - main.go":         "HvmOYyQ3tbyYI2Iu3fky8zivryelPyXUqzLK1B1zxjw="
								"load non-cue - main.go":     "JrKW1FkKVLH86qjEVURkGGb+OENRwfMxvAfmPLppvzE="
								"load non-cue - yaml file":   "nvkOkHiMDYIFNSTDsfqSVllX2zmvTUTcNcD23MYliTo="
								"check go data - cue schema": "XdQ1PV4FEJO5ngPwF3UknjavUsLXoNyZrDqM3eZ9Gek="
								"check go data - main.go":    "IAsVFuB4aaodFrG8cCC9jNn5xoMHVsyNwqi90JE30xw="
							}
							multi_step: {
								"JS1Q035L7JU9O13AJ576PEOQ2CFHT22O65K4RTTVNNK6OUMSM090====": [{
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
									exitCode: 0
									output: """
											✅ Person: ok

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
