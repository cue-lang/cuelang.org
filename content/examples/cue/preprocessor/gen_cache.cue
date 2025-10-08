package site
{
	content: {
		examples: {
			cue: {
				preprocessor: {
					page: {
						cache: {
							upload: {
								"upload initial files":   "83y7zcth5PDRr+5dIHbKfhGMcmmx1HHHSVaWA2Vg+rk="
								"upload additional file": "KJfx0PAvwwjhk0x3ZMIh0LQ1/CVAMR69aru0YA7QdME="
								"a hidden file":          "+/3pfuRn/VHqUJ/knJRey9c7EQbihCBuOAXMVaMVcEg="
							}
							code: {
								"a code example": "9l6Ty6YrNGpRd0qLQ/eVq1PLEabU2Acga+bzpS70AWQ="
							}
							multi_step: {
								hash:       "4O6I2BVVRIN48KFBHQ1DLAPDFENRP4V117JHELK06LB66DE62Q7G===="
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
