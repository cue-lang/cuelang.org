package site
{
	content: {
		docs: {
			howto: {
				"validate-yaml-using-cue": {
					page: {
						cache: {
							upload: {
								"initial x.yaml": "X5a/csZ3vIViLcteN386Gy8kAGtK81yOOFYGXEMnIFA="
								"initial x.cue":  "d4Wrxbv3x3iQPygcMd6KuNdxYIUf+mBqI597fp1ECYE="
								"another person": "f9QjPvJ7XT4OVbnA6NVQkDPaOf5yFxI9lmFGFXjvGvo="
								"fixed yaml":     "+USepbmdfIM/3o7BdYqpK05Rnw9c9Hu2EMlF003vVKo="
							}
							multi_step: {
								hash:       "I064CEK8V76KD7E5PLHDQCAV05EDITFD8R1UVLPC9M930FK0FFUG===="
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
