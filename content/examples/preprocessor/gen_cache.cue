package site
{
	content: {
		examples: {
			preprocessor: {
				page: {
					cache: {
						upload: {
							"upload initial files":   "kNUQk6SF3Ja8dhxZBzkGvpMmVTwom1HtgPdzc/BlJus="
							"upload additional file": "rs0+g9MZEmTaO+r8U9iLUsW7KjthAVuRrATOrfH75qI="
							"a hidden file":          "Dw7Kia+K4uSZYDDQOfLyeeNcI5WILoF6opzAwIF9Hvo="
						}
						code: {
							"a code example": "aqdU91Xo7d35sMxJEfa/tIfr9FIg3Mil8x7doWSBIIM="
						}
						multi_step: {
							hash:       "2JJ7B9J2DBKTD2K94VVBPD8RQAL9N15LMD2NBTHSCHUM04R4693G===="
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
