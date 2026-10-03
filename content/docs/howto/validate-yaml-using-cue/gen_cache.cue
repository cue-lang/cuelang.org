package site
{
	content: {
		docs: {
			howto: {
				"validate-yaml-using-cue": {
					page: {
						cache: {
							upload: {
								"initial x.yaml": "qloGcMKg9TXgh1I/lCQFOTEX5e1jhpakkoNYrgrSR3U="
								"initial x.cue":  "KHU++DXJhy9lQ6zcdoHiTDZopecJJhgEUmVXFpPIZoQ="
								"another person": "GNC57/yrxIq4KXkEuEK1iIJ4wAwoiTV2WzoxbWmUY9Q="
								"fixed yaml":     "pOFXK6zQB/1bSIp06CO5MpmDgHeaST3bmbSDjhocqso="
							}
							multi_step: {
								hash:       "5APP59GORMF627940R513ERM6EJ9RPJ69K80SAISJQI5EUOS3SN0===="
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
