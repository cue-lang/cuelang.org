package site
{
	content: {
		docs: {
			concept: {
				"schema-definition-use-case": {
					page: {
						cache: {
							upload: {
								"api-cue": "/3kDmUYg0Y6YnLW8ntqml6XzdhFhg1hxqX9Q4f7iDt4="
								"api-go":  "AqXAglPO4MQx7Lw97BRN3oGxckV4CQKmInuc59jpO/U="
							}
							code: {
								"openapi-comparison": "1VEUzhiIyIG2jQkbzgRKn/DOAKgIP6Ri6VwKNDwXQ0E="
							}
							multi_step: {
								hash:       "NO0F77J0872TD0C512NNG1QRHUQGIB6V8064VB6I7GPNF1F3MV4G===="
								scriptHash: "75QSFJVNR7V1VOFSNU4IH01E0074E3DK32O9TE0HT9K7G6NVKDS0===="
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
									cmd:      "export STATICCHECK_CACHE=/caches/staticcheck"
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
									cmd:      "go get cuelang.org/go@v0.15.0-0.dev.0.20250829194412-e2b9c0d6d714"
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
