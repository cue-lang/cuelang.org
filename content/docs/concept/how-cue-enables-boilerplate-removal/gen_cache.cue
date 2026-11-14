package site
{
	content: {
		docs: {
			concept: {
				"how-cue-enables-boilerplate-removal": {
					page: {
						cache: {
							code: {
								"intro: references": "M6WKf71VQ3YA/NxcSVo6SPJir3ud70l0YEPJyLRsjbA="
							}
							upload: {
								"baseline input":   "ie0mnhPhPA14CiUtjjvMTnDmv8TT1ejjBToCleCla7o="
								"baseline output":  "biHoz2CiC6zL8LdMF0ziYgT/Qrx7/HF/FjNuJfGm4oo="
								schema:             "McgnvuJUXnCmvmlnHYon0H6EBVMIk6oXo8dfMGkFfJg="
								"schema reupload":  "ZKi9zjYsHraORUfoAYatEaRsHqwNDMSC+Ay2Pni42mQ="
								"schema output":    "Xrzw/ipvuptaCM/cJDt7Ghr51/5xIHcd1h7bMfk1HtY="
								defaults:           "2IuvUyH0BHyNnVUsqDwwXcp065a6MH5+E4z54W7u4qQ="
								"defaults output":  "txtugmDkSk5AWNz7CvEI/Qwoiomw7cTVNC8us4Cryhk="
								name:               "UOEcEUq+fRtnskpqCUi5z/qgPyvGOKuo8cGgFmfDFy0="
								"name output":      "x9yoosjVNBkb7TcnShLgw2ZhcqFTiZ3n+1ajb3hw+Uo="
								"extra app":        "m+YFvNBDtjkd7w25/H064gOgBm2sDEnxwbY7zW8G5kU="
								"extra app output": "wsbQL3jJO0OzUXkjBOhFBvvYDM4s/UcmLEnn7krGZUg="
								"pre-trim source":  "bxrhcPvnY7OP3FQZqKnYxpVwiHa5i9NFHuiN5ERb3+c="
								"post-trim alpha":  "bnE/MAKX3WTSduzVjx85VhtjV75FaSwCbvy9OZN0zFA="
								"post-trim beta":   "SK2LAd2LqXZe0jVzKp5E03mcuKYKU6y2P3Z5CT3TD8o="
								"post-trim gamma":  "ABGLSAcui+W/oxQjYegm2fNkD9cyZao9ulbrwW3pC08="
								"post-trim output": "1T3akuARVKnKqREjxwKrhaBoDgHnaVWacghwvGMC/dM="
							}
							multi_step: {
								hash:       "9HFCM1CLDDHJBJB9MVC0MDH2SK3I6OFRC6Q85NCSMGLSHQMA5LBG===="
								scriptHash: "JIPADP79TIMUIMVVO8STGAUSB5BK8PD9HO8VR1AGQAL09MO36AU0===="
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
