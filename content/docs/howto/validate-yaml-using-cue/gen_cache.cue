package site
{
	content: {
		docs: {
			howto: {
				"validate-yaml-using-cue": {
					page: {
						cache: {
							upload: {
								"initial x.yaml": "jtqSQOnK8Xsag0tgQWezj0Y8OqE382m0+pyastLLKFA="
								"initial x.cue":  "EHBHK/wbJr/N7unfbVAAoiujWxC/V7/jwihKMYa38js="
								"another person": "6b8Caj6Day6/rPDCBwnIaSDa/PKeAxyGerlusW7n65s="
								"fixed yaml":     "2KFdAJQB5zIqA0hjwY6Ou7adsdXCVH6l81EtnkKAdWE="
							}
							multi_step: {
								hash:       "AAMQ2DBJI47RQ02LM758GL670AMTVO12927GV2U762QUEG0Q18JG===="
								scriptHash: "C4EFM89Q7KNVBA7IOJ3DV94IERP38E0P6JP82M64M56U8OD3P5B0===="
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
											    ./x.cue:7:21
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
