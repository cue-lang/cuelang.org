package site
{
	content: {
		docs: {
			concept: {
				"how-cue-enables-boilerplate-removal": {
					page: {
						cache: {
							code: {
								"intro: references": "iFNh1DAHnyv5mkRPbnie7W73gUn0fRxWWaSeIn5YNO0="
							}
							upload: {
								"baseline input":   "saM5EpYPMsVn4saB9Yy2KxP0XvIxkvOEVvb2UQz59w0="
								"baseline output":  "ZHk8vh3uv+NLabVl2jByORnQDc2038uYO6KR/kqVYeg="
								schema:             "8cvczOxc22PL+xUpvnlS04Yt8TjBjC2QFe92MJK8b4k="
								"schema reupload":  "1LMibbmcpatv9jt5H62PhUSkzmpukaF7zU9QAet8TcU="
								"schema output":    "q5I4sUHfUC6bAGH93ZaxlIewaDlwVwW/p9gGzv0JNp0="
								defaults:           "9Q9Jjs3WKVZRVGBIMV/Z4zP9EgH61TmVDP4upWr6lSA="
								"defaults output":  "h9ZU1ZCqYMskdxFSl6sKf24O26FpQNwqcieZIFWI1Zc="
								name:               "hi1nka9dNLBIiEVR1LnuKYuEmdGcxQT2LlTBenHH/f0="
								"name output":      "kD4SrUPI+02qgIWHsLwOzt1lBqZ5ZcfA5Rk2iIyabgA="
								"extra app":        "fMoimnVmVVTc/JfAE1CgxTX+Ts3XfeIfe7zopOU6XVs="
								"extra app output": "QmTJ2a3oSm6E/NXxp/g4AzJkdRF3xRE/VYQO+bevn2k="
								"pre-trim source":  "+LgT70+gGxGlbov0ZrkUTF8Dkps9t4YL7Jsi7VDajn0="
								"post-trim alpha":  "POB31hSMCXpjSN4gQ3kLaHHnt7u1yV9/0v5iExp5wOI="
								"post-trim beta":   "DJMLN94o+Vn7PXWA5joToWQtroFhGnKDjl9m4jBoyk0="
								"post-trim gamma":  "zv6WGGfMd/vdgKsHWodz21vJOBJJXRqOYM5dCjjBqp0="
								"post-trim output": "L19YN9gI63TORM+IVTVTl/9sgpKT7LwHFCRfE7lkcQc="
							}
							multi_step: {
								hash:       "A2HNU4S6IJS8F9I6U9SI7JH5I255S0DE8AIMHDL52E34E2QCVC1G===="
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
