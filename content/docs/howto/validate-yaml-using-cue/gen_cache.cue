package site
{
	content: {
		docs: {
			howto: {
				"validate-yaml-using-cue": {
					page: {
						cache: {
							upload: {
								"initial x.yaml": "79JOyuJ7zhW2tizb0KU6mGDRebpNKTluokqK96Blsmg="
								"initial x.cue":  "rnEXXsT3RzX4/qZMrHzSbp+HjoqbYxddTlf5laej3Zs="
								"another person": "wczbzY/dG+cqqskDNPHZ2lR26XESRltEhTc8jgKLxaE="
								"fixed yaml":     "HQXk5+WgSRzh0O8nvaFsDNz7RT1PMsTQNXVo0uEkEYE="
							}
							multi_step: {
								hash:       "S78994970ED3DHMRUTNPGSD58UT0EC2U8T604F6GGV33MCOCROQG===="
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
