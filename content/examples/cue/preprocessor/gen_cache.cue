package site
{
	content: {
		examples: {
			cue: {
				preprocessor: {
					page: {
						cache: {
							upload: {
								"upload initial files":   "bunLoaWZsJwqYG4rONxT4EWn3gJnwkN4rWub8V8JYvI="
								"upload additional file": "+NH9u/W/fJ+nk4TECHPPBv/Vwl+wX0hi42+wYqZxleY="
								"a hidden file":          "Y1C2MjjC8im8GhLHXa63D6KZdT16PidKh7E9cwITJo0="
							}
							code: {
								"a code example": "UkwB0ZptdNc27pBX5gAcFxdcmxMuljPcn5H5molu2eo="
							}
							multi_step: {
								hash:       "T0OAL1VPHH01PMVE6JDR997UQGLMFABE5FPS41OQHP8HTQIGCKS0===="
								scriptHash: "1K5IR4L5KQL27R6E7ANJ8AGBNEVTHEJKDL4DS7JRTOBCVG32LFNG===="
								steps: [{
									doc:      ""
									cmd:      "cue eval"
									exitCode: 0
									output: """
											x: 1
											y: 2

											"""
								}, {
									doc:      ""
									cmd:      "cue eval >result.txt"
									exitCode: 0
									output:   ""
								}, {
									doc:      ""
									cmd:      "cat *.txt"
									exitCode: 0
									output: """
											x: 1
											y: 2
											z: 3

											"""
								}, {
									doc:      ""
									cmd:      "grep bar foo.txt"
									exitCode: 0
									output: """
											bar

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
