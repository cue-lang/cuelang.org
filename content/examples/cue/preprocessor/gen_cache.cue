package site
{
	content: {
		examples: {
			cue: {
				preprocessor: {
					page: {
						cache: {
							upload: {
								"upload initial files":   "VhLpGFISaBj48wfSOd4Mwk5anAvIAortAh9nBDVEpTg="
								"upload additional file": "c7z0s724dXunL0qtz0xUsDlkHJrt+CJyUoiF8d8xjmg="
								"a hidden file":          "3uEJ8UtqYQYOE8yPEw1PhEODX13zwR/z/OQI1VbV2ZM="
							}
							code: {
								"a code example": "ADFyedNQtrDxABjg8/Ib5fbqoIwqdo6c3gG8to3haZ4="
							}
							multi_step: {
								hash:       "UTS8PHUIQHQ5IBV55NLOLOUMSLNJO5RO68EQ9LSBQRU0O8M8C880===="
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
