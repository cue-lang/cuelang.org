package site
{
	content: {
		docs: {
			concept: {
				"how-cue-enables-boilerplate-removal": {
					page: {
						cache: {
							code: {
								"intro: references": "fSB2d2g7F93uelKnpOlL5KjJsRTh1hgtPedrNiMgVdg="
							}
							upload: {
								"baseline input":   "fPpDVGkKSDdbwgA8sJ/tiw5Fn+tHbPmdhx8CzlfSsR0="
								"baseline output":  "eMkoZhC8/CvRjbnHirWiFWeXz5L/KJ1FV78zKEBFElI="
								schema:             "VG3ibgWWy9zmD7ZT1r3hpCKrXvS1jpto555uH4CrPgY="
								"schema reupload":  "fORqXyJCB+LOlCqB9VpQNPKrPty4z40FyBympjoYOuk="
								"schema output":    "pttUuCiufeVCZbs1ZRF8pc26WH81s3utiw3lPC75vKM="
								defaults:           "R6TmAk1hub0Sjdpw/3I2lT6EBan51NkJXap3WAIkRyk="
								"defaults output":  "xJwleqUfPs4LQaobaZDShIrrSawXjbzjTeMcT012Obk="
								name:               "8M1FHQgufPKP0cqLynjR5cPiiuJ8HeaRqENxypR3+ag="
								"name output":      "+lQxPWNBIEbVuihxKitS73iCfFP+GCYb57KF7Xfq6Ko="
								"extra app":        "GM10AUKJhYXGiC0tgRhmaVBXcRxuvef6NNdWGmUvCCU="
								"extra app output": "TWlzmeoUdsJMypV3gj+UzZg/0nN8/GpOGLSQyc0J/+E="
								"pre-trim source":  "XZdn76SxfFHgcvdEyFMRYDIR9TDbDJyXrHVo48Qd7W4="
								"post-trim alpha":  "W5Uny2O3Cm8AaJD0JZryupetzG90H0VqOACZxxXH/3M="
								"post-trim beta":   "i8n3SRHJltrhEsXROndfnkiNIcKPKGAACmt4NJceJss="
								"post-trim gamma":  "IIL5GJ6g8fF+JJ8gEfa94XvYjVndO2lRxYnbg2oAgrw="
								"post-trim output": "/87PcOEsyI9iWI2uJlx073l9NOBRlB0YRtRQYtrK5WM="
							}
							multi_step: {
								hash:       "BG4BULA7KT8DDRVDM9A6H7T7TEJB8JII5I5P23ANFIP7QJ9CG150===="
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
