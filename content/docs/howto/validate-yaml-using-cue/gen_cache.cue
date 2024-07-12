package site
{
	content: {
		docs: {
			howto: {
				"validate-yaml-using-cue": {
					page: {
						cache: {
							upload: {
								"initial x.yaml": "HsnkrgjqKOHp1EXWFa2ao7ejSr3lT76iim2iCRAG9Ko="
								"initial x.cue":  "5EAd19VG/9ekCyHfKazA0TQMps55L2/blwQxriABggE="
								"another person": "/pwYFat03UoUtxQwsF2vrrWQ+vFwna4HQg/sNf/Q1Ek="
								"fixed yaml":     "Zg6MgbYkY8jn8n4h9Vmv7RDapbqjgDnRV32hPOUXtoc="
							}
							multi_step: {
								hash:       "NHAA5TIRGD0I7LJP0K59HVSVS3BATHL0TQISC32UNGEFUJC6H0LG===="
								scriptHash: "7O25FPHJVUHC297BLS0S5A0O6M4E37ITUK3M1O5FHBH097GTHAAG===="
								steps: [{
									doc:      ""
									cmd:      "cue vet x.cue x.yaml"
									exitCode: 0
									output:   ""
								}, {
									doc:      ""
									cmd:      "cue vet x.cue x.yaml"
									exitCode: 1
									output: """
											people.Rob.age: conflicting values 42.2 and int (mismatched types float and int):
											    ./x.cue:3:11
											    ./x.cue:7:21
											    ./x.yaml:12:10

											"""
								}, {
									doc:      ""
									cmd:      "cue vet x.cue x.yaml"
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
