package site
{
	content: {
		docs: {
			concept: {
				"working-with-incomplete-cue": {
					page: {
						cache: {
							upload: {
								"example.cue": "HARsE+xicMtEaZOEACPJDArJ6SlwIbVMyeANSifDZ9s="
								"data.yaml":   "P17HN4rw3YaUTkzZ/z49QOSqurtFULifyHgdWz/Danw="
								"main.go":     "KKIFfyROIabmNXYMQYNjhN7m8Lrq4OblvVXVdHe7XH0="
							}
							multi_step: {
								hash:       "I7F665DP5P9AJOGFIA30HN2ROCL43B0FM750694BFV6UPOFDSOE0===="
								scriptHash: "7N8PE29HCVJMPRH8VIRGH62JJ5Q28ONVEVQJQKER4PIPSP2KBB90===="
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
									cmd:      "cue export example.cue"
									exitCode: 1
									output: """
											A: incomplete value _
											B: A.x undefined as A is incomplete (type _):
											    ./example.cue:4:4

											"""
								}, {
									doc:      ""
									cmd:      "cue eval example.cue"
									exitCode: 0
									output: """
											A: _
											B: A.x + 10

											"""
								}, {
									doc:      ""
									cmd:      "cue export example.cue data.yaml"
									exitCode: 0
									output: """
											{
											    "A": {
											        "x": 5
											    },
											    "B": 15
											}

											"""
								}, {
									doc:      ""
									cmd:      "go mod init go.example"
									exitCode: 0
									output: """
											go: creating new go.mod: module go.example

											"""
								}, {
									doc:      "#ellipsis 0"
									cmd:      "go get cuelang.org/go@v0.10.1"
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
											step1: {
											\tA: _
											\tB: A.x + 10
											}
											step2: {
											\tA: {
											\t\tx: 5
											\t}
											}
											result: {
											\tA: {
											\t\tx: 5
											\t}
											\tB: 15
											}

											"""
								}, {
									doc:      ""
									cmd:      "go vet ./..."
									exitCode: 0
									output:   ""
								}, {
									doc:      "#ellipsis 0"
									cmd:      "go run honnef.co/go/tools/cmd/staticcheck@v0.5.1 ./..."
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
