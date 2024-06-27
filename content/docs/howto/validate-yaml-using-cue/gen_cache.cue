package site
{
	content: {
		docs: {
			howto: {
				"validate-yaml-using-cue": {
					page: {
						cache: {
							upload: {
								"initial x.yaml": "ZG1dnxYKsIOhBDqXWrG2qxzzU+27qWwCpNrFKt0YJ0A="
								"initial x.cue":  "cM84lQ7I+JENiRE8REybjqk4QaOkJYIfhmJ58OXYucw="
								"another person": "RWLTkdOT0RSyENHEBtjklgFLZOSxSLNZ20ZEPwPoAfQ="
								"fixed yaml":     "RPPTV4DRAOCWWeZJcXkIl4L9jlazY8v1k9gbBwNvxYc="
							}
							multi_step: {
								hash:       "4DC0O4O8CHM2VASPQDBTS5U3L7ETLO0GLCT8TI3QU0BM2FNFEP90===="
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
