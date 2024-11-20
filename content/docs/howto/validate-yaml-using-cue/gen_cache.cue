package site
{
	content: {
		docs: {
			howto: {
				"validate-yaml-using-cue": {
					page: {
						cache: {
							upload: {
								"initial x.yaml": "JQh0Xh2N3/Bb15/vaEV+8wZ+klxJQO3CwVWCZ5WeAqc="
								"initial x.cue":  "/uB6CtippLFWdef77HWcq4I2IoTiZZul5cKiof1E2T4="
								"another person": "IamK5jPMYo2Y7ZNld3gOjhUKCKAAAKTjfXUuveqMOW0="
								"fixed yaml":     "gBo85oqsuY+I7XZqCrMLw1tq6R2vgySO9PNoKLSFlYk="
							}
							multi_step: {
								hash:       "LAR07R36J4PIDORU0HBLT40ERR005CS5AT6K1E03H7UEO5EJ1I60===="
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
