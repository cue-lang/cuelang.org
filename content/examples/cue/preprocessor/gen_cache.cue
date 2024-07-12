package site
{
	content: {
		examples: {
			cue: {
				preprocessor: {
					page: {
						cache: {
							upload: {
								"upload initial files":   "lTNkcpdlsLIRKT8TTtcVBDcx5la/Enq99W1w2QxGSrI="
								"upload additional file": "zTart6XZkaywdo+CiNSB9Gz3HhQHZrPRPu3PcpB7sS8="
								"a hidden file":          "lPv9GqBwZ/zgBz4OuP3aVEBmoy86l34FwjzgBCQUMqA="
							}
							code: {
								"a code example": "gmLcq55z5enTsKmC3OkZvtfQHuldXKLOPBRGmkKNBKY="
							}
							multi_step: {
								hash:       "UL0E558M749I68OQ4JE67KCV9TUAAG2G064E3E943IETK7NL0050===="
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
