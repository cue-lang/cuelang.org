package site
{
	content: {
		docs: {
			concept: {
				"schema-definition-use-case": {
					page: {
						cache: {
							upload: {
								"api-cue": "iOzqPK+tHWNdRi36Yd5VQiMXudlV8Zp7hh4etK0OM9Q="
								"api-go":  "yEObxy8Gcna5Eq1XGO0WlqD5ySP0mA+y9skqSgvfK0g="
							}
							code: {
								"openapi-comparison": "vwAfe1xoNPDjh1zXxr3JXiwM8qwB1EAEayrMvT0gOGY="
							}
							multi_step: {
								hash:       "7F0LDLKIUE447DKC2T9TV2AJV6OJT4OBL433S2K3M7PPCI1929M0===="
								scriptHash: "1HNBPCOUQM747Q3V4JANIVDVT0FF9QHRJQIM6E837OKL8LE7M3L0===="
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
									cmd:      "go get cuelang.org/go@v0.15.0-0.dev.0.20250905161001-20531e1837bf"
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
