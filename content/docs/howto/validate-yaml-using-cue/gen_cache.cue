package site
{
	content: {
		docs: {
			howto: {
				"validate-yaml-using-cue": {
					page: {
						cache: {
							upload: {
								"initial x.yaml": "Ymuh/G358VwEIvjYM5kwuXJbjELyjjRwYXIrALpTzTM="
								"initial x.cue":  "dIqQDX6/WYQgETugIEzpWbaPYOplQJ4haaQVqNW+I/4="
								"another person": "ONz0YNmXRM2ISjrbKy0byE/KvGD33I/Slw69zo8MMrQ="
								"fixed yaml":     "nV0+NRwO467OtCnheOrIkKQdzSl/xse7alvGUIwA3Fo="
							}
							multi_step: {
								hash:       "1QRH5G761VM9854009229IR9L3QK47F3FKLBDPITKI7F0N6UCPCG===="
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
