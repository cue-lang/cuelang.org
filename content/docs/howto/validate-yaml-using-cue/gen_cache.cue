package site
{
	content: {
		docs: {
			howto: {
				"validate-yaml-using-cue": {
					page: {
						cache: {
							upload: {
								"initial x.yaml": "DLgs3CimcIrF/RVfoo0RB5TZZsr5RVtxlUAsDN+2sAc="
								"initial x.cue":  "rkU6EW1ChpyFiyqmok9cvVT6RaCr7Li9jIc87Y7LAk0="
								"another person": "etnOeCM3odkvmUWJoH8rDbPrF40D9VwEy05/8DAWFM4="
								"fixed yaml":     "04kEEz1ybiQ4zuF+0eFkl67nZa1zjcQ0S3/BbfkUXu4="
							}
							multi_step: {
								hash:       "QP3GVGRINFLVLAU6HIPVF3R8ILDGO11BLBOH990I8V9DH56T3D00===="
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
