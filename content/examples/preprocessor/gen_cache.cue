package site
{
	content: {
		examples: {
			preprocessor: {
				page: {
					cache: {
						upload: {
							"upload initial files":   "GwysNn345t+GUto0mHL5I6JkVtDIdVilV/gUjk/G48Y="
							"upload additional file": "fNg39vvOP9NBoCDqoLKgc6AKW+9Ub9SHRXIZUrApxVY="
							"a hidden file":          "LTUPexr7UFYTl1hYWcgFbzoOrDdVIo64cI2Iw3mlmGQ="
						}
						code: {
							"a code example": "Tl/XT+Qhm2HRmTpj2c5RZEAF/C5zLW0uD276Nx2zNz8="
						}
						multi_step: {
							hash:       "U2ODU91BC6A62CTGB1LEGMSF0TC6Q0ELHNB8F3GJ0K3H53BU500G===="
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
