package site
{
	content: {
		docs: {
			concept: {
				"how-cue-works-with-go": {
					page: {
						cache: {
							upload: {
								"main cue":               "0OudwH05o/HtHVYBFXuAgym/m4wqkXvUYZH8vwQ64AI="
								"cue load sample cue":    "fUTPj6dlZeHXES+mhgKYZFBwan6hsgwnfPfn1YpDJp8="
								"load cue main":          "njtSB/qgO97BMRiiDWbnmvsRb41Tt+LIRAlE39W0zgo="
								"load non cue yaml file": "NfFy3yoKstuL70LPczkPBHMC8M1xqgoeciZAwBHslmI="
								"load non cue main":      "tzj5ORkalmvW0Zio7WDD5ij8vpXY6uPhRb6uJYg6H3A="
								"checking go schema CUE": "0vR4f+u/qBaP++egsen44BnAZu7vXVxisTIdBaSIg8E="
								"checking go main":       "XZxp+AMTd0mZdBrS1Zao+HuU+0uncz8NOezJx3j2QhU="
							}
							multi_step: {
								"QVQ1QVPIT27CUAIPA81FBUFTH29CV2DKT5RMT9HUP6EDJ60KQLV0====": [{
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
									doc:      ""
									cmd:      "env"
									exitCode: 0
									output: """
											USER_UID=1000
											HOSTNAME=c7368e30214b
											PWD=/home/runner
											USER_GID=1000
											HOME=/home/runner
											GOLANG_VERSION=1.22.1
											GOMODCACHE=/caches/gomodcache
											TERM=dumb
											CUELANG_CUE_LATEST=v0.8.0
											CUELANG_CUE_PRERELEASE=v0.8.0
											SHLVL=1
											GOTOOLCHAIN=local
											GOCACHE=/caches/gobuild
											NO_COLOR=true
											LC_ALL=C
											CUELANG_CUE_TIP=v0.8.0
											PATH=/cues/prerelease:/go/bin:/usr/local/go/bin:/usr/local/bin:/usr/bin:/bin:/usr/local/games:/usr/games
											OLDPWD=/
											GOPATH=/go
											_=/usr/bin/env

											"""
								}, {
									doc:      ""
									cmd:      "ls cue.mod/gen/k8s.io"
									exitCode: 0
									output: """
											api  apimachinery

											"""
								}, {
									doc:      ""
									cmd:      "cue eval ."
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
											Your YAML was ok!

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
											Your Person was ok!

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
