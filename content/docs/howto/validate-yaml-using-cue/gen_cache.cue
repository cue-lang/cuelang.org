package site
{
	content: {
		docs: {
			howto: {
				"validate-yaml-using-cue": {
					page: {
						cache: {
							upload: {
								"initial x.yaml": "r/vpKV6GqAyHmhDXzfVNpyzWy1Ida/xgVOzvgb45FxQ="
								"initial x.cue":  "bP+UOiEZeCSPdFvLp00uehMIk1XeMDqWycrtAyc5e/g="
								"another person": "UPIzhexs9jk8B4Xh5x5sUJvjUakj64kl/bu1/qPgczk="
								"fixed yaml":     "XOIvUArSRJ7wwiGtQGSV98Cej3MFy8nDmd01AfZ8mU0="
							}
							multi_step: {
								hash:       "3FN5JU5CE4NL6TIQ9FF147A7FDFU8JGOSDDOD6S0SPPVHLTC7MD0===="
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
