package site
{
	content: {
		docs: {
			tutorial: {
				"loading-cue-go-api": {
					page: {
						cache: {
							upload: {
								"initial cue code": "B/Nks85R8KJjjkgtsygIFP6fwJaljfF/Ch3lm8bRR/E="
								"initial go code":  "A5XQR7RNOyl1v7R+WqGcUsfFac9Pu+V9/A3TG3A2Xkc="
							}
							multi_step: {
								hash:       "P9QQDGGCS1RLABIPF5EN6185FBDC04BKIR6J9CT0KVVHLOVKJDGG===="
								scriptHash: "7CCVVOVSRA7FI8SETPCI58RGGTKAFB2E3DFLQBVVEOLOI6M0LPNG===="
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
									doc:      "#ellipsis 1"
									cmd:      "cue version"
									exitCode: 0
									output: """
											cue version v0.19.0-0.dev.0.20261119142547-4feb85fac20e
											...

											"""
								}, {
									doc:      ""
									cmd:      "go version"
									exitCode: 0
									output: """
											go version go1.26.4 linux/amd64

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
									cmd:      "go get cuelang.org/go@v0.19.0-0.dev.0.20261119142547-4feb85fac20e"
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
