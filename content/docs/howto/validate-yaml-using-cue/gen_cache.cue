package site
{
	content: {
		docs: {
			howto: {
				"validate-yaml-using-cue": {
					page: {
						cache: {
							upload: {
								"initial x.yaml": "zLyOViw/VLyAN9hCyyJBFiFaD5+02QvZt15TU8VoT9w="
								"initial x.cue":  "tD4uXqfSe88AWYy1h9IeK/HjaHr/OOYA8qpJk4IoB3s="
								"another person": "EC31YfSibbm6Dg9bgZyrEsh/qTKPQxp0gX4kCi2itLE="
								"fixed yaml":     "1QHypMTbh4RqzwU+nO046g12Jb29xUfOOXnUy6kFzzU="
							}
							multi_step: {
								hash:       "BHM702PFAC9DHRKGKM6I5IU6D6COS1U1P82QS71227POHT31H950===="
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
