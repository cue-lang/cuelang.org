package site
{
	content: {
		docs: {
			howto: {
				"validate-json-using-cue": {
					page: {
						cache: {
							upload: {
								"x.json":       "BTN6GMJy25q9QkOOTnojMeDyPo9T/6IZ13MTrDqghxQ="
								"x.cue":        "o/sRS7Dl330f3M2Ie2BQ/TF46nvzPdowTf+RZhhTWbo="
								"x.json v2":    "qqJ0EZ69PCCP0E4uBw28sNwqNHsIvUc4ma+/XSCrODg="
								"fixed x.json": "65cdlKnoDQqGGeXaHGCk8aeQUcd9DDXcjDD1C+VydQ8="
							}
							multi_step: {
								hash:       "FG2JPU1T6CABON2PMI4LB5U63VIU5T4MGFTBHNKV1OQNJ6NQKPCG===="
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
