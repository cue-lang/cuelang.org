package site
{
	content: {
		examples: {
			preprocessor: {
				page: {
					cache: {
						upload: {
							"upload initial files":   "zywPqWgu/ctDoKoMWDcPnJK8H+2Q+AtZAfS+afTT3Js="
							"upload additional file": "wsdb0uPtvY4GTjwQkzgDuEzv0rygk7kSNa1FDYE5ch4="
							"a hidden file":          "CqD6wdWVac7Ko0kXn7+h24U+A3HhwDJ6ByJDRGT6cTM="
						}
						code: {
							"a code example": "J4SdVeNJDALfMFVTDb6cm8najnENUwQb6AasfKtNzXk="
						}
						multi_step: {
							hash:       "D5ARL8FNRHD42VT2PLV2U4IG0EC2RTRETRGLRB5L7388BBEIMT3G===="
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
