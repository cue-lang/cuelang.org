package site
{
	content: {
		docs: {
			howto: {
				"encode-json-yaml-with-cue": {
					page: {
						cache: {
							upload: {
								json: "DzNZVEvkjkHxyA2plj26uwOaP92O5itX54PN7qI4gUM="
								yaml: "VGirtW+I1cQtXhOeysl63dE4yl66ed3iwpjba6vK+yU="
							}
							multi_step: {
								hash:       "EL701GVJDRKIH68E9I4AT8KJC05KP5F9HP779LTSM3AS08P2OIMG===="
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
