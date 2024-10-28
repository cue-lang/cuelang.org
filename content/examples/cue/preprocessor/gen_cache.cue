package site
{
	content: {
		examples: {
			cue: {
				preprocessor: {
					page: {
						cache: {
							upload: {
								"upload initial files":   "jT5heTmyvaQyNP+eb6uXf/yDVPO19+WnCBlyPBPFtsg="
								"upload additional file": "ooMs0YvyEUxEz4ezZXjec8gdb400jvW/pSW386t7a9g="
								"a hidden file":          "Lcv7/H2jdIyJ9GBPZcKdMRD7kt9NQokFrW2ZJkm4ass="
							}
							code: {
								"a code example": "Si6IpBOqD0tGkd7aZAhjMJaZyE8ts5VJMFtCFoIHbDY="
							}
							multi_step: {
								hash:       "EIEIR01VO7EQC1SCFQ5IAFJ27F7867B4J8AHO2GMMPSDGUPI7U20===="
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
