package site
{
	content: {
		docs: {
			howto: {
				"validate-json-using-cue": {
					page: {
						cache: {
							upload: {
								"x.json":       "8Yrfu+9pdhv9g7K4QZjq3GIrE0jS03yQcaYSdFOcf9Y="
								"x.cue":        "gqNfz3Av/67xNqtJMQRfmgPLGz2bDvoEJxs1b/srPK4="
								"x.json v2":    "R7fe5W63gQETqAN0W3HlULvXYjB2k67nbivWtKcw1+0="
								"fixed x.json": "/pBNY9ux7iSUZ4f+Ag36O0OvbxS0oRr9gxZXxB9XVd0="
							}
							multi_step: {
								hash:       "VVCGC36MI1VFA5IJ28094B8I35K0054IFA807FM73S3NLPNTNBCG===="
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
