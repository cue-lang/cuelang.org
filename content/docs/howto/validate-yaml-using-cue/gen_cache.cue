package site
{
	content: {
		docs: {
			howto: {
				"validate-yaml-using-cue": {
					page: {
						cache: {
							upload: {
								"initial x.yaml": "7eGI/0WhFlCDnJWhzNykuiaIVdPKrM7PoHURtNlNtPI="
								"initial x.cue":  "H5Y8GXWwiBaS4QvjFi7bOtf7bt7opUwvxsOKCmwmp8w="
								"another person": "P3eym7sUahHCaS0WwJaXzGAKtpPftf5ctMC443KH/wc="
								"fixed yaml":     "FrId9hQ1HohbWb63yv2TjZTfbUbZePmrpBPTVWVEtgc="
							}
							multi_step: {
								hash:       "6GSOD3J3RT8G5FOG600UIC23TOP9EGQM1SJA31GJL28L5KNTVODG===="
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
