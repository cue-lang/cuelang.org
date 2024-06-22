package site
{
	content: {
		docs: {
			howto: {
				"validate-json-using-cue": {
					page: {
						cache: {
							upload: {
								"x.json":       "mWT3DDAU53R4GPqKtsdgbIFOIO87isnFtusivH0QZfA="
								"x.cue":        "F2BlE5Y+wfQffeHqU0jpCDWdEhxl8DOBMOuMqUcs+Hw="
								"x.json v2":    "NMqR/BUsKvn4cO1Cg08C9vcaRbOFMzbYCTkf8mXhuEk="
								"fixed x.json": "pSm1MF5r0iXtHXYhBfsYWmggj6EWslV6KDa353v/V4Y="
							}
							multi_step: {
								hash:       "G18QCQG0SC2IA1G8QG1FATVFL9ATO9GR2LN5BB1EBLCVPGK5DPQ0===="
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
