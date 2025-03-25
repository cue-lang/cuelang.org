package site
{
	content: {
		examples: {
			cue: {
				preprocessor: {
					page: {
						cache: {
							upload: {
								"upload initial files":   "keYkL46SwqsCyKzM8E7nzBi+r1eHLjXiW7ND9lWwhvw="
								"upload additional file": "yw7XPKS31K1yQFW8IVfa9Z0l7YQLVqMXgOAaPkmBlYI="
								"a hidden file":          "L/AjrsxiZ3njNrW92zrEDYndj58uvHXl4rzcZh8KZvU="
							}
							code: {
								"a code example": "ZbMjLGvFa31j0LMS5lCasISO9v2dXLFA0cPg11s3quQ="
							}
							multi_step: {
								hash:       "RBGT8S2JE6G6642EU59SUQTKDGJLENQLQBPL47E3SRKRA39SEI0G===="
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
