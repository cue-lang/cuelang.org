package site
{
	content: {
		docs: {
			howto: {
				"validate-yaml-using-cue": {
					page: {
						cache: {
							upload: {
								"initial x.yaml": "jXKmNGEVEyp3Bd0wflVc+aSvipEqkgxUVSxCjVD6gfs="
								"initial x.cue":  "zQulfDhbFWXKGNkRsqFN3o5p1K//JJuHgleHrMwhbvA="
								"another person": "tJ4g4clZMU7khkXSjamcftESfY/DFLz1S2cSqO/GlII="
								"fixed yaml":     "ZBEyxjCKMZ2j+SXguKvBuHr5K5T1HNQuKZyLNccmdwA="
							}
							multi_step: {
								"AA3S0KA036TGP9JPC8GVLSP8LOUGLDUIJH28KN8P78L56LHRKRB0====": [{
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
