package site
{
	content: {
		docs: {
			tutorial: {
				"converting-cue-to-json-schema": {
					page: {
						cache: {
							upload: {
								"schema.cue":     "PircM15y36SbQWxgi7Yav2eebQyFcu68nHuYDfMwrGA="
								"good.json":      "fv1BkZ9mQo6KQF43r4X4rQlXb4aE1Sxnjsykg8B6wmg="
								"bad.json":       "1RMw5R8c1Eh0kd6nvtIEyFbl4ryBnqg05M5WFDEsEwg="
								"bad.json fixed": "vkGfUEnlnEvlZRs41kX240D5UHooutzUZEjkOe45zcg="
							}
							multi_step: {
								hash:       "BQAE4JUES33OGJ1VHLKHTBB4IDVRL5VI4BB71PLILTJSG9AQ7TJ0===="
								scriptHash: "NR56U4K5GGIOULD3SBG940S9TPIOJT788OQMQ83B35PJ9OR40MPG===="
								steps: [{
									doc:      "#ellipsis 1"
									cmd:      "cue version"
									exitCode: 0
									output: """
											cue version v0.17.0
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
