package site
{
	content: {
		docs: {
			howto: {
				"validate-yaml-using-cue": {
					page: {
						cache: {
							upload: {
								"initial x.yaml": "PCqum9Ggd98JxiNTUsGiDOI/I1loCIa9Uh+hI0axhLw="
								"initial x.cue":  "CGRSR6bCGPNmOuX2QxipIP2yg4eL/ZRAYDgGAYSN7cE="
								"another person": "Xq+4EGQggQ51MdHt6pzASBEwZuxYb5RkYk8dTrlMrsc="
								"fixed yaml":     "n5OOUZAMzYvieb7w6vGNbTsH42ZyfVgHAW4smqJE2No="
							}
							multi_step: {
								hash:       "4EGMIB5OST0GSLN3NVSGHJMI4TA0DO5TJUL1LSFUDC9K0OBD4RE0===="
								scriptHash: "FCVR3RQM9KMC4K4253KBPI107J84GMJJJ8ULKG41E4AVUBFH6UUG===="
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
											    ./x.cue:7:25
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
