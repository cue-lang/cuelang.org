package site
{
	content: {
		docs: {
			howto: {
				"encode-json-yaml-with-cue": {
					page: {
						cache: {
							upload: {
								json: "8zU0zL30RkncNevjqJYGqgVfHfkcA4OADTSdw7h8/7c="
								yaml: "Gm8gvsR1lpZ0xwT0CGP8HG8+2C/vPfU3fzMFC7e3pv0="
							}
							multi_step: {
								hash:       "GMD5JK5E10OER572ESBGMH1EVI59S0TN790UQL188170NM1T17JG===="
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
