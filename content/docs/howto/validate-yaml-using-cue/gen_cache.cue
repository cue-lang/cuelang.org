package site
{
	content: {
		docs: {
			howto: {
				"validate-yaml-using-cue": {
					page: {
						cache: {
							upload: {
								"initial x.yaml": "qqv/l3lcyiY791h2Axg66J6Gcwl25oJnNX2RxJrKzTo="
								"initial x.cue":  "bZJEacdzmvAaG4mFtDq2g1++YLXbQMQbyXaoO3ajNWQ="
								"another person": "NilcBlerkp1A+/9mag7EpIvOmowHwmwsuR3MSS5InZQ="
								"fixed yaml":     "mCv4k4K03+xpUr/aRi9jVenUpUFQeki48J9XmsJNxU4="
							}
							multi_step: {
								"JUHFHA7ACLOQN5OO42D1C5B36L0QHTAUT3SRPK3RO9PUGODI6FKG====": [{
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
