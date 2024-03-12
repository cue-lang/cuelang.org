package site
{
	content: {
		docs: {
			concept: {
				"how-cue-works-with-json-schema": {
					page: {
						cache: {
							upload: {
								"schema.json":     "vlJVPK77vb4SMVeCyJKzBO012MAabB7ArPN83Kxy/Tw="
								good:              "/m8r4kH68hsRYww/ik3XaNTVVTR9iQ2voWtPeW7bnmY="
								bad:               "Andb9ZggNQEnOUz6YJtL+vFIKdla2SxEXzlIxBmW+mA="
								"schema.cue":      "XFr+z+qbhiErFoHGna6FbKJRQenVnwVdhkyFrj6wMzA="
								"main go program": "6vk262okV9Tzpo/8yeMGgNrqNDfrpJCSYTQ02CAORLo="
							}
							multi_step: {
								hash:       "1B5TMQVB18GVDBF6314R2FTFFFINQEHFNT34G6HT93OE8R1B8410===="
								scriptHash: "5QCK30K61JFL7DMQTG7KI2OQNB8ACOEKABKMV129FLPA3H23R6L0===="
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
									cmd:      "cue import -l '#person:' schema.json"
									exitCode: 0
									output:   ""
								}, {
									doc:      ""
									cmd:      "mv schema.cue .schema.cue"
									exitCode: 0
									output:   ""
								}, {
									doc:      ""
									cmd:      "diff -u schema.cue .schema.cue"
									exitCode: 0
									output:   ""
								}, {
									doc:      ""
									cmd:      "cue vet -d '#person' schema.cue good.json"
									exitCode: 0
									output:   ""
								}, {
									doc:      ""
									cmd:      "cue vet -d '#person' schema.cue bad.json"
									exitCode: 1
									output: """
											name: conflicting values 42 and strings.MinRunes(1) (mismatched types int and string):
											    ./bad.json:2:13
											    ./schema.cue:10:8

											"""
								}, {
									doc:      ""
									cmd:      "go mod init mod.example"
									exitCode: 0
									output: """
											go: creating new go.mod: module mod.example

											"""
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
									cmd:      "go run . schema.json good.json"
									exitCode: 0
									output: """
											{
											\tname: "cueckoo"
											}

											"""
								}, {
									doc:      ""
									cmd:      "go run . schema.json bad.json"
									exitCode: 1
									output: """
											name: conflicting values strings.MinRunes(1) and 42 (mismatched types string and int):
											    bad.json:2:13
											    schema.json:13:13
											exit status 1

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
