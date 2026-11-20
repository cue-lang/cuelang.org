package site
{
	content: {
		docs: {
			howto: {
				"validate-json-using-cue": {
					page: {
						cache: {
							upload: {
								"x.json":       "EWYrcfgoyoh+jmC6OChPx4gOPCn+Ri6UCNL5Ip096mY="
								"x.cue":        "rCnrV9MKeRPyEPqt5v+YGuhdGf16Ki22gr+DiKLD7p4="
								"x.json v2":    "1pxmmNrzMRh6F9JRwsSMMzW3UepMRLaabRnNynySkaU="
								"fixed x.json": "2No7VF1LDEbRJ/JcHdvrbW+UKolJ5qu+3cDP8xpUwQ8="
							}
							multi_step: {
								hash:       "TQTDOKT1LHRUKQNVT7K44O6224RPNCFRR944OGASFQ2G0H0LICC0===="
								scriptHash: "AAA3CVDQRKSCMFV7CUP90CM199MG6USVJE9DE2KGITAA48SRPHGG===="
								steps: [{
									doc:      ""
									cmd:      "cue vet -c x.cue x.json"
									exitCode: 0
									output:   ""
								}, {
									doc:      ""
									cmd:      "cue vet -c x.cue x.json"
									exitCode: 1
									output: """
											people.Rob.age: conflicting values 42.2 and int (mismatched types float and int):
											    ./x.cue:3:11
											    ./x.cue:7:25
											    ./x.json:15:20

											"""
								}, {
									doc:      ""
									cmd:      "cue vet -c x.cue x.json"
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
