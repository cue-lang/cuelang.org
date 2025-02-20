package site
{
	content: {
		docs: {
			concept: {
				"using-the-cue-export-command": {
					inputs: {
						page: {
							cache: {
								code: {
									"cue export # package x1":                                   "eIEA/gYkTOpBD3mtPtW8GY6DjgEQ1qwwybpUO9EvxXo="
									"! cue export # package x2":                                 "JK6te2Lg1lEaPu8rfcOjbANvWq/AGcEyclT7V9vOU2c="
									"cue export . # package x1":                                 "05gAIVYjYR4m3O+kTUmz10vTTLDE7MtcuNB2BAOqhow="
									"cue export .:one":                                          "CcEP5JSC4/SyZq1QcxlnqFetewPo4p71EykCoVNKHa4="
									"cue export data.yaml":                                      "lI9fbG7G7sJaFn1M19X6LDKFsuWqAWnAKSOruABkqGU="
									"cue export yaml: some.yaml.data":                           "WNWYqO3ieA4UI22f9emP/CpMIncnYSIj3Zec8uWnca8="
									"cue export .:one .:two .:three":                            "daBZkO7qd+G9mOBt35RwuLE5ldPAQdNPWvxEMndoGms="
									"cue export package + package file + data + packageless":    "Is5tgU7JAq7zr+xOfGg5wp0/TaPxUffxTuyMJkWD/uM="
									"package file + data":                                       "FSQploBnk1T0G5MXFTGaLD1mCR0q4APyaVY4gmqwMs8="
									"cue export package + 2x package file + data + packageless": "TCDJrnjy6lZ0hQZZv7UkCOdZE253WzdGOm8+TmmfCCE="
									"data file inputs":                                          "VRAP1Q6S6P/qAB0OQPVQ603RKRiy3wbf4mMTb0BXiXs="
									"data file inputs failure":                                  "28z205Dl3d+tN9rSZ5CTH3I+/dYl3QSIyMLX8uEmS3w="
									"constraint file validating data":                           "/ySbWje2N7MWb864Z3A/0+bYnaGJDX+qBoWUopSxVlI="
									"constraint file exported as data":                          "q77FG8IqZsj/g6vXPpP/548yBBNOhHFt1FDQZ1YrTj8="
									"-l static single":                                          "DEwYJRGQ0SqMWBJmV7KDNabtiHar+lsMVO2Jnh7mrV4="
									"-l static multiple":                                        "1uQq3gQG8NeNsVzSgJ2eT6+MrVqk57iuHzzKLJJglLk="
									"-l static multiple files":                                  "vHb0guXzN72/rLYmQj7b08dAP599FUdnEXdSZpsbYNE="
									"-l dynamic single":                                         "47IXVF6kMx7OAUU1jJ06FpMMlhv3A+ksMS0/YG+ErW4="
									"-l dynamic single with function":                           "Jp9DpmvnCYl9FUo9oOWZAymKljCGJT4m9G5F/6h9rHs="
									"-l dynamic --with-context":                                 "3FmIKdcd3DnQ4Hhj/07oQyJ6zOiwGYLoz06+ot/nyi8="
									"multi-doc merge":                                           "DzblAjV2JYjT0MJrQfSwp8IR722EIB4WFgZgDsBlVkE="
									"multi-doc list":                                            "K1EE3Xk/6gvDRvd8udhwzU7g2KfRZ3aq4rwHUgNboWo="
								}
								upload: {
									"test cue package inputs prose":              "eU1d9AOdR3sCCo/S6pZ0n+lsSfH14LjT6Oyk0KFB6f8="
									"test multiple cue package inputs prose":     "prNTAUzurJklnRy5R2Pa/GWn6tfVITWVKUOX3URD3bA="
									"test cue package + other input types prose": "A52nxtgl1nbEjl+IIxj3tZLCDwxuVRtZeC0tU4tWBAo="
									"stdin data":                                 "cE1NThQnphs0esNTK9TXZ3309MptDjTqWOQoplixB6o="
								}
								multi_step: {
									hash:       "M52PIJQHP7C246SDG99FVUHNEP6GP3F985HUKMUUDGDNP34V459G===="
									scriptHash: "89HBMOT8AA8UQ8IK2O3ALTSIC68PN1CPK8P82O16CPN7KV1FOF80===="
									steps: [{
										doc:      "# \"A <u style='text-decoration-style: dotted;'>CUE package</u> input can either be combined with other <u style='text-decoration-style: dotted;'>CUE package</u> inputs,\""
										cmd:      "cue export .:A .:B"
										exitCode: 0
										output: """
												{
												    "x": "foo"
												}
												{
												    "y": 2
												}

												"""
									}, {
										doc:      "# \"or with any other types of input.\""
										cmd:      "cue export .:A data.cue"
										exitCode: 0
										output: """
												{
												    "x": "foo"
												}

												"""
									}, {
										doc:      ""
										cmd:      "cue export .:A packageB.cue"
										exitCode: 0
										output: """
												{
												    "x": "foo",
												    "y": 2
												}

												"""
									}, {
										doc:      ""
										cmd:      "cue export .:A data.yml"
										exitCode: 0
										output: """
												{
												    "x": "foo",
												    "y": 2
												}

												"""
									}, {
										doc:      ""
										cmd:      "cue export .:A schema.json"
										exitCode: 0
										output: """
												{
												    "x": "foo"
												}

												"""
									}, {
										doc: """
												# "A <u style='text-decoration-style: dotted;'>CUE package</u> input cannot be combined with other <u style='text-decoration-style: dotted;'>CUE package</u> inputs
												# **and** other types of input."
												"""
										cmd:      "cue export .:A .:B data.cue"
										exitCode: 1
										output: """
												too many packages defined (2) in combination with files

												"""
									}, {
										doc:      ""
										cmd:      "cue export .:A .:B packageB.cue"
										exitCode: 1
										output: """
												too many packages defined (2) in combination with files

												"""
									}, {
										doc:      ""
										cmd:      "cue export .:A .:B data.yml"
										exitCode: 1
										output: """
												too many packages defined (2) in combination with files

												"""
									}, {
										doc:      ""
										cmd:      "cue export .:A .:B schema.json"
										exitCode: 1
										output: """
												too many packages defined (2) in combination with files

												"""
									}, {
										doc:      "# Tidy up."
										cmd:      "rm -f *.cue data.yml schema.json *.out"
										exitCode: 0
										output:   ""
									}, {
										doc: """
												# "When multiple <u style='text-decoration-style: dotted;'>CUE package</u> inputs are specified then the resulting CUE
												# evaluation is executed once for each package."
												"""
										cmd:      "cue export .:one .:two >2-packages.out"
										exitCode: 0
										output:   ""
									}, {
										doc:      ""
										cmd:      "cat 2-packages.out | grep -c '^{$' | grep -x 2"
										exitCode: 0
										output: """
												2

												"""
									}, {
										doc:      ""
										cmd:      "cat 2-packages.out | grep -c '^}$' | grep -x 2"
										exitCode: 0
										output: """
												2

												"""
									}, {
										doc:      ""
										cmd:      "cat 2-packages.out | grep -c '\"x\":' | grep -x 2"
										exitCode: 0
										output: """
												2

												"""
									}, {
										doc: """
												# "Multiple <u style='text-decoration-style: dotted;'>CUE package</u> inputs
												# cannot be combined with any other input types"
												"""
										cmd:      "cue export .:one .:two data.cue"
										exitCode: 1
										output: """
												too many packages defined (2) in combination with files

												"""
									}, {
										doc:      ""
										cmd:      "cue export .:one .:two data.yml"
										exitCode: 1
										output: """
												too many packages defined (2) in combination with files

												"""
									}, {
										doc:      ""
										cmd:      "cue export .:one .:two schema.json"
										exitCode: 1
										output: """
												too many packages defined (2) in combination with files

												"""
									}, {
										doc:      "# Tidy up."
										cmd:      "rm -f *.cue data.yml schema.json *.out"
										exitCode: 0
										output:   ""
									}, {
										doc: """
												# "Issue #3341 tracks a problem when combining a *CUE
												# package* input with a <u style='text-decoration-style: dotted;'>constraint file</u> and some other input types)."
												"""
										cmd:      "cue export .:A schema.json data.yml >3341.out 2>&1"
										exitCode: 1
										output:   ""
									}, {
										doc:      ""
										cmd:      "grep \"cannot combine packages with individual schema files\" 3341.out"
										exitCode: 0
										output: """
												cannot combine packages with individual schema files

												"""
									}, {
										doc: """
												# "The <u style='text-decoration-style: dotted;'>CUE package</u> input must be the first input specified in the list of
												# arguments"
												"""
										cmd:      "cue export .:A data.cue"
										exitCode: 0
										output: """
												{
												    "x": "foo"
												}

												"""
									}, {
										doc:      ""
										cmd:      "cue export data.cue .:A"
										exitCode: 1
										output: """
												no encoding specified for file ".:A"

												"""
									}, {
										doc:      ""
										cmd:      "cue export .:A data.yml"
										exitCode: 0
										output: """
												{
												    "x": "foo",
												    "y": 2
												}

												"""
									}, {
										doc:      ""
										cmd:      "cue export data.yml .:A"
										exitCode: 1
										output: """
												no encoding specified for file ".:A"

												"""
									}, {
										doc:      ""
										cmd:      "cue export .:A packageB.cue"
										exitCode: 0
										output: """
												{
												    "x": "foo",
												    "y": 2
												}

												"""
									}, {
										doc:      ""
										cmd:      "cue export packageB.cue .:A"
										exitCode: 1
										output: """
												no encoding specified for file ".:A"

												"""
									}, {
										doc: """
												# "If <u style='text-decoration-style: dotted;'>CUE package file</u> inputs are present then their package clauses need to be
												# the same as each other"
												"""
										cmd:      "cue export packageA.cue packageA.cue"
										exitCode: 0
										output: """
												{
												    "x": "foo"
												}

												"""
									}, {
										doc:      ""
										cmd:      "cue export packageA.cue packageB.cue"
										exitCode: 1
										output: """
												found packages "A" (packageA.cue) and "B" (packageB.cue) in "/home/runner"

												"""
									}, {
										doc: """
												# "but don't need to match the name of any <u style='text-decoration-style: dotted;'>CUE package</u>
												# input that's present."
												"""
										cmd:      "cue export .:A packageB.cue"
										exitCode: 0
										output: """
												{
												    "x": "foo",
												    "y": 2
												}

												"""
									}, {
										doc:      "# Tidy up."
										cmd:      "rm -f *.cue data.yml schema.json *.out"
										exitCode: 0
										output:   ""
									}, {
										doc:      ""
										cmd:      "cat data.yml | cue export yaml: -"
										exitCode: 0
										output: """
												{
												    "A": [
												        "b",
												        "c"
												    ]
												}

												"""
									}]
								}
							}
						}
					}
				}
			}
		}
	}
}
