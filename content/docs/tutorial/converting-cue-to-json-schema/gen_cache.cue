package site
{
	content: {
		docs: {
			tutorial: {
				"converting-cue-to-json-schema": {
					page: {
						cache: {
							upload: {
								"schema.cue":     "6K9jAyj4hWXro5Krzg3OipUpEMKFC2dx9haaNNE6ico="
								"good.json":      "6VrfH0enTQby0yte+BTkxOndd49ojimt2KL3pDha8r8="
								"bad.json":       "4D8AR0gmWNwlTlxpNsaBT3m1FCW9M0ERhfkoCLs7RMo="
								"bad.json fixed": "+f3Lqk4mrkDd76CksgzMYaX9D2L6p0C3DhRo8DK/A9w="
							}
							multi_step: {
								hash:       "NIEIU31GNO8OK5Q2SHFJSKSFDMKTBP0R4ACSFC3OMKL5SR99JSMG===="
								scriptHash: "NR56U4K5GGIOULD3SBG940S9TPIOJT788OQMQ83B35PJ9OR40MPG===="
								steps: [{
									doc:      "#ellipsis 1"
									cmd:      "cue version"
									exitCode: 0
									output: """
											cue version v0.16.1
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
											        "#Session": {
											            "type": "object",
											            "additionalProperties": false,
											            "properties": {
											                "duration": {
											                    "allOf": [
											                        {
											                            "type": "number"
											                        },
											                        {
											                            "type": "integer",
											                            "exclusiveMinimum": 0,
											                            "maximum": 480
											                        }
											                    ]
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
											                "$ref": "#/$defs/%23Session"
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
											    ./event.schema.json:16:30
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
