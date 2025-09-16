package site
{
	content: {
		docs: {
			howto: {
				"validate-yaml-using-cue": {
					page: {
						cache: {
							upload: {
								"initial x.yaml": "A1XqcnIdCHNN7Ss72vIUlAAK3yuHnPRvpVTdPLmWe1g="
								"initial x.cue":  "bK8pUndv3qFsoG41v3CO8yq8tlNh9WOFRmA0v9dfXGo="
								"another person": "hwfosaFPlj1N6Lkk/k0I7VA36584ZpxAT/42+nVxYhk="
								"fixed yaml":     "I2ZueVwa64jIbEGb5qEdXpNeJ7iDlRrVXmcssU0emKA="
							}
							multi_step: {
								hash:       "ALQUUQVG5OS9J0BND2RVSAKMCFUVHES2K52PLQDLF78F3CAOACI0===="
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
