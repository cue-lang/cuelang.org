package site
{
	content: {
		examples: {
			cue: {
				preprocessor: {
					page: {
						cache: {
							upload: {
								"upload initial files":   "WaEf/eXVgCZTLcHpL7AlreZV32C63XaDNR9mRitUftA="
								"upload additional file": "9VlpZHLEiik8r5NdrjxmMkFcO7ffRd1p9LddfJZq1v4="
								"a hidden file":          "YV2P4ybsYCNHjHmswvJ4diO+wHUYt9CrHKjY9uasarE="
							}
							code: {
								"a code example": "zGOGZXrlFznzxcMI72V62hcFOkVRwQERGqxQVM+xow4="
							}
							multi_step: {
								hash:       "CUMKKDG814AS1B9JLMTP0UCD477AGQMHFHG6P1S17O7C0E78N3GG===="
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
