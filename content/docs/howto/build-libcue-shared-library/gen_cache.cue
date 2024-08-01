package site
{
	content: {
		docs: {
			howto: {
				"build-libcue-shared-library": {
					page: {
						cache: {
							multi_step: {
								hash:       "JM9E7GV7007B5K2B4LKAR8KT56CBOFKMRO74LGI33CFMJ5DPBH50===="
								scriptHash: "HRGLSP698LP5P3NV1PDJ0DSB2S9PACCBP8FE6KMDKRE3DOTOAP6G===="
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
									cmd:      "export CGO_ENABLED=1"
									exitCode: 0
									output:   ""
								}, {
									doc:      ""
									cmd:      "go version"
									exitCode: 0
									output: """
											go version go1.22.4 linux/amd64

											"""
								}, {
									doc:      ""
									cmd:      "go env CGO_ENABLED"
									exitCode: 0
									output: """
											1

											"""
								}, {
									doc:      ""
									cmd:      "which cc git"
									exitCode: 0
									output: """
											/usr/bin/cc
											/usr/bin/git

											"""
								}, {
									doc:      "#ellipsis 0"
									cmd:      "git clone https://github.com/cue-lang/libcue libcue-source"
									exitCode: 0
									output: """
											...

											"""
								}, {
									doc:      ""
									cmd:      "cd libcue-source"
									exitCode: 0
									output:   ""
								}, {
									doc:      "#ellipsis 0"
									cmd:      "go build -buildmode=c-shared -o libcue.so"
									exitCode: 0
									output: """
											...

											"""
								}, {
									doc:      ""
									cmd:      "cp libcue.so /usr/local/lib/"
									exitCode: 0
									output:   ""
								}]
							}
						}
					}
				}
			}
		}
	}
}
