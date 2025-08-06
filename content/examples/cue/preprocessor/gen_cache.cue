package site
{
	content: {
		examples: {
			cue: {
				preprocessor: {
					page: {
						cache: {
							upload: {
								"upload initial files":   "rAF55GagVkBdk/E9/r5PwLVL1CN78IgVvxLEm0bfqNk="
								"upload additional file": "QDtmk3/IWKeR+F6ZRlTK/VgoyKY5oyjOs/1UjiJvUKY="
								"a hidden file":          "P9jV3BGyy3j6k94Kfxuo5KriOsi69NABFHE0HUgog7I="
							}
							code: {
								"a code example": "Dpla/vQY8wjtWuCEeUwYpKn2wEFqGSy/tjeZE/TYnsY="
							}
							multi_step: {
								hash:       "TG257BE2S45TFDHVJ8VNJRE1FJUN3FTHA31DT8FRVSADAI997PE0===="
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
