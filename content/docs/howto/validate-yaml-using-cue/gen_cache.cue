package site
{
	content: {
		docs: {
			howto: {
				"validate-yaml-using-cue": {
					page: {
						cache: {
							upload: {
								"initial x.yaml": "iu/6Rl0ETqskxRhnQxb65KS6Xhy7qPs4yzYz9Mk5x28="
								"initial x.cue":  "dmQdmmReH44nUMymS/s31P7RQtGHSwDLmhS8fIqjrYM="
								"another person": "Cx0dUNa2xHO+W5C7ao2p9Arlio+DFlbjh1fGBZDu5HE="
								"fixed yaml":     "P34MEsQaMqq6DJJFwwjZw0I3OXwnB1JgsbsG0VtXUYQ="
							}
							multi_step: {
								hash:       "3TOR3OBV8KFK52QECUPU20ELAMRH0DAMMM98Q44O6CVR191TDL4G===="
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
