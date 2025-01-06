package site
{
	content: {
		docs: {
			howto: {
				"validate-json-using-cue": {
					page: {
						cache: {
							upload: {
								"x.json":       "0pEJ7RmaTfdgeQ8DGY9lBlXS5fGM2thdTsW6RE/E7IA="
								"x.cue":        "Gzi9zNmfnx1D7QVTiFsnXlbMdaaN08aoXqE4r6ABEvM="
								"x.json v2":    "6VdYZ1+q4i0M4bsqP9j1wLXRYPdBnfeP3ICjmeVeIvE="
								"fixed x.json": "py8jz40bJEd3/MrG+nyepjwYP4lH9ZFfl8CNHvxF+WU="
							}
							multi_step: {
								hash:       "DKVMGN0M69O2PK3JT4ADA95IBKL37BM3AG66G0A0GJUEE7AQHB40===="
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
