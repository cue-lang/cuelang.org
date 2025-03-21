package site
{
	content: {
		examples: {
			cue: {
				preprocessor: {
					page: {
						cache: {
							upload: {
								"upload initial files":   "y42QD/7F/MOk+7mWyEbPwJb3ln/szwZQwAZRKfQgoSs="
								"upload additional file": "kVkA+6LU7r2mYkbZdhQm6+0FypFttO2JHdEPIWABMlk="
								"a hidden file":          "RDBETpzjfTAVf52EvzNLFF/3f6uakGXfb0+btILjwpo="
							}
							code: {
								"a code example": "ukNS39MmWsGmzmWh2PI2WzGV1H+1SuLbQVYofkA/48s="
							}
							multi_step: {
								hash:       "QPM1U1TK4LD56291OMVM3TC3QQ3H29MMTOIK3C3R37V8ACHIQCI0===="
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
