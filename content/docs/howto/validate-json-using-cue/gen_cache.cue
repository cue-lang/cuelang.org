package site
{
	content: {
		docs: {
			howto: {
				"validate-json-using-cue": {
					page: {
						cache: {
							upload: {
								"x.json":       "kIZi0zH0zmTTbo/Skw1fvRRM98673bI6+AHoBuhzUWQ="
								"x.cue":        "zmgsunh/qt+YA4yfkekBW6RJH+JQ4W0yYzL4x0WbbAg="
								"x.json v2":    "2qZJYhX6sbS01rJTmJ3zfqF0Hvaw88ACQitU8ppWL3U="
								"fixed x.json": "z0Cs5ZKSTH8IJzuOfc8l9GnHOBOoRpd3KvGMAQF7gvw="
							}
							multi_step: {
								hash:       "C88QE097R3R4KTOFCESSU28HFE5E9ROVREOAJG66QAEIBEN2KS1G===="
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
