package site
{
	content: {
		docs: {
			howto: {
				"validate-yaml-using-cue": {
					page: {
						cache: {
							upload: {
								"initial x.yaml": "QUbiofBnJtHKzq6EIPhoN/A2gW6+ILC9CJINgIVtyTI="
								"initial x.cue":  "LwSPYRIJnWnV1cwBal78GG7J6/D8NOnjm/uQA/HhRtI="
								"another person": "2X5jHrzDIc43LwLpX20RQs9EFft7UXqP1qeF09A1cNc="
								"fixed yaml":     "kO8pjGRr54F3ydGfb8IJqzfz1hE2LWanzPtLIv/OFLg="
							}
							multi_step: {
								"UCBLVK80I1BMIC5GS4VI23IKKG9EDS6JNNRHO7CMTHD4ERPIIF60====": [{
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
