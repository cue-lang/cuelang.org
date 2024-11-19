package site
{
	content: {
		examples: {
			cue: {
				preprocessor: {
					page: {
						cache: {
							upload: {
								"upload initial files":   "ntq3Asc2eCqVqZebDcnNUHc5yhw0qUCnpPsdNSCdjZY="
								"upload additional file": "ppRKtbL7zxkqvMsBNRMTCx6zs4NNUWIDAWelH9W0FBo="
								"a hidden file":          "xr2UEbXDTc0JV5peknrovTxg7VlZnjBwW6bXuAT0wVY="
							}
							code: {
								"a code example": "XS6PBQMlRjfw4MoklHQ5RbNMrjqWOD6YsH7Kdz2zWiE="
							}
							multi_step: {
								hash:       "NO28CSTHT7OSN0LHTEK92S1V91S62OGFARMH473MJ1P3DCC6S350===="
								scriptHash: "1K5IR4L5KQL27R6E7ANJ8AGBNEVTHEJKDL4DS7JRTOBCVG32LFNG===="
								steps: [{
									doc:      ""
									cmd:      "cue eval"
									exitCode: 0
									output: """
											y: 2
											x: 1

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
											y: 2
											z: 3
											x: 1

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
