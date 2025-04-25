package site
{
	content: {
		docs: {
			howto: {
				"validate-yaml-using-cue": {
					page: {
						cache: {
							upload: {
								"initial x.yaml": "7yUfUOWMXbZtaDu3ajk68B4thGyqe3gSYe+cZAzvtnE="
								"initial x.cue":  "8C104BA1sHlIGWs9w1UM8kkQlEFZJYZGsFNzBivnDDo="
								"another person": "vAEwkJsnRyU6CBN/3HW9AXLvug/OnaUBWmoeTJFePfQ="
								"fixed yaml":     "LUeYYs+R08XQBkoH0Zxogb9Tm/Axb5cDxWI4gf36dIw="
							}
							multi_step: {
								hash:       "1MNPGN1NRKOOIRJKGBOS17LI5U6AO7E8SKG00M6JSEOK18UBQAQ0===="
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
