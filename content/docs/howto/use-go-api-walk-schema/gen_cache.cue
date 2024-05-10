package site
{
	content: {
		docs: {
			howto: {
				"use-go-api-walk-schema": {
					page: {
						cache: {
							upload: {
								schema:       "YhvNJocGgUTCh9p+ZtfBZr7NCtwY8KOLLIbRMrGCZ5A="
								"go program": "5nIWZrTlmeBEGSUFDX9eIxcP8cRXIV39fS7GouOC9/E="
							}
							multi_step: {
								hash:       "D8E0MP2F6UAOJICPAA5LRR5PQVV92PMKIDBHNDKVTUFS2HEOMDRG===="
								scriptHash: "33OTB2SQ38LDOVJB3BLU0JQV8DDT0V7M39L4HD9TO7CE1SNLN8OG===="
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
									cmd:      "go mod init go.example"
									exitCode: 0
									output: """
											...

											"""
								}, {
									doc:      ""
									cmd:      "cue mod init cue.example"
									exitCode: 0
									output:   ""
								}, {
									doc:      ""
									cmd:      "cue vet ."
									exitCode: 0
									output:   ""
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
											package p

											type person struct {
											\tname string
											\tage int
											}
											type address struct {
											\tcountry string
											}

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
