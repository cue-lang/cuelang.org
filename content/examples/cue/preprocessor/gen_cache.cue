package site
{
	content: {
		examples: {
			cue: {
				preprocessor: {
					page: {
						cache: {
							upload: {
								"upload initial files":   "RgWO7LuXaIiSbotY7MEm+eWzVUhYTkjDNZSIque/CmI="
								"upload additional file": "sJRh5z45LI5QA7KqRiBIophIFX6vKMUeBzcw160vezU="
								"a hidden file":          "dgkyZPq05jFf/fMxBjpbeno/zk4AV35SuHnU0HrZ9ak="
							}
							code: {
								"a code example": "KH7tHvjkQf5WBcwiX/sZkugHaguIIn9U+wPO8QLu8M4="
							}
							multi_step: {
								hash:       "REIB8CTH2V1K1OBK9K8C7LERJOU6VDVJ1KA0TEOG8GFFR0R7RR90===="
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
