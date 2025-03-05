package site
{
	content: {
		docs: {
			concept: {
				"schema-definition-use-case": {
					page: {
						cache: {
							upload: {
								"api-cue": "eKGObYwM0Wj6NpqxVOO9CVscjuXeLTs51RUFuc9lHnU="
								"api-go":  "sKTBKDUCJ0YifUDzaOTqV9WwF/7EE1Ni1WFkcUzBjdk="
							}
							code: {
								"openapi-comparison": "fxCEon6BtjeqJgSzp0an64nvCRZ/1INzXsJp8z6iVt4="
							}
							multi_step: {
								hash:       "SO00B7MTL26BF6M8R71OBJN9HLATCT1RH2P71AO04JU3LCIN8VGG===="
								scriptHash: "KIJCRH0S6C8SQJ6LA950GNHCRSK0ALG01TGAEB8B7LICK1M99Q60===="
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
									cmd:      "go mod init cue.example"
									exitCode: 0
									output: """
											go: creating new go.mod: module cue.example
											go: to add module requirements and sums:
											\tgo mod tidy

											"""
								}, {
									doc:      "#ellipsis 0"
									cmd:      "go get cuelang.org/go@v0.13.0-0.dev.0.20250305124614-153fc8a559ad"
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
											V2 is backwards compatible with V1: true
											V3 is backwards compatible with V2: false

											"""
								}, {
									doc:      ""
									cmd:      "go vet ./..."
									exitCode: 0
									output:   ""
								}, {
									doc:      "#ellipsis 0"
									cmd:      "go run honnef.co/go/tools/cmd/staticcheck@v0.6.0 ./..."
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
