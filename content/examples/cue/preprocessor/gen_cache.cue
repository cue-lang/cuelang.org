package site
{
	content: {
		examples: {
			cue: {
				preprocessor: {
					page: {
						cache: {
							upload: {
								"upload initial files":   "v9WcLUmKL9sKYG3lelIAq4K4wSwsuPceKPJ9kzwI6HE="
								"upload additional file": "TsjDnGRqzLWocn0oj/pRyBFFn+D7H+BKSNJtT0VuoJ4="
								"a hidden file":          "UuFrT3hOevVOwsB3nfxNW0GtQx/M5cwzf4/1xTDfmdo="
							}
							code: {
								"a code example": "GjqnD0qu4RjG8LPAC2+RWjFiOwo1CIqXUByzE3k9vQM="
							}
							multi_step: {
								hash:       "V7HSJ4INGMRPGE57MB1GH9J40QHSADBKVKM5K90TD2427P66J1GG===="
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
