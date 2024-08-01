package site
{
	content: {
		docs: {
			howto: {
				"validate-yaml-using-cue": {
					page: {
						cache: {
							upload: {
								"initial x.yaml": "DmKuILJnSrLLWdbcpMi0kyGqSHAJPf3IqKCgE03L1rk="
								"initial x.cue":  "JCsgBKrHeJqQXfeeunfPLkuSfpSf9zvRc23Jvbw+EP4="
								"another person": "wVYkiUEcIqJ2R4QODZ4n+r+I7INsuhFH1I3PiCBtqgE="
								"fixed yaml":     "frJtLYCX0k4tVUoPYG4mNxYTBQzk3k276HFEIH3qdJw="
							}
							multi_step: {
								hash:       "81SU9JKSE9QDE21O5GHQ7HBK3EJJV5DJTHF94R2IOAUM843D5SP0===="
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
