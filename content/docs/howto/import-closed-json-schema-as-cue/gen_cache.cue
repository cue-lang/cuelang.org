package site
{
	content: {
		docs: {
			howto: {
				"import-closed-json-schema-as-cue": {
					page: {
						cache: {
							upload: {
								"schema.json": "GZf4QWVxhjZ1q+T7RtCM76GXybUhI2Alju9jFAJHnt4="
								"data.json":   "99TUzaYZbkVKzkNT1nWZJg9UUYFJgTqKBl+w5RVPncw="
							}
							multi_step: {
								hash:       "TQ24589BRNN0PGB9BRC5GKH41GRNDN5UKTGRT1A9NAGP0BDVP6SG===="
								scriptHash: "U633ORLBQTLE8QA368EDHT8LDJGVJMQELTTGOU7S9PBK2ANQRQ70===="
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
									cmd:      "cat schema.cue"
									exitCode: 0
									output: """
											#Schema: {
											\t@jsonschema(schema="https://json-schema.org/draft/2020-12/schema")
											\tname!: string
											\tage?:  int
											\t...
											}

											"""
								}, {
									doc:      ""
									cmd:      "rm schema.cue"
									exitCode: 0
									output:   ""
								}, {
									doc:      ""
									cmd:      "cue import jsonschema+openOnlyWhenExplicit: schema.json -l '#Schema:'"
									exitCode: 0
									output:   ""
								}, {
									doc:      ""
									cmd:      "cat schema.cue"
									exitCode: 0
									output: """
											#Schema: {
											\t@jsonschema(schema="https://json-schema.org/draft/2020-12/schema")
											\tname!: string
											\tage?:  int
											}

											"""
								}, {
									doc:      ""
									cmd:      "cue vet -c -d '#Schema' schema.cue data.json"
									exitCode: 1
									output: """
											email: field not allowed:
											    ./data.json:4:6

											"""
								}, {
									doc:      ""
									cmd:      "rm schema.cue"
									exitCode: 0
									output:   ""
								}, {
									doc:      ""
									cmd:      "cue import -l '#Schema:' schema.json"
									exitCode: 0
									output:   ""
								}, {
									doc:      ""
									cmd:      "cue vet -c -d '#Schema' schema.cue data.json"
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
