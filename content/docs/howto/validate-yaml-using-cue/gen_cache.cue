package site
{
	content: {
		docs: {
			howto: {
				"validate-yaml-using-cue": {
					page: {
						cache: {
							upload: {
								"initial x.yaml": "urRGLx6Qc4mkWij8nRpKrOYKBgsqSydNY0zBqN+rc3M="
								"initial x.cue":  "99QUefjAuXIYb+ZU6aCQWWtDq97SzaHls7mMa3cRaMY="
								"another person": "M2fV67shyDX1PSeCNHcqb3rSEcnvgzwrsNjQEiXYRjw="
								"fixed yaml":     "HqT7dYsILjRTrBPON74ZgjxoZGLHwo2/6xctwNmXx4s="
							}
							multi_step: {
								hash:       "PKPOO17FBF7A3URU92R0MNG2M425GRH38GFCP2BK1BCIGDR1841G===="
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
