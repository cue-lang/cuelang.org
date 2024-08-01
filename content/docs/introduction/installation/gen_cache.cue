package site
{
	content: {
		docs: {
			introduction: {
				installation: {
					page: {
						cache: {
							multi_step: {
								hash:       "VJ1U02HF2SJMBM5BENU4T7C1C0HFRMTS4G091S8F79SVC80SJRVG===="
								scriptHash: "D37M5I4CC9UQ54DHIBSQ5TTE5SQT8FQRIFIR5UV0EUS1PEIFG7QG===="
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
									doc:      "#ellipsis 0"
									cmd:      "go install cuelang.org/go/cmd/cue@latest"
									exitCode: 0
									output: """
											...

											"""
								}, {
									doc:      ""
									cmd:      "go mod init go.example"
									exitCode: 0
									output: """
											go: creating new go.mod: module go.example

											"""
								}, {
									doc:      "#ellipsis 0"
									cmd:      "go get cuelang.org/go@latest"
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
