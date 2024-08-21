package site
{
	content: {
		docs: {
			concept: {
				"schema-definition-use-case": {
					page: {
						cache: {
							upload: {
								"api-cue": "M0/Hce/hDJ45oBuDF5MQzJs58Tor2+cg6o+eolqr6+c="
								"api-go":  "cppXDc0FKtg58T3gdmoCby1fp7tCTTz1/Pp/6Q09nxM="
							}
							code: {
								"openapi-comparison": "ZCU+gGTnZ1qikIPlJ11NjAXxTe+PKH9E13Lde6UPK8Q="
							}
							multi_step: {
								hash:       "0EPV1HG7SPVSFARMMOG1UD4BLGO4D9M3QJLH6DM4K9OT5EOQ0HLG===="
								scriptHash: "JMSVRRQ6P7ES1AAL0R2TU9L5SC3R20GQ01U30OJLDQ72L80AJ9HG===="
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
