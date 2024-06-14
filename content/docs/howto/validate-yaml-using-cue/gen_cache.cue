package site
{
	content: {
		docs: {
			howto: {
				"validate-yaml-using-cue": {
					page: {
						cache: {
							upload: {
								"initial x.yaml": "EFi0KRtwhrTdCndbAHhVRAtZ0+a9hqrLoU86E0kpteY="
								"initial x.cue":  "+/rnt7+wWyoFRp0z/S1egLrl9BynCQSZQPbpfxC3yxM="
								"another person": "hDkVnnnJdiPP5Ht14O/q0VPyiAO3ogwcEaMGy9ichfs="
								"fixed yaml":     "JJWwJw6NeMwT7LOqIxWqvOQwiKnP2LOHHfvvxgUkCf4="
							}
							multi_step: {
								hash:       "3F46NDO6R92HQ1KTK2TMA129N0HO7MRBTKNDM3S5K4DLLB3VPTI0===="
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
