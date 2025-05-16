package site
{
	content: {
		docs: {
			concept: {
				"schema-definition-use-case": {
					page: {
						cache: {
							upload: {
								"api-cue": "OMzxmu6RXuvCmy1p219tBHkPpYwYy1QX/12ReqQWFB0="
								"api-go":  "wjXGepIiB79k0JuMRffw+1ZUI6wq6PYCf4VDfON8014="
							}
							code: {
								"openapi-comparison": "lQAd+MWc3t43fD5K+KPda2B/IUQFIdHa0DWBocuA1kk="
							}
							multi_step: {
								hash:       "SPS4QJ299CJ274KC5KT6VIJV9K534U1J8MIQ719JQJTRI33N1R60===="
								scriptHash: "BDECPDFTSM6C1CTHQKFILD3GB6ATPKJHMTV9VIAH6R68HPUV4920===="
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
									cmd:      "go get cuelang.org/go@v0.13.0-rc.1"
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
									cmd:      "go run honnef.co/go/tools/cmd/staticcheck@v0.6.0 ./..."
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
