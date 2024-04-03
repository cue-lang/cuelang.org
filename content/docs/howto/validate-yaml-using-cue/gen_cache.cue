package site
{
	content: {
		docs: {
			howto: {
				"validate-yaml-using-cue": {
					page: {
						cache: {
							upload: {
								"initial x.yaml": "LX35jgn6fTtpfIH9bHfhUmNILKQ4LkVY5w4PHH2iz/k="
								"initial x.cue":  "3Nx6g8go+X2uPGdUNtaP5b0JMApOdgAbbqEJgjDmg0Y="
								"another person": "b2QpDiC8STi+Zz3NlLzDm8IIZhIMLlX5dU9phRt0/Q8="
								"fixed yaml":     "6duRlNe524nW9ZN8fNuVOsELbyUjQtlD9pDhRg6VJVE="
							}
							multi_step: {
								"MD9D68HIIRRFOMPIGB9V886L7TGE2EFC280QA6PTU9NOTSUHM3EG====": [{
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
