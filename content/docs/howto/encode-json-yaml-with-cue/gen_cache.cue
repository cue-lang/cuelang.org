package site
{
	content: {
		docs: {
			howto: {
				"encode-json-yaml-with-cue": {
					page: {
						cache: {
							upload: {
								json: "MOE8OIOXOpMo6zbXFOLojepdn66rt7hOH6PJBkwXig8="
								yaml: "T7TuOY98egXEmLiQm28JnfjbWNpaB1B7ds4aEo8QIkE="
							}
							multi_step: {
								hash:       "124KSNDNHV0TFCTJ9PP2RGDPLFB7A0VRU5VPTEO4JJFCJPFMKI7G===="
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
