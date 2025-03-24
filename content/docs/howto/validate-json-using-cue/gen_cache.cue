package site
{
	content: {
		docs: {
			howto: {
				"validate-json-using-cue": {
					page: {
						cache: {
							upload: {
								"x.json":       "vfuhE+uukNLZRGGuFwAKh+XBNH3dx/y73IHOztIcbkY="
								"x.cue":        "WCCD0uDHapn5ydf8fFPnw/Xbuo6Dn+OsN9fMQ4n5iEw="
								"x.json v2":    "QmdAHuMkKXC7QnoEhVP3zCPwwMNRXSIpQmCliEnrqJM="
								"fixed x.json": "1itSLy2EmsJ7pyKFDwdCwH0yYxSGQV52j7WN0y13M84="
							}
							multi_step: {
								hash:       "N2SMP19IEAIFN7FI6PFOTL157F067RVUSSJ8S7UERJNN61EUL3K0===="
								scriptHash: "UMP1JTJB5F0SVS45CSPDVU8KSNKPQ7SI0OEVSC7IQVT5NDCE1PM0===="
								steps: [{
									doc:      ""
									cmd:      "cue vet x.cue x.json"
									exitCode: 0
									output:   ""
								}, {
									doc:      ""
									cmd:      "cue vet x.cue x.json"
									exitCode: 1
									output: """
											people.Rob.age: conflicting values 42.2 and int (mismatched types float and int):
											    ./x.cue:3:11
											    ./x.cue:7:21
											    ./x.json:15:20

											"""
								}, {
									doc:      ""
									cmd:      "cue vet x.cue x.json"
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
