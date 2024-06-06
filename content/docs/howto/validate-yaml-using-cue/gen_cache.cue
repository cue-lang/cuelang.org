package site
{
	content: {
		docs: {
			howto: {
				"validate-yaml-using-cue": {
					page: {
						cache: {
							upload: {
								"initial x.yaml": "h5hD8txzNcgi4Citn4IJptMNzo6ia91vX1tR6z7XeKY="
								"initial x.cue":  "HrZPukKSRl6dfLQBBazto3Ss+/flj68JTxp0K1J1g+Y="
								"another person": "Qavt9mQQFNdEE20J+A43AN/Gm1PUaeXiWZ1swuFG/rY="
								"fixed yaml":     "RqXvtfixkBy2MOeeIz47xZj/K8jjVB5csFq4LTWgGlU="
							}
							multi_step: {
								hash:       "EQDHMGN1JD0J9I5M651OQ8GCFI0QJIDBQM8SQUCB674NF53BLGDG===="
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
