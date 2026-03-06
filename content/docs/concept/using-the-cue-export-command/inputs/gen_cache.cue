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
									"cue export # package x1":                                   "xZe3SzfJAAO/utHCRmsrpWdRtoJnhpFdzs1jBttzHp0="
									"! cue export # package x2":                                 "+GIx/r0vI590430cLi6lDYeNzLynoGhst9RE9Rlpxcw="
									"cue export . # package x1":                                 "eKPNowVd9eDy8SqAJ0OHVRX/2BnVuYJzyrmsNY5JIoA="
									"cue export .:one":                                          "zoBco61axEA2Ql7h618UYTg9kEukkLA74PIIPFp/z0c="
									"cue export data.yaml":                                      "BX3RkoP2LhL8x62tAxcMl6UKk1dFZQ0TEEa6b2JuUDc="
									"cue export yaml: some.yaml.data":                           "mkLNnl3ytRmGGK7K/0kYdvH9+EpwjL9TL/A7Bb0Msrc="
									"cue export .:one .:two .:three":                            "0xVXLPU6msUR32px60H5aQaRSt2EJQjxb2pS472rftc="
									"cue export package + package file + data + packageless":    "02XTzEaQ7HyUoX0jblGblbIm9f2GGYP0AiWvzhqJheE="
									"package file + data":                                       "JoJCIvmHxcDp24/Bk02vCP38PF0Vq/ysCuzPp0Pr9l4="
									"cue export package + 2x package file + data + packageless": "4OyGYvmj0+qQDSD6e5IMlQfFXj/V5fCcmG3VEKJaqX0="
									"data file inputs":                                          "/EegZw7B/eJgVuBDRgzDQiM+4HauKWlSNYoOjkIF5xo="
									"data file inputs failure":                                  "S24lQCYo9yTbVmM3yM9JpI95z2b2QnaCEvucqpg/m/8="
									"constraint file validating data":                           "wBfPyAO++V5pcHyGWXPavF0MfbdW4g6ZS0WannKKbPE="
									"constraint file exported as data":                          "VB7hi7z4/8JGji3/0NajUez/f6TNd6Q+N/edQyBgmqc="
									"-l static single":                                          "daYA6tnu4V0ULp1017Sgl69KUi4GYB7BWuLD23e/V7A="
									"-l static multiple":                                        "oBkXeKuDLFkMpHJ/Ugl9DH1pKS3q592BaqFHk3kFHDI="
									"-l static multiple files":                                  "zd6DfHIg0OYFjDdP6KnCqJO8nS0C5NuABYfAEcnv5nc="
									"-l dynamic single":                                         "7uOejFu+hKeTdsl4fA9OQ8yKJjnwgD+xGNSqtQIZ2sw="
									"-l dynamic single with function":                           "j4uYeIzhJ+9FKl61a/gHI4vAKFi9b37kMIdKDQdfdqY="
									"-l dynamic --with-context":                                 "sBKZIhft4bLMtGSA+aAVEoHBv5iLjk/RVCTZuTg8i9U="
									"multi-doc merge":                                           "5kcxbZuUvrMEZirI8QKjNT0mPCl3+GzHHM3EqNAR3hs="
									"multi-doc list":                                            "oDYDkAhT4ikwsXo/FOgwIjueqCwlc2DWPwlMaDlnzoM="
								}
								upload: {
									"test cue package inputs prose":              "MZeGFAr/GvRI52bPyPfwQhLbXoosRs6/qRlcb9COG9E="
									"test multiple cue package inputs prose":     "xDIb2ziuA2sBpoG7UkkzmpWTR81a/cvHs2uahAf9aCo="
									"test cue package + other input types prose": "vrABfHWYWLxcoQ6HFxBEffJJGB7rZuAnODmKTKze7sY="
									"stdin data":                                 "owneo3utUOHtk4g4vhDaUvOtO6qDtN+QNgQIY2Szk5c="
								}
								multi_step: {
									hash:       "UK0HVC0AJI6E9ACOLB37BJS62HRU8M8J8Q2D4AKEL6RU417VLQBG===="
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
												cannot combine scope with file

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
												cannot combine scope with file

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
												cannot combine scope with file

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
												found packages "A" (packageA.cue) and "B" (packageB.cue) in "."

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
