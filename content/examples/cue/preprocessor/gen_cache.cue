package site
{
	content: {
		examples: {
			cue: {
				preprocessor: {
					page: {
						cache: {
							upload: {
								"upload initial files":   "RwYzusTIGgdjOOyhZn28bTrKZZN7EBRWR4+mlSo1wEU="
								"upload additional file": "vy8q+tC/oDK5I1VByxZ+LBYzwV8lsCv7j3PbnJ3ZRzI="
								"a hidden file":          "45fd82ufKAHLH0PTjnMEZHhCOyyPdi7TSEnih9YY4PE="
							}
							code: {
								"a code example": "srM0mM7VEXTt8kgUpGExo4hh0vMGDrPqmm4JZNWAccY="
							}
							multi_step: {
								hash:       "JE2J3QA0U66C3MR7F52FSAC7GJ8NII60PN5O150VHDE19DTUOV70===="
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
