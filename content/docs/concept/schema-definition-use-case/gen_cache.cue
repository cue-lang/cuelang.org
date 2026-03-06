package site
{
	content: {
		docs: {
			concept: {
				"schema-definition-use-case": {
					page: {
						cache: {
							upload: {
								"api-cue": "z4G2I/HfLEn1MeF4YX7CZua74U7kBK66QqTc4NdDwF8="
								"api-go":  "5NV6UAbl1M4bl0c0/tmYmHtXAV1ZAPsIv7S6d+qC8dw="
							}
							code: {
								"openapi-comparison": "xr+3X58pXmzB1nHwEHApsDEXqCnSvhatHZyRcoBxGxY="
							}
							multi_step: {
								hash:       "0SL7N43GVK2D5Q24CN7RQ3QFAQCGPT5QN5G1D1CDOTRORPSG2570===="
								scriptHash: "ANMRUA321M5E2054GK9QIN8PLRMC0PUC3MJ3DQUF588J7M78I190===="
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
									cmd:      "go get cuelang.org/go@v0.16.0-rc.1.0.20260306143617-9147ea2b06d9"
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
