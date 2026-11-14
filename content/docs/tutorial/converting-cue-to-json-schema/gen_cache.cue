package site
{
	content: {
		docs: {
			tutorial: {
				"converting-cue-to-json-schema": {
					page: {
						cache: {
							upload: {
								"schema.cue":     "ocH1lMXS0uU7teSSdxyzDwn03ahQBsjXEHnkLeZDB6I="
								"good.json":      "EStMei37qPMzo4xi8lQd+OaVWaWIRkszMVfVt9MmB58="
								"bad.json":       "TK9JuzHnaKT3AIeuU9KeqnJSrTeMfgIJa29huxd6g3I="
								"bad.json fixed": "Myjp/DMBm2ZLzdFsy3gqhJRRcFFRwpHdYjbEjnfP/jU="
							}
							multi_step: {
								hash:       "JU4SSQP6M2DAD5CT4U1EBDJ3C4KC4H14RMTGUTR5IU8DFILCBVN0===="
								scriptHash: "2A5RA9M3RQ9OQTK27K5KC6L7C2RA3D099T3NB61DA5CV0UGHQDHG===="
								steps: [{
									doc:      "#ellipsis 1"
									cmd:      "cue version"
									exitCode: 0
									output: """
											cue version v0.19.0-0.dev.0.20261113115251-a5a9a9c5a2df
											...

											"""
								}, {
									doc:      ""
									cmd:      "cue def --out jsonschema -e '#Event' schema.cue"
									exitCode: 0
									output: """
											{
											    "$schema": "https://json-schema.org/draft/2020-12/schema",
											    "$defs": {
											        "Session": {
											            "type": "object",
											            "additionalProperties": false,
											            "properties": {
											                "duration": {
											                    "type": "integer",
											                    "exclusiveMinimum": 0,
											                    "maximum": 480
											                },
											                "speaker": {
											                    "type": "string"
											                },
											                "title": {
											                    "type": "string"
											                }
											            },
											            "required": [
											                "duration",
											                "speaker",
											                "title"
											            ]
											        }
											    },
											    "type": "object",
											    "additionalProperties": false,
											    "properties": {
											        "name": {
											            "type": "string"
											        },
											        "sessions": {
											            "type": "array",
											            "items": {
											                "$ref": "#/$defs/Session"
											            }
											        },
											        "venue": {
											            "type": "string"
											        }
											    },
											    "required": [
											        "name",
											        "venue"
											    ]
											}

											"""
								}, {
									doc:      ""
									cmd:      "cue def --out jsonschema -e '#Event' -o event.schema.json schema.cue"
									exitCode: 0
									output:   ""
								}, {
									doc:      ""
									cmd:      "cue vet event.schema.json good.json bad.json"
									exitCode: 1
									output: """
											sessions.0.duration: invalid value 600 (out of bound <=480):
											    ./event.schema.json:11:22
											    ./bad.json:8:25

											"""
								}, {
									doc:      ""
									cmd:      "cue vet event.schema.json good.json bad.json"
									exitCode: 0
									output:   ""
								}]
							}
						}
					}
				}
			}
		}
	}
}
