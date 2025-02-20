package site
{
	content: {
		docs: {
			howto: {
				"validate-yaml-using-cue": {
					page: {
						cache: {
							upload: {
								"initial x.yaml": "+3gTBG0m6EFjzuSVDUvS+X3HuA2/3x/5M0/GK7zrf9U="
								"initial x.cue":  "OyDPNqkYe22COLGSmAOnIshFLRPOy5TKMq9BtcUw6EQ="
								"another person": "FD2q0xrbEG80VZyYhH/Ryfo3R5GUWz0ESRUeO7Vwk8g="
								"fixed yaml":     "CtTjsZQQ3YfZ5QQtOethyWyQyPvWMCFWF4Ps0j4wImU="
							}
							multi_step: {
								hash:       "RA87R4BPFBAUPSDFH5GQNJA820TT1CI2QIFQEBN916I95CSRDI70===="
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
