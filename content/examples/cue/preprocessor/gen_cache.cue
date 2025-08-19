package site
{
	content: {
		examples: {
			cue: {
				preprocessor: {
					page: {
						cache: {
							upload: {
								"upload initial files":   "2FQ4p3FrHo+OEemGX1e/VlOLdNB8c58oKOYpo9oDjsw="
								"upload additional file": "GU1ZlUilhHfKvVMFq3zN9INfdScB6IrKgxYzySGh4z4="
								"a hidden file":          "fggc4JUyoCZnwe+JetvhIWI5LixfH3fNRXBBbar13Xk="
							}
							code: {
								"a code example": "gtgwI9FpANM6CZ1rG1DH1rOGQQFMsiR+Zr5GPJL24lA="
							}
							multi_step: {
								hash:       "Q1RU5P3F88F97F48GFTK3N050B7R7JV8NGTKI3B45UC9GCVV78BG===="
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
