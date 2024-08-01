package site
{
	content: {
		docs: {
			howto: {
				"build-libcue-shared-library": {
					page: {
						cache: {
							multi_step: {
								hash:       "P7VGQJF3GSF8668POO6IQ1STKMLHPKB2TD60N2UKM34KU3K2KVJ0===="
								scriptHash: "Q3GH7VENPOHDBIS0CS8J4TN41M1LP8KGKSPTG63DINBM8NPD21EG===="
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
