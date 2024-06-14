package site
{
	content: {
		docs: {
			concept: {
				"schema-definition-use-case": {
					page: {
						cache: {
							upload: {
								"api-cue": "qvVqxvODesmwpfhFTlXoSQqJELJSET9wmS1VvEhNS94="
								"api-go":  "P9YmFcoAUPSJ8It9Lpcnfq/lxoxTuGdaNgUwPAfd5q8="
							}
							code: {
								"openapi-comparison": "Ou2GXRzXHGqQ5skxJxc/mTs+oKVVh0ZaExvYQclLpN0="
							}
							multi_step: {
								hash:       "OJC9B8V8KMISI1L5BUH4N39IDFEPVKN59EC3SC8EAOFCE6TU70O0===="
								scriptHash: "VUJOCIFJURRIDJUV3GER6IIDP9RVAGCC3OFCDIK417UICUES34SG===="
								steps: [{
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
									doc:      "#ellipsis 0"
									cmd:      "go get cuelang.org/go@v0.9.1"
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
											V2 is backwards compatible with V1: true
											V3 is backwards compatible with V2: false

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
