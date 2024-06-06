package site
{
	content: {
		docs: {
			howto: {
				"validate-yaml-using-cue": {
					page: {
						cache: {
							upload: {
								"initial x.yaml": "xmkFDOA2vw1Zvqpu2KmBSrJzguhoJEgm1uAF+ysz/I8="
								"initial x.cue":  "nseCDIYhcCUv2PzQmbUCan1kX1b1UICqeTDZMDYfBw0="
								"another person": "ApTuv91MC5uVGZcjsMlwqgKtNqM0lKJtXFQZ32W6J6k="
								"fixed yaml":     "fe9YNjiLDlwgzLCTnlT989q/Qb3kTS4/ZAgvs5Q4Z3w="
							}
							multi_step: {
								hash:       "KTR4VVQNIFD5F7U9PGGFAEQDMJAPF1AU2469UOKURHMPEA794OLG===="
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
