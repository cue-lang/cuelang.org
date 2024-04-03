package site
{
	content: {
		docs: {
			howto: {
				"validate-yaml-using-cue": {
					page: {
						cache: {
							upload: {
								"initial x.yaml": "nb4fC37dgbxPHX8d9qyd6k99qtEdsP7XMoP02ABIUfU="
								"initial x.cue":  "uMFNrjOwwTcCU6pcJPaYcUnoUCqCtsHpqpuzZwnPQZo="
								"another person": "DTSvBABCXEl0FCT2YL2fR9PD+sVCvCLLwEUi4k48Lec="
								"fixed yaml":     "9cHAtKGVtuisAm1glrGaiA3epmyxRHYkz2evi7t3kT0="
							}
							multi_step: {
								hash:       "N9TR6SC9M1ML88CTSO3NPKADSA20OBGSPN37EJJRQNP8949B3CO0===="
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
