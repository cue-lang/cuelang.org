package site
{
	content: {
		docs: {
			howto: {
				"validate-yaml-using-cue": {
					page: {
						cache: {
							upload: {
								"initial x.yaml": "JMyvV4B6eTe99KqrPndS0J1F6gUFJQyUhMqU2dvnMEs="
								"initial x.cue":  "gOmsmKuVh8FKRVBMec5MLZYi7DnXoan9a6w5CXMU+yo="
								"another person": "ptX09vuBTHkucvUOJfBFtmYyXAaU5VMCG+/36IG0oD8="
								"fixed yaml":     "7BLeN29uZKBJEHAxFpz9+kdEktmUqOboHS0nJLdz8nc="
							}
							multi_step: {
								hash:       "KCJ9ENNNCPVBDR1NQ66FMKR0C216Q50OGCEIDR9JCCB7DP64QNR0===="
								scriptHash: "C4EFM89Q7KNVBA7IOJ3DV94IERP38E0P6JP82M64M56U8OD3P5B0===="
								steps: [{
									doc:      ""
									cmd:      "cue vet -c x.cue x.yaml"
									exitCode: 0
									output:   ""
								}, {
									doc:      ""
									cmd:      "cue vet -c x.cue x.yaml"
									exitCode: 1
									output: """
											people.Rob.age: conflicting values 42.2 and int (mismatched types float and int):
											    ./x.cue:3:11
											    ./x.yaml:12:10

											"""
								}, {
									doc:      ""
									cmd:      "cue vet -c x.cue x.yaml"
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
