package site
{
	content: {
		docs: {
			howto: {
				"validate-yaml-using-cue": {
					page: {
						cache: {
							upload: {
								"initial x.yaml": "UjS+EFGL+Jy5vqetL3XOl+6CrbVkoWheZf1z4H4hXEY="
								"initial x.cue":  "a4hgPGRBK585Szh9q+Rwof25om/pppAegc01M2znhgI="
								"another person": "5FDjbpLOGehk/O3AxhrZvb1segfiJiuC/5dHYVu+3Gw="
								"fixed yaml":     "EAtbYfTky/iQavWzCn2r2rQCijA2WyJcKOS68vbe4gY="
							}
							multi_step: {
								hash:       "RFKABA6JJ74TC7GNU302N4UJVITAEQH1NPEHUA2U9VM7BBNHBP80===="
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
