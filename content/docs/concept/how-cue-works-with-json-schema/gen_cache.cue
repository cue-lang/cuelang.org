package site
{
	content: {
		docs: {
			concept: {
				"how-cue-works-with-json-schema": {
					page: {
						cache: {
							upload: {
								"schema.json":     "N/iHmY1uUH+nZaHPSxqqFra/fwzpo/zGWFW7eiE+m+Q="
								"schema.cue":      "bBhdq/i+F95ZdsFh5lCIulg4pCxqcUPa2KkHO6bcZKY="
								good:              "5IVAlWCoH2/C0CXp3ygrsP/3T7zhEIu4NZIS5+6OC04="
								bad:               "JjtE46fY8wCbXuWZJZmvgEpJeT7w+kEKPjrDdIi+mhA="
								"main go program": "M+ko2rfx7F3V6iXiWOmMgpgCoHxDVpFi99/9A7AzmRo="
							}
							multi_step: {
								hash:       "O1DPTEP9IHAEG760T9MBOO7LNMJ2JV69A4RKE58I3EK28O4CSL10===="
								scriptHash: "MSIDGM4F464E3M2LIJVR9E96C43J9RVG4JU2J4AV8S1DIGAC1NBG===="
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
									cmd:      "cue import -l '#Person:' schema.json"
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
									cmd:      "cue vet -d '#Person' schema.cue good.json bad.json"
									exitCode: 1
									output: """
											name: conflicting values ["Charlie","Cartwright"] and strings.MinRunes(1) (mismatched types list and string):
											    ./bad.json:2:13
											    ./schema.cue:11:9

											"""
								}, {
									doc:      ""
									cmd:      "cue vet schema.json good.json bad.json"
									exitCode: 1
									output: """
											name: conflicting values ["Charlie","Cartwright"] and strings.MinRunes(1) (mismatched types list and string):
											    ./bad.json:2:13
											    ./schema.json:13:13

											"""
								}, {
									doc:      "#ellipsis 4"
									cmd:      "cue def json: schema.json"
									exitCode: 0
									output: """
											$schema:     "https://json-schema.org/draft/2020-12/schema"
											type:        "object"
											title:       "Main Person schema."
											description: "This schema defines a person."
											...

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
									cmd:      "go get cuelang.org/go@v0.13.0-alpha.2.0.20250328144635-721ca5db06fc"
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
											\tname:    "Dorothy Cartwright"
											\taddress: "Ripon, North Yorkshire"
											}

											"""
								}, {
									doc:      ""
									cmd:      "go run . schema.json bad.json"
									exitCode: 1
									output: """
											name: conflicting values ["Charlie","Cartwright"] and strings.MinRunes(1) (mismatched types list and string):
											    bad.json:2:13
											    schema.json:13:13
											exit status 1

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
