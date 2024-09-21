package site
{
	content: {
		docs: {
			howto: {
				"encode-json-yaml-with-cue": {
					page: {
						cache: {
							upload: {
								json: "Z6BZ4aR49foWgzKfTK2Sr4uvT/rZgC7ErwfJI8bJh+Q="
								yaml: "oCxoO3dSDqq65EQRoRxZ7JnMwW2oplnQBp/+rXTmztI="
							}
							multi_step: {
								hash:       "10DLOS20E1JTGS0DM5DIG6PFNHOBBTIGL92K594EMT8C8C0U6OT0===="
								scriptHash: "NBDCPULNRD3R08PD54O4HRS8CFC39I0KHVEB4PRGRRQAUR3M26JG===="
								steps: [{
									doc:      ""
									cmd:      "cue export nested-json.cue"
									exitCode: 0
									output: """
											{
											    "nestedJSON": "{\\"innerString\\":\\"inside\\"}",
											    "outerString": "outside"
											}

											"""
								}, {
									doc:      ""
									cmd:      "cue export nested-yaml.cue"
									exitCode: 0
									output: """
											{
											    "nestedYAML": "innerString: inside\\n",
											    "outerString": "outside"
											}

											"""
								}, {
									doc:      ""
									cmd:      "cue export nested-json.cue --out yaml"
									exitCode: 0
									output: """
											nestedJSON: '{"innerString":"inside"}'
											outerString: outside

											"""
								}, {
									doc:      ""
									cmd:      "cue export nested-yaml.cue --out cue"
									exitCode: 0
									output: #"""
											nestedYAML: """
											\#tinnerString: inside

											\#t"""
											outerString: "outside"

											"""#
								}]
							}
						}
					}
				}
			}
		}
	}
}
