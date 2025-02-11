package site
{
	content: {
		docs: {
			howto: {
				"validate-yaml-using-cue": {
					page: {
						cache: {
							upload: {
								"initial x.yaml": "0cIsSQxjOPUTmC1YCAj8RhiGlcGdB9ti2WsqiqiS2w8="
								"initial x.cue":  "8i+8JzLeKAJ2+Np0gZumBWV/vNFzlX04ugvQznPeAIo="
								"another person": "LoK9ZwdHURxnC1ZqaIaN6MbbMrgpHSxSPfH8/C/l2II="
								"fixed yaml":     "p3sO4KhBHxjmbYQcOT14hJrzDBEwgkmRUYVEnJGyFTI="
							}
							multi_step: {
								hash:       "FMHACBE2VFHCE97I1PRIDO2PS0AC4BKPNCLCT6790044JQ8IPS30===="
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
