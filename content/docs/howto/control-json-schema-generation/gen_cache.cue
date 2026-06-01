package site
{
	content: {
		docs: {
			howto: {
				"control-json-schema-generation": {
					page: {
						cache: {
							upload: {
								"defs.cue": "rkYsrEXSJJa1G26yKG6RtaQ7F51ZJSw4YNe2GRujou8="
								"open.cue": "YuFPgBlPZBFiwvexa1997WBwTdmWsTiNIDlV4ccRkcI="
							}
							multi_step: {
								hash:       "KLMEQQHNBVJ25V5TFTPMB9SG67B10IQMN7G1G74UUUF2OJ9LF72G===="
								scriptHash: "IVLF37UG74N5M8R6IMP3T36ULC5H81T8608KADKMLH62VU57H1OG===="
								steps: [{
									doc:      ""
									cmd:      "cue def --out jsonschema -e '#Person' defs.cue"
									exitCode: 0
									output: """
											{
											    "$schema": "https://json-schema.org/draft/2020-12/schema",
											    "$defs": {
											        "#Address": {
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
											            "$ref": "#/$defs/%23Address"
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
								}]
							}
						}
					}
				}
			}
		}
	}
}
