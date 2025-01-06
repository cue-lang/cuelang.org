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
									"cue export # package x1":                                   "5+eA9ipei+nC7v9LE0ib/rXC4Ie0cDiZwfX8ag4mce0="
									"! cue export # package x2":                                 "684B3IH3RFXmV3SO/jz6WxwgZRCb/kK/oLkC3++tsu0="
									"cue export . # package x1":                                 "ftaWelKvXYWPipIIUfruyJal91jYQ1ehT7T1lXE1UoI="
									"cue export .:one":                                          "vqpbTdRdV0s6jduex7rElSDB06+bHii4hkwQG4xOcCw="
									"cue export data.yaml":                                      "1ILz+fCF0PjgAVuIM+vud5o/gfLu0wzgwrzlsVPXQM0="
									"cue export yaml: some.yaml.data":                           "blpLMVLoult2p6r4cFFR2BoNq+4WgMNmjcuLE9S0I1s="
									"cue export .:one .:two .:three":                            "ZodKljWvJuvVHGzofBL1O47lmcZVufj97S/BHGbhbpM="
									"cue export package + package file + data + packageless":    "/SXUyj0KZKJTgVxNslRE9x5KSKAbhhWDWT6aq60BEnE="
									"package file + data":                                       "ewHMWHxUjQkDu2gGcjnGUbXXs7rO2MKsGtnTapZYru4="
									"cue export package + 2x package file + data + packageless": "IqqMomeTMH5fz53r2E3a9+crr0K6KgMhhqGyQrAoPlo="
									"data file inputs":                                          "3N58U6H+oUAMQWwnlGkjstJDjawFGQuu5Aw/RVSbU90="
									"data file inputs failure":                                  "//zt+TtJvgrzN4JzCowCvuEg61fGsVGn5aA/Hy9ttrE="
									"constraint file validating data":                           "JVfuaFgCzRsz+YAJQaVz3aQxgxdEvU8eXfG2a3Dsp/k="
									"constraint file exported as data":                          "32FpSxBEuboT29aWpoJwHHyIFCBVnXKo1dONTpxD/PA="
									"-l static single":                                          "c23HoqqPfR4rLOQ2Ewo+N39xNNWjRUJ1icszDxBBtyY="
									"-l static multiple":                                        "G/VOv3KbMGkksjhoOiLmAvzG9Z0Nx0JEuSd5EtN6aPM="
									"-l static multiple files":                                  "cehOe0FXpovk1JqOt6XoK3X1zdZL5cMLedydxfxZ1c8="
									"-l dynamic single":                                         "Nm9GTCeUhxNo0ZHKjNZNZwLrhxCDup/V0hmbRu+gAUY="
									"-l dynamic single with function":                           "C+BIAke+y6M33/VyRdCx/Z91g7Qqa3TZtOD0QV8owgI="
									"-l dynamic --with-context":                                 "risf4TXi3O1CahWTu1bT9omLjnyxza5wsPf1W8x9ZuM="
									"multi-doc merge":                                           "JW8yUJOuvX4AAR1fEGlIi2gGd9VSysOxgGt/AFBhsEs="
									"multi-doc list":                                            "6FLGoXbbj5VGpM0o6XvPat9V8xiUHNPLI/OHF6yfY1s="
								}
								upload: {
									"test cue package inputs prose":              "+SfAirfMG5eCr54RG0qSigUrmffssgm+A5/czoR3vaY="
									"test multiple cue package inputs prose":     "wFQuIGFodNYFf8sLWD72YbeTsfYORhr7REGzpquouWM="
									"test cue package + other input types prose": "QyvzldR5becAqNfmBGi3TW/2SmtN6aIarfQ8ZU/sl7U="
									"stdin data":                                 "SEPHMf/2z42RBOcQkv5EArcknHtRqnd5bUlwUq2XS3Q="
								}
								multi_step: {
									hash:       "CG9EP6295FD9FO5PLRPMT9MQTK7T29N11N7DF0I2S2RQCLQFT8E0===="
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
												    "y": 2,
												    "x": "foo"
												}

												"""
									}, {
										doc:      ""
										cmd:      "cue export .:A data.yml"
										exitCode: 0
										output: """
												{
												    "y": 2,
												    "x": "foo"
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
												    "y": 2,
												    "x": "foo"
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
												    "y": 2,
												    "x": "foo"
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
												    "y": 2,
												    "x": "foo"
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
