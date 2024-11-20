package site
{
	content: {
		docs: {
			howto: {
				"validate-json-using-cue": {
					page: {
						cache: {
							upload: {
								"x.json":       "8tVoWZNGHJu1soUIBRWmzN19WMeAUMZLwawdIuxx6N0="
								"x.cue":        "62Y+zMRxh7tyKr4ys94w/+/88l5cXbn2tIU45hNtABU="
								"x.json v2":    "V8o15BamZ8U0BrbauZernho12Meo6Xf5Y34+yk3Xqtc="
								"fixed x.json": "001F/b/vzsCJWPMs1Og1PSrgUrSCnIqJw3cEiHOMFNY="
							}
							multi_step: {
								hash:       "N3M3VJOOB2ROVFL02Q5TTSC5LGUGE71DG3UJ9ONJ6LHPHR2E256G===="
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
