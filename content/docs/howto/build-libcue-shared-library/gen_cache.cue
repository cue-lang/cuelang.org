package site
{
	content: {
		docs: {
			howto: {
				"build-libcue-shared-library": {
					page: {
						cache: {
							multi_step: {
								hash:       "5J2PRU8IGTBF4PQJU46OU2ACNNHHUEP6THRCQO3B2U4D6VD5MA60===="
								scriptHash: "PQ9E3ADC3Q25J0DVM5DHFDQNDJUGNGNFJN4RRPCO1A7BK6J191OG===="
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
											go version go1.24.0 linux/amd64

											"""
								}, {
									doc:      ""
									cmd:      "go env CGO_ENABLED"
									exitCode: 0
									output: """
											1

											"""
								}, {
									doc:      "#ellipsis 1"
									cmd:      "cc --version"
									exitCode: 0
									output: """
											cc (Debian 12.2.0-14) 12.2.0
											...

											"""
								}, {
									doc:      ""
									cmd:      "git --version"
									exitCode: 0
									output: """
											git version 2.39.5

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
									doc:      "#ellipsis 1"
									cmd:      "git checkout 1c861cc9cdc5584f5d26b0a7112aa2afee74d4cf"
									exitCode: 0
									output: """
											Note: switching to '1c861cc9cdc5584f5d26b0a7112aa2afee74d4cf'.
											...

											"""
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
