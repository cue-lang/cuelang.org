package site
{
	content: {
		docs: {
			howto: {
				"validate-yaml-using-cue": {
					page: {
						cache: {
							upload: {
								"initial x.yaml": "+sPU2EubDKHab6mmdjRkk3DELnuqypGlsTaV3kXQ9gE="
								"initial x.cue":  "JYJOh4wH+zZXRD/uyRGjFwWo63T3Ef4/EjSHVcsYD/o="
								"another person": "XE0dkF+egD6LsxY8zxDWB8qJQECeLiLokveIRhzo884="
								"fixed yaml":     "s2o0b0wRK7eej/xDIecCXDAwBfW03MvQ+qkHvFYCyO8="
							}
							multi_step: {
								hash:       "E9TS2OAF74DVA516INPOJAI3304HBTM3T17UPR2AGEM7DKUQG290===="
								scriptHash: "FCVR3RQM9KMC4K4253KBPI107J84GMJJJ8ULKG41E4AVUBFH6UUG===="
								steps: [{
									doc:      ""
									cmd:      "cue vet -c x.cue x.yaml"
									exitCode: 0
									output:   ""
								}, {
									doc:      ""
									cmd:      "cue vet -c x.cue x.yaml"
									exitCode: 1
									output: """
											people.Rob.age: conflicting values 42.2 and int (mismatched types float and int):
											    ./x.cue:3:11
											    ./x.cue:7:25
											    ./x.yaml:12:10

											"""
								}, {
									doc:      ""
									cmd:      "cue vet -c x.cue x.yaml"
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
