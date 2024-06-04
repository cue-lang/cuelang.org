package site
{
	content: {
		docs: {
			tutorial: {
				"loading-cue-go-api": {
					page: {
						cache: {
							upload: {
								"initial cue code": "2KkVVdQIMI+dk5wvxb8VLta+qfVZ7ofYQRpFwF42wSs="
								"initial go code":  "TsLrrQ3wMLlbGhEAuDsdi9eLIaY4lekSzssNKRoXZAE="
							}
							multi_step: {
								hash:       "KOHFL8KUS14JUG74C8LBPRBAF8K8DFF9TL5P9SK31PKPVHEDTLAG===="
								scriptHash: "G7MA64NNUFUS5CSPACV7CB2PD02D1LTE6FPVRJLNKQQKGJUQEGU0===="
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
									doc:      "#ellipsis 1"
									cmd:      "cue version"
									exitCode: 0
									output: """
											cue version v0.9.0-rc.1
											...

											"""
								}, {
									doc:      ""
									cmd:      "go version"
									exitCode: 0
									output: """
											go version go1.22.3 linux/amd64

											"""
								}, {
									doc:      ""
									cmd:      "cue mod init company.example/configuration"
									exitCode: 0
									output:   ""
								}, {
									doc:      ""
									cmd:      "cue export"
									exitCode: 0
									output: """
											{
											    "output": "Hello Joe",
											    "name": "Joe"
											}

											"""
								}, {
									doc:      "#ellipsis 0"
									cmd:      "go mod init company.example/configuration"
									exitCode: 0
									output: """
											...

											"""
								}, {
									doc:      "#ellipsis 0"
									cmd:      "go get cuelang.org/go@v0.8.2"
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
											"Hello Joe"

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
