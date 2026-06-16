package site
{
	content: {
		examples: {
			cue: {
				preprocessor: {
					page: {
						cache: {
							upload: {
								"upload initial files":   "A81+VKNC78eJ/bTQG3mGBBZa03b5LKg7MzllaOYxcvk="
								"upload additional file": "j7BYL357nbiKdVlf92l8Gk/KpwYZhlkGYUnyGalzgj8="
								"a hidden file":          "+sT8p/ePUZYB6rrCdlGDYNfr+D8ja11ro5oEcpaKpU0="
							}
							code: {
								"a code example": "UmVqIef0f8H53lhPvZBcFT2iW0RLWWBDhZHGUWB8U1A="
							}
							multi_step: {
								hash:       "AC9JIP5K3B3ORG90BN908184FUEF2OPNI00GDVV9EJTUSQ0H21K0===="
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
