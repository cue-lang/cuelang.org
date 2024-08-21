package site
{
	content: {
		docs: {
			howto: {
				"place-data-go-api": {
					page: {
						cache: {
							upload: {
								"initial cue code": "cCDR5sNYSrEu2VXlWD62h3u6GdC/q2rCqvM8RQbYLl8="
								"go program":       "Y6TeLhg2zMd5F73SkPoeUHmPWa12fqKRFSE96Y4AR9E="
							}
							multi_step: {
								hash:       "D2JP6DDA45E5HQ9DQJ62JR12OFLEHTJEIHOHS0JIPEVPC1HJDP90===="
								scriptHash: "UATM81S9M76MVV50GFM7MLA8D4SQJ2APD902OQHC00EELMDNM0TG===="
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
									output: #"""
											"""
											\#tHello, Charlie!
											\#tHow's the weather in your part of the world?
											\#t"""

											"""#
								}]
							}
						}
					}
				}
			}
		}
	}
}
