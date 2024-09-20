package site
{
	content: {
		examples: {
			cue: {
				preprocessor: {
					page: {
						cache: {
							upload: {
								"upload initial files":   "xNbSgituBRznrGavfmheUAMCOhGU+F1003OneXzItPQ="
								"upload additional file": "vGfJp1IT8U73s9AyJ7H5+tg55FOD1zmBRkNMLhijPpg="
								"a hidden file":          "vXC4oybtXqO1P5RRHZ7UexKl4ZZV/IYRgfx8LKRy04g="
							}
							code: {
								"a code example": "J0PrZ2fmlu1BxHOpCghBmI18kMBAkYtPaUIJF3uhk6E="
							}
							multi_step: {
								hash:       "H0UT8EDPV9183TTISFMVVC0CBOPC75LHC23HOS0CPF50GJ7JCNJG===="
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
