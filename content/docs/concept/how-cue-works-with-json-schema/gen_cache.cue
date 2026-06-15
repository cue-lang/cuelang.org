package site
{
	content: {
		docs: {
			concept: {
				"how-cue-works-with-json-schema": {
					page: {
						cache: {
							upload: {
								"schema.json":         "fWMsvdop9gWqjly8GutOq1ZkG6LxD0W9vDeAvn7jL5g="
								"schema.cue":          "Qvw4+TFFRG47nZ31l58eZZC5mcZqYbMxyZN5UsLf9ss="
								good:                  "CQU9OVMpFGPjDO6HBxUOwY6KPV4hAyPY5pDg6s5o8qk="
								bad:                   "agOkR9jkeOsiOxbWuZ2ofwuuuaNpWldEEYBytaDxmz4="
								"main go program":     "PL7DiFk3PcEv0drakRRgtQjm5HNqOEl84KMQ9Wvjewo="
								"generate schema.cue": "WoY28Ese6IW07XRMr5GaVWAJ3kxiEDdGHxshPNEUqOU="
								"open.cue":            "YoVLQaVblfjGPpKnoSm1OmrgMR0dxeqqkQYOxEUJQMk="
								"defs.cue":            "JJ/l8woRkJcodg0hXnoOWCKOceHBd7Xn5eUTNhe0jL8="
								"gen main.go":         "RxlhYPMBFl4y/nt2o9N2jmEV4qQnoEHhvOSe77yjbHM="
							}
							multi_step: {
								hash:       "L90CHPMHNIF298K74OGHJJ9MDAKHH76M2IETQTMRJ2RLVFV90QL0===="
								scriptHash: "55E0MA26GV8SR56O7C97V6OPPBJE879LJKUFGMQHPM37DADKDV10===="
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
									cmd:      "go get cuelang.org/go@v0.16.1"
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
											        "#Address": {
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
											            "$ref": "#/$defs/%23Address"
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
