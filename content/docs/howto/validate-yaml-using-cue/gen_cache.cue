package site
{
	content: {
		docs: {
			howto: {
				"validate-yaml-using-cue": {
					page: {
						cache: {
							upload: {
								"initial x.yaml": "D0JdWPb4N329v8HxqTXF6WAjUGKKK7oPJm7zNcmBL8o="
								"initial x.cue":  "6CYJNE+MPF5Dc+Y8o9Y2J3rU8rwRHqTa3/5M2YNFvSU="
								"another person": "M2ukzRLqQ1jSELfBS8kfnoSH5diP3Jrbj/4TzOkVf9Q="
								"fixed yaml":     "JGrwzRTl8HJamwoTxp1nlpVcv/LvnaP9ur+fVJ3YKwM="
							}
							multi_step: {
								hash:       "92NC1QP1VVT263VA867LSEQVJM6BIS13IHELAV6MA2BOEFFJ45LG===="
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
