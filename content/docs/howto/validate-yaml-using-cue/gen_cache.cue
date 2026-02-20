package site
{
	content: {
		docs: {
			howto: {
				"validate-yaml-using-cue": {
					page: {
						cache: {
							upload: {
								"initial x.yaml": "489LcatTtUtrJfu56pUzOUm3PfcA5AR9EYcrP3rOM3w="
								"initial x.cue":  "sk5WGXlS2/8c1z3AqY8qoVuzrUuwk83Y8px/jeGys+E="
								"another person": "bMRMRjjp9ZPpUu5ARsa7isMES2ZijVG6NYucENoQIyg="
								"fixed yaml":     "ieZcRL6iL/G3r2DRj3vxKTdjZ++jiJrS4EJj/B1Cc7M="
							}
							multi_step: {
								hash:       "D5HHINP89MSN35BNMTQ70EUO8NO8O1FAHSPOABP8L8UVAB069I30===="
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
