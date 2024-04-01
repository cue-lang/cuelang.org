package site
{
	content: {
		docs: {
			howto: {
				"validate-yaml-using-cue": {
					page: {
						cache: {
							upload: {
								"initial x.yaml": "IpogX5jIjWaf/v/rDUQUha0JLIUkq3Ddd6FwWS3DCKM="
								"initial x.cue":  "rP1zQ1BgF52aIUbemvAdioj3ibxQk6XTW24mCEBK9yk="
								"another person": "3BHpWQIN6hQ+IqmAKvafmqvNifc8Ep1LX3TjqwC6TW4="
								"fixed yaml":     "kSKjbaqfSPZuaPwx/KySChrkrnm50COx4Lb2PYVgXGo="
							}
							multi_step: {
								"OMAEIFQRBF5B4O185RN1D7CHPVQU0U5R0HLKDLJ2NJM73L65A28G====": [{
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
