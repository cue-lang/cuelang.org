package site
{
	content: {
		docs: {
			concept: {
				"how-cue-works-with-json-schema": {
					page: {
						cache: {
							upload: {
								"schema.json":     "b63DklGZHZ7gS2Gg7mmoPpZoCLsqJ8UuDwYEpFSQhVY="
								"schema.cue":      "flwhZnfA9HTImqmC0+75DFCp0TIVEByXrSCIBgzn9cM="
								good:              "amE1tVIZOOyjSb/E+s7rbFAm6qjAH2epCEQI46twFU4="
								bad:               "BSOaxroc6/wHpXb8+O2M2oGIKnoZVXFhhLQPENRYdlQ="
								"main go program": "4MroZzq0LyCxrmlqg8XGDKF/yL2Jau3Jr7/5tKoLRi4="
							}
							multi_step: {
								hash:       "S15GN0R9AL5BRL0SSBH2O7ILGG82RAD2SP5OQSJHBFMM7G5MIJ4G===="
								scriptHash: "4FCP960Q6ORNKJVC61E4P2QTVCKB8DNUHF13ALIR3HKBNTQHS8SG===="
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
											name: conflicting values strings.MinRunes(1) and ["Charlie","Cartwright"] (mismatched types string and list):
											    ./bad.json:2:13
											    ./schema.cue:10:8

											"""
								}, {
									doc:      ""
									cmd:      "cue vet schema.json good.json bad.json"
									exitCode: 1
									output: """
											name: conflicting values strings.MinRunes(1) and ["Charlie","Cartwright"] (mismatched types string and list):
											    ./bad.json:2:13
											    ./schema.json:13:13

											"""
								}, {
									doc:      "#ellipsis 4"
									cmd:      "cue def json: schema.json"
									exitCode: 0
									output: """
											$schema:     "http://json-schema.org/draft-07/schema#"
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
									cmd:      "go get cuelang.org/go@v0.9.2"
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
											name: conflicting values strings.MinRunes(1) and ["Charlie","Cartwright"] (mismatched types string and list):
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
