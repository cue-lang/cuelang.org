package site
{
	content: {
		docs: {
			howto: {
				"place-data-go-api": {
					page: {
						cache: {
							upload: {
								"initial cue code": "V/J9zSenHUBO8TTHsD+NJ7aEqAik6fk6FgTABx0v8Kg="
								"go program":       "WEtq0xwcD0nPe1F5iLLEbpl7PXL9W7nLfymJWqHmRzo="
							}
							multi_step: {
								hash:       "NO8FUTIEINCL0PJ50ABBHNIDL8UQG2K6OTS5CGQBCNUN3PAJU3C0===="
								scriptHash: "B2ACPKB2I7S9HP09ENHJFI1UHG1SO348DOOJ6DIDMB2U9GAQLNBG===="
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
									cmd:      "go get cuelang.org/go@v0.10.0"
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
								}]
							}
						}
					}
				}
			}
		}
	}
}
