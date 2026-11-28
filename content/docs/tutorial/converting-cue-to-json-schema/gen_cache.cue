package site
{
	content: {
		docs: {
			tutorial: {
				"converting-cue-to-json-schema": {
					page: {
						cache: {
							upload: {
								"schema.cue":     "/66ndFqX3lxI86sWZrrY31oDkALmtqnFWEokrcgCFLg="
								"good.json":      "sYMIQgL4yAE/YQ3rvBUGNk2gSghUsg67pOh77r0VT/8="
								"bad.json":       "yrMTbaX0N1Lt2tCNfc/7AVIIkBl19NESK+GK0K1lNmM="
								"bad.json fixed": "o2yTghro6ngVb7qxIWp/RYnkmKDtjlaXTido+DRBqK4="
							}
							multi_step: {
								hash:       "DIS89070J8C4Q1VMERURMD175A3DDK8RQ8LMMH1750IOP5TL72C0===="
								scriptHash: "2A5RA9M3RQ9OQTK27K5KC6L7C2RA3D099T3NB61DA5CV0UGHQDHG===="
								steps: [{
									doc:      "#ellipsis 1"
									cmd:      "cue version"
									exitCode: 0
									output: """
											cue version v0.19.0-0.dev.0.20261127222705-d53722b2b9cd
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
