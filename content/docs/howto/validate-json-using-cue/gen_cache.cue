package site
{
	content: {
		docs: {
			howto: {
				"validate-json-using-cue": {
					page: {
						cache: {
							upload: {
								"x.json":       "qjFFNuR89SX8oSaDFQSteWaDfVZY1CpyuJGTvJ5wgkA="
								"x.cue":        "w4l4r6udqw8f1oWDdfX6oWe9Ods225uqh7IQ019QGiI="
								"x.json v2":    "kmGk9jYfBTZ2DpcK2Ttt0r7uQU58eQcXyNybfvaTQLs="
								"fixed x.json": "ZQGh2r0vvIeP7NPZRaikqDkrFIMcZwNbuIA+90MCKKs="
							}
							multi_step: {
								hash:       "5ADFAT1FPQEI19A5ON30RD73I90AF3HSDS0KJGO2KLAFEDR9BOF0===="
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
