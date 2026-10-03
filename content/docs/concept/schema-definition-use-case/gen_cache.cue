package site
{
	content: {
		docs: {
			concept: {
				"schema-definition-use-case": {
					page: {
						cache: {
							upload: {
								"api-cue": "3zWn/IrybSOhnAGhw1cFmRC5GpI7ao9gEApB752XRwY="
								"api-go":  "W6BSLWlQkFXTXiXsqem6iQPix3QWslvZRI9qmDqt2LE="
							}
							code: {
								"openapi-comparison": "8YaYiD8pISLN3QyXj+Ns9a3FFwpZy7vE9U1u6UudC7s="
							}
							multi_step: {
								hash:       "1L56FKUV2OSBGQIU9TI2DVQAC1D8SB72RPISHM92HJVTUQDJJR6G===="
								scriptHash: "Q3NLQEMQTT40LV8V6BKG3PCSG39GKNVCN5A0EF14H2ISUQ0P27SG===="
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
									cmd:      "go get cuelang.org/go@v0.18.0-alpha.2.0.20261002131943-93402de82790"
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
