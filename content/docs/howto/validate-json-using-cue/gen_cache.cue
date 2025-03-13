package site
{
	content: {
		docs: {
			howto: {
				"validate-json-using-cue": {
					page: {
						cache: {
							upload: {
								"x.json":       "5OaQlEMJAM/hGM48GqDYTSI7mSmJx3GAglUJ8DDcXKY="
								"x.cue":        "Ujr8Jx/8UWbQ7plrNBJu/g388zBhHQWgIxHYtf+rVI4="
								"x.json v2":    "uJ2JlcCqQjJIxVjBSw4Nx6UmPjtc/dk/4yp46ES+qzU="
								"fixed x.json": "m9I3BjYJccC21YMATVMeGEOF1ux4o+llv7oZ2qu+u7E="
							}
							multi_step: {
								hash:       "LLJI09V95MGL5VQ6JU1FFC06207LD8V90F5O8PCB9123IPQHPGN0===="
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
