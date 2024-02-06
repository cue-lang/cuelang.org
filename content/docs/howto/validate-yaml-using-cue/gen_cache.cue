package site
{
	content: {
		docs: {
			howto: {
				"validate-yaml-using-cue": {
					page: {
						cache: {
							upload: {
								"initial x.yaml": "1b3d5ryghts/u5NuLmO7wkK35OOnCldw86+7lISAmAY="
								"initial x.cue":  "f+6pYehqBCNvYyenKfb0ZCR983Uj1kPfwms6Sorx8AU="
								"another person": "/ALxkBh9Mnm+/XrK2d8CUN4fOzcgtrG9CXqx7sB0gZQ="
								"fixed yaml":     "5XwZ16UW0yloxsaW4ElrjzKJluOcztHQYQaLzPmdc6g="
							}
							multi_step: {
								"OQ5RE1E4KNPM2T9GS0IRKKPU2TQU4O5JBEPC8Q6I9QTDOPFFLH8G====": [{
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
