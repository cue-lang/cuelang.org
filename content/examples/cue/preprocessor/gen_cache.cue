package site
{
	content: {
		examples: {
			cue: {
				preprocessor: {
					page: {
						cache: {
							upload: {
								"upload initial files":   "AdUn8s8mG5gx43k1NCL6DZATUpZ+e8lfqoDelGs4+F0="
								"upload additional file": "nsXl2YpeV8qnqetVfMzf7rxFJxYLcvID3Dm4A2iFsq0="
								"a hidden file":          "QDW83A5fkCEWsnzymX/E11xV4P074brar3oe5neryeE="
							}
							code: {
								"a code example": "iLt/bV5Ym1iCeoFZtf/KRTRPFXfvsBhJJqUBw7BrGWU="
							}
							multi_step: {
								hash:       "8GPB0DBLFCMGIC6KUPG62TRK487QTPL6KTTA9PPBTUJLJS7DG160===="
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
