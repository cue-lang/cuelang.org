package site
{
	content: {
		docs: {
			concept: {
				"how-cue-works-with-go": {
					page: {
						cache: {
							upload: {
								"cue get go - main cue":      "SWQhSvAASKCFIu/+8hVb5IKvMZc0F5r9MRN80DxYQlw="
								"load cue - cue data":        "EoMT8T5PP0Y4yoINL3D7BZUACbKOGNls3KyPVTjK3iE="
								"load cue - main.go":         "v/iSHKUbtn6m1HDjCLrlTWkI4ItX5VwfS00uPQ+WEUk="
								"load non-cue - main.go":     "f19/dC5niXMTaL+MZJ4kfyF5sTvYB3dZcfSb0706FKI="
								"load non-cue - yaml file":   "88fDIpaVMda6kPedniL7gOKcYXr2Aw5bcsVlimT+oWA="
								"check go data - cue schema": "v/CWE9UNgsnO5cBuE6bkBJYoPOcwiVkp6IFFW9h8CK0="
								"check go data - main.go":    "uJ+xWYZRj7+TFLFfkUhjbTeu/9zYXazNirKD4ayGW68="
							}
							multi_step: {
								hash:       "LMC04LOBD9N8PFD521JOI8SPTJG26QEUCN5CC4BTTVBGADQ3F99G===="
								scriptHash: "1O5FLEU3HMHAO73UFG6MLD6S1DB9L7B5A61D46KAODRDQRKKV58G===="
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
									doc:      "#ellipsis 13"
									cmd:      "tree -d cue.mod/gen/k8s.io"
									exitCode: 0
									output: """
											cue.mod/gen/k8s.io
											|-- api
											|   |-- apps
											|   |   `-- v1
											|   `-- core
											|       `-- v1
											`-- apimachinery
											    `-- pkg
											        |-- api
											        |   `-- resource
											        |-- apis
											        |   `-- meta
											        |       `-- v1
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
									cmd:      "go get cuelang.org/go@v0.10.0"
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
									cmd:      "go get cuelang.org/go@v0.10.0"
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
									cmd:      "go get cuelang.org/go@v0.10.0"
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
