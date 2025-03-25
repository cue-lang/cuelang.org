package site
{
	content: {
		docs: {
			howto: {
				"validate-yaml-using-cue": {
					page: {
						cache: {
							upload: {
								"initial x.yaml": "96uLrXHdj2w3KQOLy3VAuDr0qfKpxqADyPKQBypCmgM="
								"initial x.cue":  "5P6PFdkM/eEQF8PBuP5sfUskOPgp3jnJxns8ByJiwUQ="
								"another person": "4FkBTDRGDmzt5RV26qcaMnB2YXzOud4zSbq/gqV2AVE="
								"fixed yaml":     "NkElmB1PyNjBjMS10tTyYnnR6hKhjNMSleY9qqIbrJk="
							}
							multi_step: {
								hash:       "NQAAKLF9DUTV6S41G6SJKBVLCSLOCQCPRDIRTM62TSFJ13TBSPT0===="
								scriptHash: "7O25FPHJVUHC297BLS0S5A0O6M4E37ITUK3M1O5FHBH097GTHAAG===="
								steps: [{
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
