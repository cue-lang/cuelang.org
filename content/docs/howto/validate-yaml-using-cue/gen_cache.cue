package site
{
	content: {
		docs: {
			howto: {
				"validate-yaml-using-cue": {
					page: {
						cache: {
							upload: {
								"initial x.yaml": "0cTcDUZ6JAUNJdVKZ7UhSC3f+SA318Vd/ysOwVjteU8="
								"initial x.cue":  "bAqZCNXKxPVkrOQTLMTWXPbjPwgDzu9UEcO00FzMEFE="
								"another person": "8qaMyoAZTSaynhjQjbsurKWOpuRGRdfASKTmds6//q4="
								"fixed yaml":     "T7ouysPcZhcrOnrfDI2J/4JNKZ0qsrnZGGiLHkiPCHE="
							}
							multi_step: {
								hash:       "5H7G2JHVR61EMORU1RO2EN4KADPFM7I4HQQGR7SE1QKINMAMFFAG===="
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
