package site
{
	content: {
		docs: {
			howto: {
				"validate-yaml-using-cue": {
					page: {
						cache: {
							upload: {
								"initial x.yaml": "kz2rTNe58fkv3cJg4RAMefuAFrt7wgMjtyzt0jjmCv8="
								"initial x.cue":  "g5TdD8hSkAT34ADYpAeCDIM/yeEPF3HQNL7nwKq/wik="
								"another person": "PFb6SMl5+ythiXiasZudZ50uTr7Q5dHYsV4i8IqyJbA="
								"fixed yaml":     "bKqzdvP/f8lHwkFDsWbLflajC7MTk6JxO+KYScP5m2o="
							}
							multi_step: {
								hash:       "AB74LNT8TVOJ9APH1Q75JQT1163GE72M182TKLTT9SPMQ62NMMS0===="
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
