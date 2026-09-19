package site
{
	content: {
		docs: {
			tutorial: {
				"converting-cue-to-json-schema": {
					page: {
						cache: {
							upload: {
								"schema.cue":     "/DqvayaL3y4LIVqju4Ii0xdwmdQWLAjFAU78OEbCvRg="
								"good.json":      "+rU0GCdDNpoVp5TBKeD54/HDPO0n2O5X4pIPooApnCw="
								"bad.json":       "Dw5N7xrQg3eOR4uAHoDkeTJZDqus6Ey5ht1ZyXpQXY8="
								"bad.json fixed": "UAk/38l0XmWD4bADIV/qmFDL45xLqZ3YMg8RZe0H3cE="
							}
							multi_step: {
								hash:       "RPKRCTACHAQAN1LD1P8I3QDOOPVV9OMVMMO9G3HLL3CLTEOE5AKG===="
								scriptHash: "2A5RA9M3RQ9OQTK27K5KC6L7C2RA3D099T3NB61DA5CV0UGHQDHG===="
								steps: [{
									doc:      "#ellipsis 1"
									cmd:      "cue version"
									exitCode: 0
									output: """
											cue version v0.18.0-alpha.2.0.20260918143709-50e1f64b6460
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
