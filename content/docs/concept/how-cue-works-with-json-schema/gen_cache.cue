package site
{
	content: {
		docs: {
			concept: {
				"how-cue-works-with-json-schema": {
					page: {
						cache: {
							upload: {
								"schema.json":         "Ji9jpJ0eV3rcee/EDXciSuq6J37IxmqHlqdgvbCJ/p4="
								"schema.cue":          "TMbI1++Nnlkf5ernIhMm4giCMWcQOxmBwJfAWfNOIYM="
								good:                  "80cknNEXUWiaVSmxTxE3pJfksC8YNfdO317uy8onL4s="
								bad:                   "pPjVRN4b8B+hQGd82co6hZBzRBhH4E8bXrgLvTLfbHI="
								"main go program":     "9uof5LzAZev9mnURVBbpYNzOFjTEGmHn8lj0w6g1smc="
								"generate schema.cue": "/y7vVsFTRwNOQ2Yt5efgtpEG3EI12B0/2r32PxsdVIw="
								"open.cue":            "RfrVMlN2EdJrFrwq+lT6PSvsYKFlf1yXXBIZClz4Xig="
								"defs.cue":            "9nog5JJyo8i6s4w+eSFNqK9Ngs0TXa3aw3YIpg6B++I="
								"gen main.go":         "j8p3jpTlcsSxcITHREXYYkzOXJsfj5FJ1oB9is+mrbI="
							}
							multi_step: {
								hash:       "SFMTEL0I7U4LK6QSIT5BI25FN6N2GSLT40R2SITBPQ0NAKVUVFVG===="
								scriptHash: "0PTHB4U1JU8EUTIUOUBDMRBDEJ5ABVNPNFTO40LSQ325RUONMJ90===="
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
											    ./schema.json:13:14

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
									cmd:      "go get cuelang.org/go@v0.17.0"
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
											    schema.json:13:14
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
								}, {
									doc:      ""
									cmd:      "cue def --out jsonschema -e '#Team' generate_schema.cue"
									exitCode: 0
									output: """
											{
											    "$schema": "https://json-schema.org/draft/2020-12/schema",
											    "type": "object",
											    "additionalProperties": false,
											    "properties": {
											        "lead": {
											            "type": "string"
											        },
											        "members": {
											            "type": "array",
											            "items": {
											                "type": "string"
											            }
											        },
											        "name": {
											            "type": "string"
											        }
											    },
											    "required": [
											        "name"
											    ]
											}

											"""
								}, {
									doc:      ""
									cmd:      "cue def --out jsonschema -e '#Closed' open.cue"
									exitCode: 0
									output: """
											{
											    "$schema": "https://json-schema.org/draft/2020-12/schema",
											    "type": "object",
											    "additionalProperties": false,
											    "properties": {
											        "name": {
											            "type": "string"
											        }
											    },
											    "required": [
											        "name"
											    ]
											}

											"""
								}, {
									doc:      ""
									cmd:      "cue def --out jsonschema -e '#Open' open.cue"
									exitCode: 0
									output: """
											{
											    "$schema": "https://json-schema.org/draft/2020-12/schema",
											    "type": "object",
											    "additionalProperties": true,
											    "properties": {
											        "name": {
											            "type": "string"
											        }
											    },
											    "required": [
											        "name"
											    ]
											}

											"""
								}, {
									doc:      ""
									cmd:      "cue def --out jsonschema -e '#Person' defs.cue"
									exitCode: 0
									output: """
											{
											    "$schema": "https://json-schema.org/draft/2020-12/schema",
											    "$defs": {
											        "Address": {
											            "type": "object",
											            "additionalProperties": false,
											            "properties": {
											                "city": {
											                    "type": "string"
											                },
											                "street": {
											                    "type": "string"
											                },
											                "zip": {
											                    "type": "string"
											                }
											            },
											            "required": [
											                "city",
											                "street",
											                "zip"
											            ]
											        }
											    },
											    "type": "object",
											    "additionalProperties": false,
											    "properties": {
											        "address": {
											            "$ref": "#/$defs/Address"
											        },
											        "name": {
											            "type": "string"
											        }
											    },
											    "required": [
											        "address",
											        "name"
											    ]
											}

											"""
								}, {
									doc:      ""
									cmd:      "cue def --out jsonschema -e '#Closed' -o closed.schema.json open.cue"
									exitCode: 0
									output:   ""
								}, {
									doc:      ""
									cmd:      "cat closed.schema.json"
									exitCode: 0
									output: """
											{
											    "$schema": "https://json-schema.org/draft/2020-12/schema",
											    "type": "object",
											    "additionalProperties": false,
											    "properties": {
											        "name": {
											            "type": "string"
											        }
											    },
											    "required": [
											        "name"
											    ]
											}

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
									cmd:      "go run ./gen generate_schema.cue '#Team'"
									exitCode: 0
									output: """
											{
											    "Lbrace": {},
											    "Elts": [
											        {
											            "Label": {
											                "NamePos": {},
											                "Name": "$schema",
											                "Scope": null,
											                "Node": null
											            },
											...

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
