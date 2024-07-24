package site
{
	content: {
		docs: {
			concept: {
				"schema-definition-use-case": {
					page: {
						cache: {
							upload: {
								"api-cue": "E/fxZ7l3EB+9rPnipjsJ3Z39AAWnbM2+4E2Dv8ZR9QI="
								"api-go":  "2R2AOsCfK2cxgcbgn+zkZtMDn66Z9AzUBMfotbh2YiE="
							}
							code: {
								"openapi-comparison": "kElvwCkLDvW8QmnEFucEh1dnFRs84UtJnPUAXInYR5o="
							}
							multi_step: {
								hash:       "CBC831QMPT6NBFNUOF97GH4A8QNNM5AAQ32ENIPLHS6NQ7U58L30===="
								scriptHash: "D4HLH44BEJR50DNSD7NUB8A2D7ES4FUBP5MLKN322RH0GV3PF2N0===="
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
									cmd:      "go get cuelang.org/go@v0.9.2"
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
