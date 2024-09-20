package site
{
	content: {
		docs: {
			howto: {
				"validate-json-using-cue": {
					page: {
						cache: {
							upload: {
								"x.json":       "hg46vtuXBQEZ/SuHQlBAThvSGcFcWeBmqy417Y3BNKE="
								"x.cue":        "40k/C4QhMxxrn5nLMZngXWViLdVdgvItjif9dO1oX+o="
								"x.json v2":    "oN71rkSndlrOLEeRp6WJv/Vdu2ozmOa8d4uORuIjNjk="
								"fixed x.json": "wxotuu+5SC/9b3Y5CDRJQ1c6wrEH+UK4Ht25nceodeY="
							}
							multi_step: {
								hash:       "MJC312URFVBG02GM20UQJN9FA9EQFB0ET82STIFO69TPMCU4M0TG===="
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
