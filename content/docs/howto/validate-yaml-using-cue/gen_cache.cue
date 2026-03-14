package site
{
	content: {
		docs: {
			howto: {
				"validate-yaml-using-cue": {
					page: {
						cache: {
							upload: {
								"initial x.yaml": "IrTCgYRycPBw92qdcSj6rGE8SpXrMw5Vue9PtpgpJXg="
								"initial x.cue":  "iH7aPh+lMDmhtVN368yjEZBl5TgU5B9hcGKbYT7OwzM="
								"another person": "Yq54IBoumgG7DehMGZjs99tcWdpYiS/cIRXbYMgI3yM="
								"fixed yaml":     "vgSDEtpmDNisd0hgdhc5CqUgKsiXLiWbswHL+A2Hz/4="
							}
							multi_step: {
								hash:       "9PQO98JGG9OIB0J5OKMQ10TNSVNL0FI4JDJVJ57EQP9R0ADI5FQ0===="
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
