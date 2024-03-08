package site
{
	content: {
		docs: {
			concept: {
				"how-cue-works-with-go": {
					page: {
						cache: {
							upload: {
								"cue get go - main cue":      "zN6Z39l9FiOqfYrpjNBPDxRdUuJyYSipKhLsLX/FaDQ="
								"load cue - cue data":        "aPncsBCB9fv0LCyPt0cki7lMNXPOds3/85uEcrHZSkw="
								"load cue - main.go":         "ftjQj4d/TSow5dP/Fzw2aEHcSyN+UFjDl82/21f87Jo="
								"load non-cue - main.go":     "16i4oId9mDqiClq3IWJBpw9ZD60CGVV0xsq/BOYmAtQ="
								"load non-cue - yaml file":   "jkNmUH1ZSIBol5ZK+FyIGjBxjvhnIBYiHiKIEECJOGk="
								"check go data - cue schema": "gNyzzAKLFdCC1oSe4Tv5bb21/LG16KwMJgkD7lk36R8="
								"check go data - main.go":    "QKXI3Bb32POBpOSPKEwvQV4HZ/11rVIRI1tJBPXcxnU="
							}
							multi_step: {
								"C8SPJR9V8VVHGP1MB6R95H5Q24JL034KP2074FE6G4GPE0NB6DVG====": [{
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
