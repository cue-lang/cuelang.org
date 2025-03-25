package site
{
	content: {
		docs: {
			howto: {
				"validate-yaml-using-cue": {
					page: {
						cache: {
							upload: {
								"initial x.yaml": "qjEIVEBTdKJvnVHy2x9SNngbl5JVaPlAnjaDxGxBkuo="
								"initial x.cue":  "Jcfnqvnm+G226I61jB5z0YAlHtshcxnDePGYuPpM9iQ="
								"another person": "/HsKyLcQBoJ6Yt2G+D8xEqKe3mJl+aWGtP2iAvC9C3g="
								"fixed yaml":     "FcDwOovknaC39ZZFY7ghqEJilUk7LDxA1Q0nxdPm/Zw="
							}
							multi_step: {
								hash:       "GRVE2KNISM19PN16RJBA03B6RNM1SOTTA4JR7D8ES7I4LIEF35M0===="
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
