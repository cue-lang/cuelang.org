package site
{
	content: {
		docs: {
			howto: {
				"validate-yaml-using-cue": {
					page: {
						cache: {
							upload: {
								"initial x.yaml": "aX/ZfW+5ht51GL/6EqYPjTcctu4BxYC0Gh0U7g27e+w="
								"initial x.cue":  "xv2e95xR7qqPLrWHX3v7fVI/SoAWOFGihE9R9KqJ8NU="
								"another person": "JJiSi9sOxzpKIlkBy9QDYztJMGcT8H1k6HaRyMf1SMI="
								"fixed yaml":     "ngBcn8YkDABjW/plc1QKOLiNIGnX55Y35TAORssG010="
							}
							multi_step: {
								hash:       "9N7OCTJ4TQQP5800FJ1U55BN651A0DUKQ4KN6APHOOBFD7PUBNR0===="
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
											    ./x.cue:7:21
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
