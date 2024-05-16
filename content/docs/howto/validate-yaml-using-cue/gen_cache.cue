package site
{
	content: {
		docs: {
			howto: {
				"validate-yaml-using-cue": {
					page: {
						cache: {
							upload: {
								"initial x.yaml": "PugnsiLYDUQyhUOXNkMTsbxGivqe0ixKzdloPd/shBQ="
								"initial x.cue":  "OfxN6f5HqhaRYb0fXI2gpRsCdBtaWpmxNqsZp+HwmXU="
								"another person": "VDAlAsJ1/0ViR/AJASiMwj26sET10/qP+sqhCqqbN5w="
								"fixed yaml":     "2bopjN/RTmDp60UugqBF4atdCXbjmZdF6oI+YKamYfQ="
							}
							multi_step: {
								hash:       "50A0GRORSDKKH8KRA8T7BP14QFIVP489JSEUF7CGENN3D4P08TM0===="
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
