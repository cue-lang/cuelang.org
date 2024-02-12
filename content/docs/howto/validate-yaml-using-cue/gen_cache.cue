package site
{
	content: {
		docs: {
			howto: {
				"validate-yaml-using-cue": {
					page: {
						cache: {
							upload: {
								"initial x.yaml": "b9ZH+maMJZwyVFkskLW3cgWHgBB1QeAuWD8OCXSSmEE="
								"initial x.cue":  "yJyI/3z1xapyf0r6D5tKtVFreVvVVtL5FtMh/940p20="
								"another person": "cL9rI6WHYo4ehz4BWAOLTSSF1wrOBPjwfeDrfVDT8ko="
								"fixed yaml":     "kLeP4xJNkftbj9MGs2XZX/oPmwAaURYbvRG+5JaE2NI="
							}
							multi_step: {
								"G8R09LKQ39SDUFTT04OST3S0JIJQI9U3NCDEUD4NMF48L6QRSC0G====": [{
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
