package site
{
	content: {
		docs: {
			concept: {
				"how-cue-works-with-json-schema": {
					page: {
						cache: {
							upload: {
								"schema.json":     "02v+6B8Zc72eVOLRvxUT8f8O2UeSqXMiOSi9T2qYk+w="
								"schema.cue":      "sJKv2eHJjbDWW1z2Cr+rvfkhtekmHpyFU74lZo8DKyY="
								good:              "hJb2tZlHNz+9CAb/DS/qsdoae+xlxeKtl/JtUqTq7XE="
								bad:               "ZFui879it0gkvobRFu0Xkx4plGVduAbWGcPZvV2LPYE="
								"main go program": "NXsYurCY20FHZSFHH2kZ8FOp6lT07Z6+YdsI8Dcc0Pg="
							}
							multi_step: {
								hash:       "LJS8FT3QBL3I4L0DSLJQUHKHQO0JDGF67U8EDSO1098A8OCFOLS0===="
								scriptHash: "SDFKPTRHN80136CL4T5B7OE6SRFQVE8S8QRO7QVAHUV2FDUFI33G===="
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
									cmd:      "export STATICCHECK_CACHE=/caches/staticcheck"
									exitCode: 0
									output:   ""
								}, {
									doc:      ""
									cmd:      "cue import -l '#Person:' schema.json"
									exitCode: 0
									output:   ""
								}, {
									doc:      ""
									cmd:      "cue vet -c -d '#Person' schema.cue good.json bad.json"
									exitCode: 1
									output: """
											name: conflicting values ["Charlie","Cartwright"] and strings.MinRunes(1) (mismatched types list and string):
											    ./bad.json:2:13
											    ./schema.cue:11:9

											"""
								}, {
									doc:      ""
									cmd:      "cue vet -c schema.json good.json bad.json"
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
									cmd:      "go get cuelang.org/go@v0.14.2"
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
									cmd:      "staticcheck ./..."
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
