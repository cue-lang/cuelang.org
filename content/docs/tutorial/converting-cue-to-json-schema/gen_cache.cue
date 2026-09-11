package site
{
	content: {
		docs: {
			tutorial: {
				"converting-cue-to-json-schema": {
					page: {
						cache: {
							upload: {
								"schema.cue":     "OMoxxd5tBfwDnOHbXSdiDzsK4a24LHsocOIs6dKIBsc="
								"good.json":      "sgoCxaL97VKE1DSZWe6KgLAKxJXJujHF0kZcE3nitDM="
								"bad.json":       "GQG+azWLN/Xq7eBjQvCti31CTXw3AWniN/DQE/BIcGs="
								"bad.json fixed": "pVFABF/Osl0BYZ2pF1wcVN9UZCOKktdfF2Q6Ds7Jf9w="
							}
							multi_step: {
								hash:       "GR4KPKV0PQ5NCKH88JPOVQGGO1RFQ2JPHSRADJ4FAGI1B7NO69CG===="
								scriptHash: "2A5RA9M3RQ9OQTK27K5KC6L7C2RA3D099T3NB61DA5CV0UGHQDHG===="
								steps: [{
									doc:      "#ellipsis 1"
									cmd:      "cue version"
									exitCode: 0
									output: """
											cue version v0.0.0-goreleaser.202609101448
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
