package site
{
	content: {
		docs: {
			howto: {
				"validate-yaml-using-cue": {
					page: {
						cache: {
							upload: {
								"initial x.yaml": "1un83UfH7qAPvnIc9eRDqLu0DCPJ2D9N603GOk9fMfA="
								"initial x.cue":  "HoOI46/Ab6vFgwvGuDcDJ48TY/vi9OOdeSzx7ZVvr3Y="
								"another person": "GTyzlB4AmTZppPIzQ7MMqyTp1zrPH/63WnfkMDsr2Mg="
								"fixed yaml":     "RLQVHco45XMkKbStqVvqtksha/k4AcDuPC9nQcTDUlc="
							}
							multi_step: {
								"R0R5GEURG1F50QM7MKSDHA17922OQQOQG8NGHLE9I5L833VF4K90====": [{
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
