package site
{
	content: {
		examples: {
			cue: {
				preprocessor: {
					page: {
						cache: {
							upload: {
								"upload initial files":   "HaQf9Eiku7zg9ZuQDTJpkn92tkbjqkggzJ/WVtoB+74="
								"upload additional file": "eDz/GBxGE+aD8tR2gUGYklUwsBuxbqrebRbVAtll3Pg="
								"a hidden file":          "8oF9kjY8nF5bt31suYI0rQ0W52ZnBtiZg8aTaexdS1o="
							}
							code: {
								"a code example": "+H2xthIVrfiaMJxcBsApJnCyWryxmUClS6cY6oNqO9o="
							}
							multi_step: {
								hash:       "B9MUCOF01JHGBGUKUC4GN0TSIGKCMN691LH885LD1MV8FVJQ1BJG===="
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
