package site
{
	content: {
		examples: {
			preprocessor: {
				page: {
					cache: {
						upload: {
							"upload initial files":   "ex3aIpl2HD0znx1J1eZItj0TE6LY3gN2yPgtkjNIzUk="
							"upload additional file": "dLeFJKWACgr73uT8+saYizjvRgaC5YsXgubS/ePW/pE="
							"a hidden file":          "twSeIJT7HcaexgVtNTI5JhWZMkze1xitRzTyX3gyDoM="
						}
						code: {
							"a code example": "paYPGQjycT+y/9pZzutqkuKAJkI5v0f+LiFG4JSj0kQ="
						}
						multi_step: {
							hash:       "D0R9OONF1M2D2FSE298TUUGA8OJB0DRTNME2RFPSLJHH37OKK9L0===="
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
