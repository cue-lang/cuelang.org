package site
{
	content: {
		examples: {
			preprocessor: {
				page: {
					cache: {
						upload: {
							"upload initial files":   "mO1Hs0919C7U/FrsI4Pj0GC7J2zovUeXaGHrAEp5w94="
							"upload additional file": "ub8wIrz45ZyZ9JUCF6wd0Ju0K3i9/cByWXlOYMY5j3Y="
							"a hidden file":          "FbWt0uT+FAPOrzvoOl4nzXbFw358kDrkgdgpd+wjWLo="
						}
						code: {
							"a code example": "7K0LIQHjz8lHyE2JoeePSinLkmlZrJzR6KczgXqCYqg="
						}
						multi_step: {
							hash:       "H8I99N8DV4E92QB4B8KCNVM56G6F35O5DV9CHFE34UUT25SASJGG===="
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
