package site
{
	content: {
		docs: {
			howto: {
				"validate-yaml-using-cue": {
					page: {
						cache: {
							upload: {
								"initial x.yaml": "Df8lF5a17SdCAuNe69Kg8AnUlZp2c9cWPmpqOBVzS5M="
								"initial x.cue":  "noTsXX2vKzQFbV8WwlRgZXZ8ssey/ZlUUmR64oaXtvM="
								"another person": "rgPcATQsg3eS7hfias/ENnosxig80EjnmPuhhJtPqyQ="
								"fixed yaml":     "9Kw4IX00Qy7Xx/vKqVuIczoAN0SZM8oKygah/bLFI3Q="
							}
							multi_step: {
								hash:       "9OC5O4E4AGHN0FH8J9H6B49J0AC5OOM6UD3A0TVA56NJCE14J7V0===="
								scriptHash: "C4EFM89Q7KNVBA7IOJ3DV94IERP38E0P6JP82M64M56U8OD3P5B0===="
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
