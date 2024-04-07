package site
{
	content: {
		docs: {
			howto: {
				"validate-yaml-using-cue": {
					page: {
						cache: {
							upload: {
								"initial x.yaml": "l4uZKQw5hGdCvomIbQmwFR5wn9yDRdf1NZ3H8Is+ysg="
								"initial x.cue":  "gPLNQzahiLCe7EIWN1KyTb2kJoLw0yQ9Qwmnk5tBcJc="
								"another person": "2297syxECAeEJoJ9eSbx3a3Mp35UbDNujvx91NcrnYk="
								"fixed yaml":     "T7Wn3gW50XoqE0X1wqQD0S4cI16Lhngg32aYNd3q+3I="
							}
							multi_step: {
								"5VSCH0HTFHQP8GECTJOQI6ULRML6FKUC0PIQ611VGV272J0OIQHG====": [{
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
