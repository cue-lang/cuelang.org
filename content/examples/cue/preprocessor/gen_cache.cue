package site
{
	content: {
		examples: {
			cue: {
				preprocessor: {
					page: {
						cache: {
							upload: {
								"upload initial files":   "u9wlzePauHmUz0841sDhuxnX/SGNvKIAr3giBsOZl28="
								"upload additional file": "1jD/9ZLGw4VAmrjfmrBtXWXGjlSxjjSuCddu52stGoQ="
								"a hidden file":          "sBTWFhNbDcItLfPb9HuYyfsyjS8HucAptiwzzt0BlJs="
							}
							code: {
								"a code example": "kgbUvjZFGK5MqbDzZfbx9WpHwyQQs3rJco8b8OTf7A0="
							}
							multi_step: {
								hash:       "PFJEJJJ2HLBB80DPVDMMM0EU5DF8J9J9142PFAD988BJ5GDLQIVG===="
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
