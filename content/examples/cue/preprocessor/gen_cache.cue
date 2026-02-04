package site
{
	content: {
		examples: {
			cue: {
				preprocessor: {
					page: {
						cache: {
							upload: {
								"upload initial files":   "pOJVsZaU3Do9/4vPYt03uQb6vcWJPtBz+nHM5VZjP4w="
								"upload additional file": "7cw7IxWFaGr7WNHdZ01l5VDmCaRR3zSTOHfT9iIqg94="
								"a hidden file":          "xSZWT/V5ISR1klL7TQmo4LmnevXRpswMuIoldJKjFag="
							}
							code: {
								"a code example": "+k5iKm9TGANlwBnqUjFHrewiEn3qL+WxBgAdEioFWNI="
							}
							multi_step: {
								hash:       "0VQ8NEGVH21R9NJUIPT5AISPG44JQIRQRPJGJT18LAURGL708ING===="
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
