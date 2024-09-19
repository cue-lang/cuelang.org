package site
{
	content: {
		docs: {
			howto: {
				"validate-yaml-using-cue": {
					page: {
						cache: {
							upload: {
								"initial x.yaml": "Jhi9etqNWPllPxRmW32HVHpv7RT42sqmF40X9gog0Bw="
								"initial x.cue":  "wnkSHtHHWgj8IQ6GvJSgrc2ViQLpgAHPrhyqmAS9TyM="
								"another person": "Jm7gCGDlPOMvFmpLRg0EiReyLD/+CGYwhiieo/3iuO4="
								"fixed yaml":     "HI+FXjMBFq1HjYo/ckS+prggzlx6GDiV7KrAi7IjBq8="
							}
							multi_step: {
								hash:       "HVRHPQPK9T9818DTD2LSRPRK6QRGR419VTEQT7DB7QO04E8EFUIG===="
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
