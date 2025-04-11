package site
{
	content: {
		docs: {
			concept: {
				"how-cue-works-with-go": {
					page: {
						cache: {
							upload: {
								"cue get go - main cue":      "RgG/JdsBzutFJLbIFxCcdQdL42YWd1gRb8vtLN6Ed3w="
								"load cue - cue data":        "hYzCqwr0smBpV5buv043Sx27SJvYUzJsC1eag65t/Xg="
								"load cue - main.go":         "7v/dfPXwADJ86tLgFdOV9Zfic6nPctJuYuOaryrtIsA="
								"load non-cue - main.go":     "oB/VrDtXppN6h98iE5UYvBTvuMZPrywhCwVCDDCphLg="
								"load non-cue - yaml file":   "5zXJ7cnFsWP5kJ3U6Djf4je51sQhgqvdQXg6+VdfeHY="
								"check go data - cue schema": "bqyZMVg36QfyQCbINBuT7hhX0Rr1x8hj85POv4F2cms="
								"check go data - main.go":    "M5G2QWqekHm1lnoMe3812AhhMfgT932mrDfAjZf7rJI="
							}
							multi_step: {
								hash:       "VGJAVELCJPCE5SETVSEU49F7UMVRV3983LBADMK4K833A7L6KOL0===="
								scriptHash: "4IP76BJE4UM7CO8404BQJFMVHEB652IP7R7CU14PIL59JO7TFC2G===="
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
									cmd:      "go get cuelang.org/go@v0.13.0-alpha.3.0.20250411164907-08c3542c9d96"
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
									cmd:      "go vet ./..."
									exitCode: 0
									output:   ""
								}, {
									doc:      "#ellipsis 0"
									cmd:      "go run honnef.co/go/tools/cmd/staticcheck@v0.6.0 ./..."
									exitCode: 0
									output: """
											...

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
									cmd:      "go get cuelang.org/go@v0.13.0-alpha.3.0.20250411164907-08c3542c9d96"
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
									cmd:      "go vet ./..."
									exitCode: 0
									output:   ""
								}, {
									doc:      "#ellipsis 0"
									cmd:      "go run honnef.co/go/tools/cmd/staticcheck@v0.6.0 ./..."
									exitCode: 0
									output: """
											...

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
									cmd:      "go get cuelang.org/go@v0.13.0-alpha.3.0.20250411164907-08c3542c9d96"
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
											#Person.age: invalid value 999 (out of bound <=150)
											exit status 1

											"""
								}, {
									doc:      ""
									cmd:      "go vet ./..."
									exitCode: 0
									output:   ""
								}, {
									doc:      "#ellipsis 0"
									cmd:      "go run honnef.co/go/tools/cmd/staticcheck@v0.6.0 ./..."
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
