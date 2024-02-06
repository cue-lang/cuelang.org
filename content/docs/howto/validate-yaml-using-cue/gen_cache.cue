package site
{
	content: {
		docs: {
			howto: {
				"validate-yaml-using-cue": {
					page: {
						cache: {
							upload: {
								"initial x.yaml": "6oS7DcznGctU9eBMJtSLpam130X98zVAy0iqTi/c8DA="
								"initial x.cue":  "Z937/j4dNRrbEfns5Bxd+TPQeb2673Ob8NYr3RRvUK0="
								"another person": "QtDSjB8sKYcF0O6gaITbca/g4BCfgt53oWEtzsS1dvs="
								"fixed yaml":     "pNLcM7XwnPmy2USz9FNXGckRdYhw+GUcnjcz7z4JS08="
							}
							multi_step: {
								"UOU7OM58EBDNDBGUNT1H717F708KPV9OE1RI8JMVHE23M69NH6QG====": [{
									cmd:      "cue vet x.cue x.yaml"
									exitCode: 0
									output:   ""
								}, {
									cmd:      "cue vet x.cue x.yaml"
									exitCode: 1
									output: """
											people.Rob.age: conflicting values 42.2 and int (mismatched types float and int):
											    ./x.cue:3:11
											    ./x.cue:7:21
											    ./x.yaml:12:10

											"""
								}, {
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
