package site
{
	content: {
		docs: {
			howto: {
				"validate-yaml-using-cue": {
					page: {
						cache: {
							upload: {
								"initial x.yaml": "A07K3NZSKOTGR/+FiFOHbfa+6MBatbXwWrvbKneSKw8="
								"initial x.cue":  "tHsFTjCeD00g6TutI7BuoQIww6lxgFbfHBdrDeiydSs="
								"another person": "ZNu7h0i/23RAmDd4ulUOjt7VLGeV4f520U8QJopXIDM="
								"fixed yaml":     "1r6k5MhnvTCT1kco63B2kcE5HjF4+3BQK2Jg2E0DuO8="
							}
							multi_step: {
								"SMTP681IQ51EPK5FBFBI0GKRGJ9N21OQHDUK547PU40521IT91AG====": [{
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
