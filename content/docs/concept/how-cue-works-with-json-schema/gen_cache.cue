package site
{
	content: {
		docs: {
			concept: {
				"how-cue-works-with-json-schema": {
					page: {
						cache: {
							upload: {
								"schema.json":         "E/yAzY4N1CwYZmRKrABbtnyv+LqPAH2qK0091srEyjI="
								"schema.cue":          "/cQvOTCiPmnKeF7kF3F2FceH6K98bldg7RHPsiM1LSM="
								good:                  "oc6DOCM0ldo5OdAM8pRm1Zrr9+h+EoMaC6b2lelHfHA="
								bad:                   "D2csZQD9/24Wtvojh2CdDeJaf2PNuLuQmNP/GYTUm8A="
								"main go program":     "oAdVtSQC0/lAPFZG6bIcN0UY2hZUtUu/TzvYWEs60gM="
								"generate schema.cue": "AVPIcZVVKwJuwIYolIK5yppk9xbbXuU0/NlxIvoJh14="
								"open.cue":            "m0XZVlLPsgc8ko7UzbKPjzLjx+mrTqu5iMNX1lf3qYE="
								"defs.cue":            "dyvRzW33NnhsI94eWb5JGX18Qnu6v6YyQlG9yPdOH4k="
								"gen main.go":         "GMnPSOSKUHkx7UvO2H4BRcn7qBYlSR9Q1RHs7iuIxqs="
							}
							multi_step: {
								hash:       "GSQD0P4I3B9T6F3APJ29876G8LHNVJ6PFLPV2STR13TPHL5CQD20===="
								scriptHash: "0UDOLM60RAQOONIMH8QBG3UK9FD2FR5UF55SMN98G60IICNNMFB0===="
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
									cmd:      "go get cuelang.org/go@v0.18.0-alpha.3.0.20261008224848-a4f52c2332e4"
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
											    "Hash": {},
											    "Lbrace": {},
											    "Elts": [
											        {
											            "Label": {
											                "NamePos": {},
											                "Name": "$schema",
											                "Scope": null,
											                "Node": null
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
