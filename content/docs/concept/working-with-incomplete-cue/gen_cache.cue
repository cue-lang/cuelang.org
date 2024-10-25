package site
{
	content: {
		docs: {
			concept: {
				"working-with-incomplete-cue": {
					page: {
						cache: {
							upload: {
								"example.cue": "7if60Pg596ha0nBEbNlhL4pKYraL1xC6mpRdZzTPwyc="
								"data.yaml":   "lXB0JOd68LCH03DROLrZTbIScBSKgfs7oTrjCzNvKrA="
								"main.go":     "/VdhB8trdZYRZp7dEHESUbEbJFHMqxAj2eUwYlZi7IY="
							}
							multi_step: {
								hash:       "4GR9JAQFHAUDTNP633VHBU0E5MPMN34SPALSJF89D3NEEL73HCE0===="
								scriptHash: "OTQB3PFLEQQVKPDJLS75N11M702D00S5DM04CGLNLP3TS4NQS9NG===="
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
									doc:      "# The example is valid CUE ..."
									cmd:      "cue vet -c=false example.cue"
									exitCode: 0
									output:   ""
								}, {
									doc:      "# ... but it contains non-concrete values:"
									cmd:      "cue vet example.cue"
									exitCode: 1
									output: """
											some instances are incomplete; use the -c flag to show errors or suppress this message

											"""
								}, {
									doc:      "# This means that it cannot be exported:"
									cmd:      "cue export example.cue"
									exitCode: 1
									output: """
											B: undefined field: x:
											    ./example.cue:4:6

											"""
								}, {
									doc:      ""
									cmd:      "cue eval example.cue"
									exitCode: 0
									output: """
											A: {
											    b: 2
											}
											B: A.x + 10

											"""
								}, {
									doc:      ""
									cmd:      "cue export example.cue data.yaml"
									exitCode: 0
									output: """
											{
											    "A": {
											        "x": 5,
											        "b": 2
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
											\tA: {
											\t\tb: 2
											\t}
											\tB: A.x + 10
											}
											step2: {
											\tA: {
											\t\tx: 5
											\t}
											}
											result: {
											\tA: {
											\t\tb: 2
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
