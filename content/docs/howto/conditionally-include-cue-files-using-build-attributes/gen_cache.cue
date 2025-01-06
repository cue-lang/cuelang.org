package site
{
	content: {
		docs: {
			howto: {
				"conditionally-include-cue-files-using-build-attributes": {
					page: {
						cache: {
							upload: {
								examples: "wp0r3dPCcW16p3oQj8OA4P4X3NgKMH9lQ16kmxSdaRY="
							}
							multi_step: {
								hash:       "7JFPHQF3SJHC05U74BUQ6QJSTPKEO8I5BIQU6MCDTAHINR7F0200===="
								scriptHash: "5U9IOJ0N56KQI44J6UAVMMRA03QJV5U3BQ36TEPH57N054J4NMJ0===="
								steps: [{
									doc:      ""
									cmd:      "cue export"
									exitCode: 0
									output: """
											{
											    "data from bar.cue": true,
											    "data from qux.cue": true
											}

											"""
								}, {
									doc:      ""
									cmd:      "cue export -t foo"
									exitCode: 0
									output: """
											{
											    "data from bar.cue": true,
											    "data from foo.cue": true,
											    "data from qux.cue": true
											}

											"""
								}, {
									doc:      ""
									cmd:      "cue export -t bar"
									exitCode: 0
									output: """
											{
											    "data from qux.cue": true
											}

											"""
								}, {
									doc:      ""
									cmd:      "cue export -t foo -t bar"
									exitCode: 0
									output: """
											{
											    "data from foo.cue": true,
											    "data from qux.cue": true
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
