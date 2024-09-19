package site
{
	content: {
		docs: {
			howto: {
				"validate-json-using-cue": {
					page: {
						cache: {
							upload: {
								"x.json":       "3YbjRupJbRWGTEE/c+4NultmrGM4xYzccKyKdA0CtzY="
								"x.cue":        "7gvaAMM/d5nApmBij4Cj6KLq1aCydgUWfeaeiVgp/RU="
								"x.json v2":    "MfcSTxRWJBrA2mOEU7vzs4VuLVyeWLt7FvJu1mNuL9U="
								"fixed x.json": "Y4lCHKcA3SULp+tEAua99/ETd410Gpbpix9WLAtX1Pk="
							}
							multi_step: {
								hash:       "RORAL8DKPRVVAIVOH3H4UILAB1B76MT49E9Q1HDCFUTS1U1QPR90===="
								scriptHash: "UMP1JTJB5F0SVS45CSPDVU8KSNKPQ7SI0OEVSC7IQVT5NDCE1PM0===="
								steps: [{
									doc:      ""
									cmd:      "cue vet x.cue x.json"
									exitCode: 0
									output:   ""
								}, {
									doc:      ""
									cmd:      "cue vet x.cue x.json"
									exitCode: 1
									output: """
											people.Rob.age: conflicting values 42.2 and int (mismatched types float and int):
											    ./x.cue:3:11
											    ./x.cue:7:21
											    ./x.json:15:20

											"""
								}, {
									doc:      ""
									cmd:      "cue vet x.cue x.json"
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
