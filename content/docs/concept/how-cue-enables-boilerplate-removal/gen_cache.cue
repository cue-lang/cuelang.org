package site
{
	content: {
		docs: {
			concept: {
				"how-cue-enables-boilerplate-removal": {
					page: {
						cache: {
							code: {
								"intro: references": "jlRoGhxrK0wzOfDvqHCDEGZhAHNwrlXNTPpmYmUdzIw="
							}
							upload: {
								"baseline input":   "WZpcfxenZdAxCy5NNEDgpLaHAVjYdywdPhHDowZwJ3g="
								"baseline output":  "f8xOvJVtKN2f5qLXZm/v6r61GfRUJXmLn5B1nYx5q9s="
								schema:             "+VUeopQMLNb9EvD0B0Hns4TdkWuPPNU+o8/f3gi0PoE="
								"schema reupload":  "YP7p8YkNguRWhoPp/WybWetNNsTlVMjoCD+933KnET4="
								"schema output":    "sxGHm+TjwqUcgiDhDj0uMuTCBUm662va87W9fquqPFM="
								defaults:           "fqx0dcFUJ7dgjwFqJizYsAdVQobXcXyYJK3pcBCNlVM="
								"defaults output":  "2nwfy04yRXq0ktwXTjTG2aMN1gfU14dz50e2imrL/1s="
								name:               "DIKf/lLcQUFK3Orp7C2+vRdExpxjYSHZAy8Qvz70Tbg="
								"name output":      "bJ8yr68URTB1i+qy0u0vQLQyp3QjWQtJoUYeXAtLg9g="
								"extra app":        "ZMlOlTs6WFya99qOWNR1drwa/BX68PJSHOgZGlWsB9w="
								"extra app output": "ya65YXXZ192l5LxOarkfWjFROSqkCiDuKxJtSd3bfU0="
								"pre-trim source":  "jby3ISPbvlreHvC77oIiqUPAAz1885GGJCMbY1TPwAM="
								"post-trim alpha":  "l+yekzT17OB6a9/tDmHemtjmqNh6YCTl5nhsfPT5+3o="
								"post-trim beta":   "51yLZy7mOq5fAB58OY7AnSXmrcYzkVPg+g/5ZeFP9Pk="
								"post-trim gamma":  "FdlXU2aJVmXQheU74Irzbl8bYRE49+3vI3T/aSi2C/E="
								"post-trim output": "as0YkT9J1ZCgS+aeeFksAazBEyEia3HwIje+qRn05dA="
							}
							multi_step: {
								hash:       "9B55H8I5LLJ5HLA3LRF543P1LDEO7T1KU2VM4FC1QF1K96L1H35G===="
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
