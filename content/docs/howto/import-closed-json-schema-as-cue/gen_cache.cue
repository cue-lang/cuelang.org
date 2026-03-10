package site
{
	content: {
		docs: {
			howto: {
				"import-closed-json-schema-as-cue": {
					page: {
						cache: {
							upload: {
								"schema.json":       "GZf4QWVxhjZ1q+T7RtCM76GXybUhI2Alju9jFAJHnt4="
								"open schema.cue":   "YaVoQ0zsXJcLEXTKyomXG6La2DSdJo9ixn9+yHIvGhg="
								"closed schema.cue": "a01NtHfR2JQuHjPTt9f3ggZ8HR0nTEAZw/t7NmhR5+k="
								"data.json":         "99TUzaYZbkVKzkNT1nWZJg9UUYFJgTqKBl+w5RVPncw="
							}
							multi_step: {
								hash:       "PIPPRNU742PJ4V8FB0SE54OTGS30I0LDGMBAUHTRGDBG2C5EVJ3G===="
								scriptHash: "LSCN3VKRS687S8263B88T2QU1MQ4OPSSIRTUH24E8F108QRFUIRG===="
								steps: [{
									doc:      "#ellipsis 1"
									cmd:      "cue version"
									exitCode: 0
									output: """
											cue version v0.16.0
											...

											"""
								}, {
									doc:      ""
									cmd:      "cue import -l '#Schema:' schema.json"
									exitCode: 0
									output:   ""
								}, {
									doc:      ""
									cmd:      "cue import -f jsonschema+openOnlyWhenExplicit: schema.json -l '#Schema:'"
									exitCode: 0
									output:   ""
								}, {
									doc:      ""
									cmd:      "cue vet -c -d '#Schema' schema.cue data.json"
									exitCode: 1
									output: """
											email: field not allowed:
											    ./data.json:4:6

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
