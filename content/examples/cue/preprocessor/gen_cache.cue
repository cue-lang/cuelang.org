package site
{
	content: {
		examples: {
			cue: {
				preprocessor: {
					page: {
						cache: {
							upload: {
								"upload initial files":   "gnNiXshIY5JZaE5MXcolQw63WwblErS/IG9pUY11kOk="
								"upload additional file": "tQxoZDfaPcmsH2MF69PZVxS4XhiAEGLdJ/JtS2oHhB4="
								"a hidden file":          "cA8bbIkA9AyMC9JwNrpXbzKRS6XaqN5fYtc/7kLoVmA="
							}
							code: {
								"a code example": "gXaRAphICBqf+/MjLfpDnQUhCAFeIo6YOIpS1fuLmrk="
							}
							multi_step: {
								hash:       "SPESNVFHJU3TJTU66KO5A1FGJMPB39VFIBBC9URUGVQ3UMD92GFG===="
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
