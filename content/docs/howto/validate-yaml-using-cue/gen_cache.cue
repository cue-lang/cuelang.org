package site
{
	content: {
		docs: {
			howto: {
				"validate-yaml-using-cue": {
					page: {
						cache: {
							upload: {
								"initial x.yaml": "WGJkDWCtGphp4gZGUTwpYX7DgO/RtvSzebl3WbiDSGc="
								"initial x.cue":  "NPSCiYxQOz7HLB43OucdVO1J5lO0WQJ/q6R369DNpDA="
								"another person": "a5AM2mcGHUoulxOu6A/b5mBNU9DZdqV43z7aFUMfDRc="
								"fixed yaml":     "Kl855mSE4HUPq2BgT0MNrM0hEwr3gEP60fo/adzQDFo="
							}
							multi_step: {
								"AVQJLSSM0UK4IBH767K7FJKE59B50TKT5OLRPB0ADGQ7KBBVF9D0====": [{
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
