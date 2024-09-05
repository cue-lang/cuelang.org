package site
{
	content: {
		docs: {
			howto: {
				"validate-json-using-cue": {
					page: {
						cache: {
							upload: {
								"x.json":       "ro03cG1MExSijgBSdRBGJ9VSHBxuMhFL031p7T/sYiY="
								"x.cue":        "pLDtcxp4r4U83MzXvfoLc8PBtl6rWvaPby8yYIDGtZs="
								"x.json v2":    "u1gOCwVWmzbYiQGPScQCpqNWFK+F6OeKPhy4roAufjA="
								"fixed x.json": "i/C3ZhuUzGLm4gqC1QfORvGshA/OYRCces/v1YdiQgo="
							}
							multi_step: {
								hash:       "9REI2T79JJNJMV8H8UA0JI6S7VJ4R0QKCJVT0BCBNTTUCLD745C0===="
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
