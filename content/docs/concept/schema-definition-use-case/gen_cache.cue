package site
{
	content: {
		docs: {
			concept: {
				"schema-definition-use-case": {
					page: {
						cache: {
							upload: {
								"api-cue": "i2w3Au7zzHMozJq15MfqB77kfL76mrZPZmZt6ikx1tI="
								"api-go":  "A3ydQfuDwd8u7F4EoeBIKA1OQS89zgxlliiCYxjkGNQ="
							}
							code: {
								"openapi-comparison": "RSIHk7zRVmwQb0MHlfuKrdaC0tk0UHCtUmo79ZGA8x4="
							}
							multi_step: {
								hash:       "H18OQCM60ADKJULDA006B86B21LUMPVTMU56C9L7C0F6EMG1KP8G===="
								scriptHash: "V0AAELIOI6TT56E92KN0QRHGKACJGPR2ADHCE3D0CDKC24R0ELT0===="
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
									cmd:      "go get cuelang.org/go@v0.10.1"
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
									cmd:      "go run honnef.co/go/tools/cmd/staticcheck@v0.5.1 ./..."
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
