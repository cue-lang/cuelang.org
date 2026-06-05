package site
{
	content: {
		docs: {
			concept: {
				"how-cue-works-with-json-schema": {
					page: {
						cache: {
							upload: {
								"schema.json":         "hN+fkxjKaporLwyD0iFugr9fb7x+KB6nu3z2sTn08Og="
								"schema.cue":          "MfbKD3v1RbdbW31Zupsd3A/GwFYzDdH+XJAiZRjd/tE="
								good:                  "IU6JWTlc+QhaGux2viJ8v1iP4fQ4Os8m81uxW2R+N+E="
								bad:                   "0faJkg9G8p5Le55Qd6W+tkO/vfMUCawS2snJjvojUDQ="
								"main go program":     "SUsa051jA4wDQMiTilb9ka/ihRjSY3jYCFjJQkAYJ/0="
								"generate schema.cue": "WZJV8gnefpZf39jFS7vAHJf0UiNJuzOUCjo81x2rLY4="
								"open.cue":            "Lgw3aYKumEmOq2HrrRRjPikwWnrD73KL+oMgkr2eQT4="
								"defs.cue":            "AlXl9m6jXaEf+wwBo77F3X4d6dIL1YbjU8rUAfdphfU="
								"gen main.go":         "ZN94lo8kkrxX/MvulSraXUOcYxmLrwzzn/OZH2jZZlQ="
							}
							multi_step: {
								hash:       "2SH6ESBAQBU1VSM0G446E5CLR2E5NHHKP1IHETGK3SM44E5R03UG===="
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
