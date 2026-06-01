package site
{
	content: {
		docs: {
			howto: {
				"generate-json-schema-from-cue": {
					page: {
						cache: {
							upload: {
								"schema.cue": "F3rSXto24zmXfWTWBt29y6UhyRKEdW3JQTo+sY1TS9w="
							}
							multi_step: {
								hash:       "GJ3S911FF5DFKHTOBP08QA6MQVV7Q10ECRVC3HIFGK6HCTNH0J4G===="
								scriptHash: "SIBI66PQIJOEFJ2QS8A5LVSSOJ5A31LC73TRDKGI77TDT51UTC90===="
								steps: [{
									doc:      ""
									cmd:      "cue def --out jsonschema -e '#Person' schema.cue"
									exitCode: 0
									output: """
											{
											    "$schema": "https://json-schema.org/draft/2020-12/schema",
											    "type": "object",
											    "additionalProperties": false,
											    "properties": {
											        "age": {
											            "allOf": [
											                {
											                    "type": "number"
											                },
											                {
											                    "type": "integer",
											                    "exclusiveMinimum": 0
											                }
											            ]
											        },
											        "email": {
											            "type": "string"
											        },
											        "name": {
											            "type": "string"
											        }
											    },
											    "required": [
											        "age",
											        "name"
											    ]
											}

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
