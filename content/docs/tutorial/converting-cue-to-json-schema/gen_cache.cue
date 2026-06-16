package site
{
	content: {
		docs: {
			tutorial: {
				"converting-cue-to-json-schema": {
					page: {
						cache: {
							upload: {
								"schema.cue":     "OcCQNhM0CgPG+CxpJ8Mh3T/U/ZLJywDK0x3Odxa9qF8="
								"good.json":      "iinVjyqSph66QTM1NjZuIN5A3F//fpXLLiJT88CDxMw="
								"bad.json":       "+lHzmp+R5ZqGyaTqKaNRsQEHIj3iYYeEYh5K3l0y4Os="
								"bad.json fixed": "3pPlEEpJzqnlIUdwjqth8IqnjlAs3Ei/uVK3pmltd6U="
							}
							multi_step: {
								hash:       "TFH9TFNIS2BKVL1CQTH5UKTEV4PTM77SOFM7053BUO7DEELNAVAG===="
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
