package site
{
	content: {
		docs: {
			howto: {
				"place-data-go-api": {
					page: {
						cache: {
							upload: {
								"initial cue code": "DVY8RS2Zpg+9RPbZ+4P2U855ZmrjU0ncO9laGT9DSw8="
								"go program":       "P2uV7ytdt5mMEEpd2Y+Zlv1LciQDWTPCUw/qXoLW0Dg="
							}
							multi_step: {
								hash:       "MUDK3VDCAT9D5HFRDVC7KD0TFSHCESLV35US4VV492C2EV5C40OG===="
								scriptHash: "5Q42779TL5FFM0HKI52EDB7VL9JS1LTO7FRLUL6PKQHBPESF6VS0===="
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
									doc:      ""
									cmd:      "cue mod init cue.example"
									exitCode: 0
									output:   ""
								}, {
									doc:      "#ellipsis 0"
									cmd:      "go mod init go.example"
									exitCode: 0
									output: """
											...

											"""
								}, {
									doc:      ""
									cmd:      "cue export . input.json --path input: -e output --out text"
									exitCode: 0
									output: """
											Hello, Charlie!
											How's the weather in your part of the world?

											"""
								}, {
									doc:      "#ellipsis 0"
									cmd:      "go get cuelang.org/go@v0.15.0-alpha.3.0.20251025133102-654b5c06c385"
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
											Hello, Charlie!
											How's the weather in your part of the world?

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
