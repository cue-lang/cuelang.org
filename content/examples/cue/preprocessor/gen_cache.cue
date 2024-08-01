package site
{
	content: {
		examples: {
			cue: {
				preprocessor: {
					page: {
						cache: {
							upload: {
								"upload initial files":   "0WXTi2S5mnr9Xv3sFUQQ+EsMRG9f3vXpAS3wUvnqnR0="
								"upload additional file": "W3HRBfPoBX4/+kyxGs84FbbwrEgzKmvda1fEi/KM97M="
								"a hidden file":          "1t/sRX+Nxbs0QqLL/aMoBp53PclSqCnvtLjx2u5Sfwc="
							}
							code: {
								"a code example": "xlCrx04+ysvz9PxbwUpHmVC8g5FtVjQhOIm3W2F5NWU="
							}
							multi_step: {
								hash:       "CQ92BGA1J3EG9S46CNAR0RTHV6OOAHMKSISQA8AQPRI4JSQMF040===="
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
