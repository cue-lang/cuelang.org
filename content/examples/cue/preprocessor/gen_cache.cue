package site
{
	content: {
		examples: {
			cue: {
				preprocessor: {
					page: {
						cache: {
							upload: {
								"upload initial files":   "V4ii3fl0wjvMV+8HC9uTIWuFWnxf2JpdN/BeZKmjYVU="
								"upload additional file": "loUHBDWlWVeWKjdXllAJGbtl0y2QUo1pP3xGjNH1OpA="
								"a hidden file":          "B/v4mVoDsiQEsTf+3c0XcSvWc8cfo5cO1VYWrSdCW/I="
							}
							code: {
								"a code example": "nkpixpStLNl9D/O6Bk4R4MJSpeUz3GTo7JQvK5WKxq4="
							}
							multi_step: {
								hash:       "KLO81E6S2PT7UTE6SNJUPRJ3VNBKHSI1GLBH2SUICQDG2FPP2HOG===="
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
