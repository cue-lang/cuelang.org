package site
{
	content: {
		docs: {
			howto: {
				"validate-yaml-using-cue": {
					page: {
						cache: {
							upload: {
								"initial x.yaml": "tIctI6oSmihA7xILRIOeYRMt7L6OCUmkmy/gIP6T01M="
								"initial x.cue":  "0pNZH+FjPumlAdZ80PXQJSlFo4r9doXK453X7t3xdVo="
								"another person": "oMyql5FjzZa5wVe9GyNFPSFRr8tOydbNx5EgxLU3asg="
								"fixed yaml":     "D1VfVYWFJq8Fw8mpbsy0Cj34c5mttTZDaBqsXaW+a3U="
							}
							multi_step: {
								"C3HJBR00TO5FK1SFDQOA34LKH712EK0A21MUQJGG1K5LO5HOA730====": [{
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
