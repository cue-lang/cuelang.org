package site
{
	content: {
		docs: {
			concept: {
				"how-cue-works-with-json-schema": {
					page: {
						cache: {
							upload: {
								"schema.json":     "yf8m3hUVKcXR/IGYrSE4HqrflehTWFp7rna+DYNET4A="
								good:              "4diqsHzX2ag2jHZNd9lVZ8XYe9TX4wtlQoBBt1uyKxc="
								bad:               "2NI/mXKVJxrN8TKXRdh3jnL9GtFObrBOtj1tPRjJYyw="
								"schema.cue":      "nXaEioD9+GaYhF5qWaDplAFwxjMfjQQ0S9q3XXyJeIM="
								"main go program": "h4LDpO/s0r5WISenMfY1Y3/KIUnNp5gKViYqBwPZGxM="
							}
							multi_step: {
								hash:       "QQRUJHMURE9A09BFBFD1HP91S54GIK1I8E04AP3RLJM6GHHL9RS0===="
								scriptHash: "MD48SD7J74O5IH54Q7NADGFGJ4JAPUNOBCGBTP3PT0D3RFM935TG===="
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
									cmd:      "go get cuelang.org/go@v0.9.0-alpha.3"
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
									doc:      "#ellipsis 10"
									cmd:      "go run . schema.json good.json"
									exitCode: 0
									output: """
											{
											\tname: "cueckoo"
											}
											...

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
