package site
{
	content: {
		examples: {
			cue: {
				preprocessor: {
					page: {
						cache: {
							upload: {
								"upload initial files":   "HR+1vW22RjJc3vyJJqTTkT0uLo2XpSwMrHiF8XlX0I4="
								"upload additional file": "gGbUYSzAr+TD+/clmn/VH5sni3lyGezAzxuBC7BMygc="
								"a hidden file":          "paDKyN3O/JTUXwUc0Tdp1XW8T8Dd2U+uq3k+bgM1fno="
							}
							code: {
								"a code example": "duHy294DXuO4iJEUtFup5VObKJNemixEwWiYdF8paqQ="
							}
							multi_step: {
								hash:       "0F1NHLRILTUTL29PKMHOLC5PO6MJCDQBQAH0TMBB5DQQ6L7UBSJG===="
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
