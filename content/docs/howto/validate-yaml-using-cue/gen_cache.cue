package site
{
	content: {
		docs: {
			howto: {
				"validate-yaml-using-cue": {
					page: {
						cache: {
							upload: {
								"initial x.yaml": "cXK3TQQ8F611tIOoXZ8hUW2HjEKNJuAlm8DMxyTvLbc="
								"initial x.cue":  "LBYq1yafdKse8baKMky78cmg0r3oN/ID5oTHEXcMesA="
								"another person": "Nd0jJNy2x1FOGKhi3lY4+ZINMnTotkzY3nYK5zfVHj8="
								"fixed yaml":     "P/qNy3a8yZhYzfIvi0W9rmikB3S2Ep6yueY91TNvzqY="
							}
							multi_step: {
								hash:       "JUFEF9JCF179V5HQE8PS1BP9J4T9QJ8GRV8NR83CUQI8CSBLLVDG===="
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
