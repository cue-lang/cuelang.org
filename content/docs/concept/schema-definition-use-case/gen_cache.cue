package site
{
	content: {
		docs: {
			concept: {
				"schema-definition-use-case": {
					page: {
						cache: {
							upload: {
								"api-cue": "yjQzXGEZDjODRKhvqs8a16PptyXlJcoLko/JDSdwE50="
								"api-go":  "xQKEzBwvBX5zBl/bb6yK5ksHGMHTJY8fVpf+E4IMMcY="
							}
							code: {
								"openapi-comparison": "jEtnNbOLqyUgf3X+Rm9Q9MaSDhX4QBk6hFAPnZgZqc0="
							}
							multi_step: {
								hash:       "VC9SAUK883HDLOH2QL6SE6UQ6I11V4THSITB3P8E37F4M0R3PVRG===="
								scriptHash: "V0N64C1JC5R70QH5TM9SC74TQDF98AUN3TILHP8858HSDRKGQF20===="
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
									cmd:      "go get cuelang.org/go@v0.16.0-rc.1.0.20260314205741-820e1530e9ff"
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
