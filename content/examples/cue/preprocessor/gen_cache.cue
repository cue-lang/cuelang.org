package site
{
	content: {
		examples: {
			cue: {
				preprocessor: {
					page: {
						cache: {
							upload: {
								"upload initial files":   "/ah7baKdloVMmf0lgSEYifmJWcQu092muqQRgNhjkSM="
								"upload additional file": "foJ7lxgAJdd1wEoHsCHVIGO5d9HKAO6xlOT5vck28vk="
								"a hidden file":          "/LJOG+06PtVE1IcY2m8i9HF0aanhduOpAT65WXJccfs="
							}
							code: {
								"a code example": "WBc0D6gM2fdaFK/ASTLwhlKVNb9tvBqgmb+4WXg4nko="
							}
							multi_step: {
								hash:       "ORVCIUC92NQJ2M4F2GEGOA7J9VL7R3PGHUKQAED7HAVP0A0DUIJG===="
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
