package site
{
	content: {
		examples: {
			cue: {
				preprocessor: {
					page: {
						cache: {
							upload: {
								"upload initial files":   "LuQLGPhL4EdUCGw/2U2ywbDBGevnQZYF/fptaOYdqhg="
								"upload additional file": "qaltZ6X6xR3UfLnyvswXUiYQj+q8HB+CjUP3NSyqDFY="
								"a hidden file":          "LtPqiRw1mGm1VC21qUbiGWJAVqcabsZpuvMtALq3eyI="
							}
							code: {
								"a code example": "FvkHGgo86E0NLjqI/Q0OWe0WamyNjsCIUSFQvaej698="
							}
							multi_step: {
								hash:       "INJLO5GOQ4ADHB996N45OMP1OD580N7I9DIC0USNP38HO1JEFSIG===="
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
