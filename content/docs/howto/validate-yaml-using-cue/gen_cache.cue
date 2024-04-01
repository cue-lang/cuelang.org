package site
{
	content: {
		docs: {
			howto: {
				"validate-yaml-using-cue": {
					page: {
						cache: {
							upload: {
								"initial x.yaml": "U+grT6d3aMh4eLJuhn/Is0zEkxtEWAmBa6I+mgPeGo4="
								"initial x.cue":  "A/JFRI035zxvPkhINqgEHhk+rgZc9YJfKc0jtDuFt4g="
								"another person": "xOH8F4Y+71C64s9R0Ka28hF5RSdYzWtX9L1wql5jpuI="
								"fixed yaml":     "djuPx1GOvWoEkyu1fXMTZ4Yd3QJNOZcuLGzox0F68MI="
							}
							multi_step: {
								"TLK2D7EIR1GDD6JOK0QN0ID001ACLAOV75UULN5LDQBILR3A7OIG====": [{
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
