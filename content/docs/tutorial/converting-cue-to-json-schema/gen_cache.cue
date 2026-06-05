package site
{
	content: {
		docs: {
			tutorial: {
				"converting-cue-to-json-schema": {
					page: {
						cache: {
							upload: {
								"schema.cue":     "EV3ygQx5Ep9d2iE4crZVTiyjr048nombtrlzL3PjnMM="
								"good.json":      "vDW1g4ZliI5zJmVeWx1WBjgUW+1HuF9diAPRdSWqjlI="
								"bad.json":       "F588e51fWt116ylBeMjwXWC65ppE3EZ1YbuWBDi+I7Y="
								"bad.json fixed": "5UGbY9Di58XYlLcDVj+ffP3vLArIWdv7B1+6/YCLbrg="
							}
							multi_step: {
								hash:       "6PEKIUJCNE5IMCNK9AR19OV1FI59VG6OP5H3713M7A00UGKRT4JG===="
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
