package site
{
	content: {
		docs: {
			concept: {
				"schema-definition-use-case": {
					page: {
						cache: {
							upload: {
								"api-cue": "KRZxrtE1Z8crdVoUPHNRmwl475rSuzgyRfFy1IOEw18="
								"api-go":  "bCah29L7mPEnorzARFL5ebh+4KuVO1p+fw5d/U2AWs8="
							}
							code: {
								"openapi-comparison": "haSDGTu6VtohwNuUi2Bd+sSouSeHGkESDGafuv9KWQg="
							}
							multi_step: {
								hash:       "I6VA1CETADCBRTKV3ELICTJDPGAAQ9UHSSF7A3FDESEB24CRD8TG===="
								scriptHash: "U9LM83N7DV6EHCAK6GQC24MNH77LA89HM3BMU3C73CAJFATPSRM0===="
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
									cmd:      "go get cuelang.org/go@v0.12.0-0.dev.0.20241211161443-0005c227d164"
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
