package site
{
	content: {
		docs: {
			howto: {
				"validate-yaml-using-cue": {
					page: {
						cache: {
							upload: {
								"initial x.yaml": "Eyp/OzgMjlfQF3pC88nbgI+U4ANapLMlDqI1E4kk9TY="
								"initial x.cue":  "GtHeApg36QcJ6VR6dhPXftTxD5BBG+WMdkUEYR/Pw14="
								"another person": "lXXnk3hmER1oOqklIQlW8PgMHDXQ+wgaOTd6vhHMQH8="
								"fixed yaml":     "yhA5c6wNa/V9EdLAPiXjuW2A+2OhG6zbg9uuV45i96k="
							}
							multi_step: {
								"P1N9GANTBGNG1DU10NQCI0V7HRU3DCSFSMD53LULR73SUN0GNG8G====": [{
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
