package site
{
	content: {
		docs: {
			howto: {
				"validate-yaml-using-cue": {
					page: {
						cache: {
							upload: {
								"initial x.yaml": "jXfioKZpB6fdowVoOZR6HrWmA0byqffGYQJZLPyWaIE="
								"initial x.cue":  "Z/Z5HCv3h1LQfL3td+KdKRSMemIe1y9VQXZY76ea2RE="
								"another person": "LjBOKouN7zUEEDs14VEQ8YQfner8/b8lIWbcRFm7QXQ="
								"fixed yaml":     "1VG6f6ThufiLJq1obosF2sy6oYBXgn9Pnxi0oZvdrdk="
							}
							multi_step: {
								hash:       "QIS53K42N4VRLLE076S5H3HK7UT1Q2STOG1C5J9CED8T32DK2KD0===="
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
