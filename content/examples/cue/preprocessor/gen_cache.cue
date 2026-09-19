package site
{
	content: {
		examples: {
			cue: {
				preprocessor: {
					page: {
						cache: {
							upload: {
								"upload initial files":   "/t32jnieLcop4Yb4Q59hI8VY1n5agypftrW41twbOlg="
								"upload additional file": "nV4Xl2eFD5DW1m0AfMVMHhxbnVpHhvOs0LsZgpSQ1UY="
								"a hidden file":          "00IMYwsthcJmFpcHhyYaZDMdQjp6XAxeiz58Ff6TVJ8="
							}
							code: {
								"a code example": "9M1i4/xFBEM4ONdudRqtWH6A0MZe9Z7kgwfIco78BJo="
							}
							multi_step: {
								hash:       "EF2E36RE82H1I6FB9TAO4N3ISL7DIS92SB552M00ESOCQHC25P80===="
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
