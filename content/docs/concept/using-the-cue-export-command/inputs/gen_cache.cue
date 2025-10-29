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
									"cue export # package x1":                                   "JY4LLDEMPnlqq5eZePdStLmnjYc9Az+ZybysZ1WOb+M="
									"! cue export # package x2":                                 "NxxuQCM2xefudqqOYvPqS6/qYZIN40xvmLmvnKxGIrQ="
									"cue export . # package x1":                                 "pf5FBKbHbNg1al0ZSHqusfFM2FNCQG6atPWBzXLkGtg="
									"cue export .:one":                                          "/MLOmeqZGwdlo1IF+m06Zu98E2epasq5iaF3Ibvl7Hw="
									"cue export data.yaml":                                      "AwUsodusEUF+ApsZTn0Vyfr3TO6Hg5NBITatl5mU4Ow="
									"cue export yaml: some.yaml.data":                           "TRPY8WCK7aD/TArnItHP/WqvY715Nlj/tUADW2d/nWk="
									"cue export .:one .:two .:three":                            "+lMVWB7Y5lFqtq2PuB40DepcRBEB8q4bImRF6CwCqD4="
									"cue export package + package file + data + packageless":    "uleNHSzdLLB6wIa4Nmj4N1Bvde8MskZ5ByYqabLT37w="
									"package file + data":                                       "lTCqPkVSiP+gAWx92Ci7QT77zh8dPF8ZifPpa7VjCIU="
									"cue export package + 2x package file + data + packageless": "XKD9KehdydK6uCeRcinOBT5LRqiR/queor1srKPoQt8="
									"data file inputs":                                          "BJaL6IRwm/8SyMslC5kAF7Efmx+kcY8V+bLU5im5Ob8="
									"data file inputs failure":                                  "A6hNyZ8w/QZZV8Uc8HmXD6tIGI7/akB9caiQz/kTXZc="
									"constraint file validating data":                           "2GtrBsibkTeXxYohLDUJd4kEJEs0qroTvfAHFueYgQE="
									"constraint file exported as data":                          "iqr5u5kj4vuu5HmMLvtZH4aGqECajHPivAStAc6B6a4="
									"-l static single":                                          "hanL4PutRSV6NFOkX2s8VEgky1yfLHBOaByjInZOY7U="
									"-l static multiple":                                        "NSRULLrxfZgxNGHbNJCg3dKMmdfc62NXwlUvdVo9KTA="
									"-l static multiple files":                                  "E8r0OD613dYsn4T9yrdnhwX06mKxoM1LcShdho5Z3DA="
									"-l dynamic single":                                         "jROxdcUJ1120AJI396q5EpHdHH649Zj4BhZgZBiJn60="
									"-l dynamic single with function":                           "SZC8xhrx1tt/Y43WcJZQl+K4TyIeuFkTHoWVJzAnbLE="
									"-l dynamic --with-context":                                 "jzpwPr07+3yFTcbWOSEmlQqffAs1bO/7THHo/bnx+dc="
									"multi-doc merge":                                           "qfsgAffEhngVALjUMUL51MEO0RuNvwTMzC50WjO2/gc="
									"multi-doc list":                                            "9NWceNIclm6wY+BYlD1Rp43hRDlkSVuqCNspzm9SDns="
								}
								upload: {
									"test cue package inputs prose":              "TTbINTGGEFr7BRIiG0d/EvFToHU0TsEHdZyUdKRYPCM="
									"test multiple cue package inputs prose":     "NR2n7u031zsKb0kGm9NtAFPIk2O+MWwuoFPr5MdeD94="
									"test cue package + other input types prose": "plzU/eZy1ar1Eq2alQtg9A5HB8iExievbB6OdE1FHO0="
									"stdin data":                                 "nRLYqGHMTlhyQoTZEqGAKtFYMuvFxORGxFt4OxkFXJM="
								}
								multi_step: {
									hash:       "VUM3RP8DC3I90CEA0DDA4OOCNGOS527VOR8VDHEH1D88IAG3J6IG===="
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
