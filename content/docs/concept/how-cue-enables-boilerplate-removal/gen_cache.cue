package site
{
	content: {
		docs: {
			concept: {
				"how-cue-enables-boilerplate-removal": {
					page: {
						cache: {
							code: {
								"intro: references": "KotVMlp4sEt7KOQPRdFK0XNzb08OIjlf41tKDuyNymQ="
							}
							upload: {
								"baseline input":   "zlolTznIUmyXFohwV84aAVSptH/FdgmzZUd/SksmZ7U="
								"baseline output":  "P3wXQHFy0UkNBiZPy5fK0+dFbPStgu5lKfKfTMs2B0k="
								schema:             "4+atJkNOosukWk0lrceZ/eYedwAUqEVnjLLWfBgiMlY="
								"schema reupload":  "mWulHgWvYPTurfvcy5Wx0eSCh/XA49fWLmPdALN/xhY="
								"schema output":    "FcIXZc0ctqiAabqGwvD3YiOPWeniPeNhzqoJYVh/qTQ="
								defaults:           "EeVGhjmL7GcxDaBcmdAwBQMxk/0ELhjZ4+Rzx7YaUzM="
								"defaults output":  "hWJTAs98HhxuQaOYC9CFdIRX4nB5ekH3wAfSdpw0QOs="
								name:               "o5mkBcdnIkBFMEs9FwEFim9iaaAxxYpbuvl3jlt1VAA="
								"name output":      "nPUvhw8qPruWZg87Y76Q6iDNjxUpDE/d2kNpBv+cC3Y="
								"extra app":        "bDPFNgh1HAuoxXSso4BbyIvzOdKiZLnDO5GEI84/vd4="
								"extra app output": "AgRDYPz2wSvHL+KDSmeNALJVwMJXEj0BSpWJcALJWrg="
								"pre-trim source":  "tqENm60ug4s80eYzi0m/8t9wh8LMWx4633evkysTigY="
								"post-trim alpha":  "SiurRc9O8RQYF5w7p44zHDbkT2/cYVOAwVX7XlTQ4PA="
								"post-trim beta":   "f5XpgoVC58o0tvXXDek9WJuRBvVdZ9LynygVA1O3DHk="
								"post-trim gamma":  "Ojfum7lNqWM9d9A1uf8sU9gwo5I/9obAZFdf88Ci8Ys="
								"post-trim output": "03B37zcgs2aQknnkIv/QKTf06MmijiVsHyuPqNxxO6Y="
							}
							multi_step: {
								hash:       "LEP3L21CFT9S293D2TGRJ49GD3II7ISC33K7M81HJENDDCLVF8KG===="
								scriptHash: "KOHOSQ50PPFAKGQVSRD4I3Q7TU957F05QL50M7RAI9OC7ASE4J9G===="
								steps: [{
									doc:      ""
									cmd:      "cue export -o configuration.yml"
									exitCode: 0
									output:   ""
								}, {
									doc:      ""
									cmd:      "cue export -o configuration.yml -f"
									exitCode: 1
									output: """
											app.alpha.port: conflicting values "8080" and int (mismatched types string and int):
											    ./a.cue:3:13
											    ./a.cue:6:12
											    ./schema.cue:6:13

											"""
								}, {
									doc:      ""
									cmd:      "cue export -o configuration.yml -f"
									exitCode: 0
									output:   ""
								}, {
									doc:      ""
									cmd:      "cue export -o configuration.yml -f"
									exitCode: 0
									output:   ""
								}, {
									doc:      ""
									cmd:      "cue export -o configuration.yml -f"
									exitCode: 0
									output:   ""
								}, {
									doc:      ""
									cmd:      "cue export -o configuration.yml -f"
									exitCode: 0
									output:   ""
								}, {
									doc:      ""
									cmd:      "cue trim"
									exitCode: 0
									output:   ""
								}, {
									doc:      ""
									cmd:      "cue export -o configuration.yml -f"
									exitCode: 0
									output:   ""
								}]
							}
						}
					}
				}
			}
		}
	}
}
