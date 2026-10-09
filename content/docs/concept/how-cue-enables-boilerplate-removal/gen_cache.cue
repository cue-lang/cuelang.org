package site
{
	content: {
		docs: {
			concept: {
				"how-cue-enables-boilerplate-removal": {
					page: {
						cache: {
							code: {
								"intro: references": "zb8UmxfuxLKK061wPUXsk99O16Xvj7uGVsl8yT0cQrA="
							}
							upload: {
								"baseline input":   "nyJ7Xi0Hpc47k0uR8qMyBQNmysTWEEZaZq9q7vDAtvs="
								"baseline output":  "nc/xVeubvnMbzLj47aBrdl1Bh83tNPkHHHF3mW+fPh8="
								schema:             "3TC8yo8UJGa+Xe+4XBJp02UrNRgTKEM/ErQwDHGyxHk="
								"schema reupload":  "hlWNdBy1IDDhNHSPqNNnjtM74WSvJmgOuVAtfgHaeK8="
								"schema output":    "j9RJiyRnSz/JylY4i0Xlp4K/R0YTyptshs8tDorLzRQ="
								defaults:           "a+JvWlbWKX+r17pq6zcWILVKJygzTduPwcH4gEboN8w="
								"defaults output":  "y0KimpotwWA5VYPgIUZRllhIm0Eif7BdT5abBEWU3UA="
								name:               "+XScEYY53RnLPxuGh80Ilub+/sfH5QDCkYyEsE2LCVo="
								"name output":      "3vwqIbvipKkA/HefNCkqDKtyQ9gfFt98eyTpRIRLITo="
								"extra app":        "90xh4C0ES3r6Itbz41gfTe7hEo5GhJF7Za6gdstssgc="
								"extra app output": "Z8xkCv1+sGfLbjaiNyVAkO+4fzR+jfYq0SBP7Rk9fOc="
								"pre-trim source":  "jHMUXYzp85Mie7Bczay1TSjsGxqIGnVgoKlVgefO/4U="
								"post-trim alpha":  "a+yT+dwJh+y3PEZ+M4PpSGpDavr0qeTJmEmyPOdfPLM="
								"post-trim beta":   "qMV5c+RJpFnLLu76Om9dF7WSlATRPSp4sgirIiuV988="
								"post-trim gamma":  "zRziZftW+Sa5cP6bJZOARysTyIw5cAfgrIXGuppg8FA="
								"post-trim output": "N/yVWNZykayNf6WUAV+EDyAfuHBDe+bK+xgbtVPTXPw="
							}
							multi_step: {
								hash:       "1O24AR0JBV06ONMPA4FOBV12UFONGN0HFPIJMO9DNG05J2AM9G00===="
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
