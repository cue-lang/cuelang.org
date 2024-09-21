package site
{
	content: {
		docs: {
			concept: {
				"how-cue-works-with-json-schema": {
					page: {
						cache: {
							upload: {
								"schema.json":     "4dcEA0/2ZN2Q6YVaENFEokBBo3Ad7f94tWtGVF/ujxQ="
								"schema.cue":      "9nIJEbgPMHtohlPi3fbt0eRVjSiQxoddVP7J7Mx3v8s="
								good:              "zTyWHnlqAs1CHtVu+j1acpucepsgo+Y9Oo0IauSgBLk="
								bad:               "YHMOubFYIWlxiLGQBUePhihk3NLXRu651fPgl9z0nNc="
								"main go program": "jgrD1yV2ujdbMjBPDY5dVeXT0PcQtLRWDj40cvHrSTQ="
							}
							multi_step: {
								hash:       "5M9OSGIF23GEQIDTDL0EMVMMDM1SGB7VLCTLKB6Q75IC88VOM8AG===="
								scriptHash: "00PMNUB0O1TO8KAKSMBHH9UAUMIUM16B4D8S3TJI5OTEV8JUR3M0===="
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
											    ./schema.cue:10:9

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
