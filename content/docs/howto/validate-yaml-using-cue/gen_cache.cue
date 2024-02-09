package site
{
	content: {
		docs: {
			howto: {
				"validate-yaml-using-cue": {
					page: {
						cache: {
							upload: {
								"initial x.yaml": "yMvvPptsc4MJ4IlEBvm7i4RFWh0iJMvg/p8cEIJPX4k="
								"initial x.cue":  "oEZ58df2qsnr5pgN/EusoHXmdJSjPcjlt7BlUoLD/YY="
								"another person": "VKTRYTQVGDOnGYSTSKJtNcqWhX6UD24GlVYksbChDT8="
								"fixed yaml":     "R7Uqby/GPiOrkvoA9wcRZeDnb/AQ6LHxM+NN9c0/EQA="
							}
							multi_step: {
								"EB1D1S992T4IMHAM5M7QQF831UU18L9D73HSQVT7V4J7BCSL2BV0====": [{
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
