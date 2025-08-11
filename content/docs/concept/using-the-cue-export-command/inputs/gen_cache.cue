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
									"cue export # package x1":                                   "ljf4oUeJsqKfiLN8xjCrJFxfuZXt7NAZKsIRMLlpAFs="
									"! cue export # package x2":                                 "5gl+dDFBfcr9c1OI1w8QnwTirswl817zqMNrrn3WzLw="
									"cue export . # package x1":                                 "GafzwWPUYCwCqn08GGwkw7DZDET2we7Lqr3hh4VP1Zw="
									"cue export .:one":                                          "u+6db4XVZnQV8nlcQyZmmErz8hI2JXi5XK7NaC3jOIE="
									"cue export data.yaml":                                      "rUgsJid6aNamiYJTeQQMRn3HuhHSyVTjcnPiXc7ry0c="
									"cue export yaml: some.yaml.data":                           "SmP2Wcq5VFrBoPqv5GU13UfSEag61/9ihQjnp+MdHpg="
									"cue export .:one .:two .:three":                            "zPwVborkMkOVTWQnywyOJlGyWDQUf6LDYBcdoIZwLyQ="
									"cue export package + package file + data + packageless":    "e/eV7CbXtOPNdDPWDe+knWGVR1NesEDaxkG9+ZtkIzE="
									"package file + data":                                       "rQLjLzypvyJRdkMFwvwOHIdPo78iAD6cPZg1O9hKruo="
									"cue export package + 2x package file + data + packageless": "G9r/V4qc0nsLZYo3ZxgDiFcBvH0lF8hZ1sk3ENEn9p4="
									"data file inputs":                                          "3YXkZhXExxlhnbi5Fw9Oa+KtpEizpxwbui/2W1GRpOY="
									"data file inputs failure":                                  "io137bZuep0mDP+DhfN1Z95NaVwl+rU6ZPjGB+hUdPo="
									"constraint file validating data":                           "NwCrItAq3/1dBuhA+5vj83Zc9aGnyyZZ+TU0lvaW6uQ="
									"constraint file exported as data":                          "t+zGEqHIQ+29o8GKTkB9X02FZ/IbF+2AhazFsj6sBto="
									"-l static single":                                          "X+LyDIwgwDdydi64CSdBhAshCQKPBehTCWnu8v0NM6c="
									"-l static multiple":                                        "Y0Qoy1MWiJeZrd/sfnqZBCYErlIE2ipZjPkGTxcv0x0="
									"-l static multiple files":                                  "mA1/ejb19WeTtTXh/DoDK1tQKB35dtEKH1yuZ3McLb0="
									"-l dynamic single":                                         "EMRLGaXor1itNWIomOD1rxWUHJIRNrXxwAjHhlaA11g="
									"-l dynamic single with function":                           "cX/7nJJ9NEYcX76WsCMddPyUnAP6fpchKH1/p46u1y4="
									"-l dynamic --with-context":                                 "2KNC9Oj+GSoP9BJNYMzD4O2T2ckCOw4sWpJ/HSLoz/A="
									"multi-doc merge":                                           "8l0hEloHoxJS7Qr2sl/mFxC+lZxRoR+oEtPjGBWenVs="
									"multi-doc list":                                            "zvFeyLmAQtdeq9Put1Q3APOEg5KAAVsjqCf2acjZ4TE="
								}
								upload: {
									"test cue package inputs prose":              "mgeUygUJS7ra0Fp9Dd8VX5Ta28qCIRYB8WAjCNQYuHY="
									"test multiple cue package inputs prose":     "3zGnIqe5nEhvud/jPxAMjbhedWzbyyDLBAdPALXG1fk="
									"test cue package + other input types prose": "jeWIbOga/vbXy8yeYPRRQ/OrIWR+VVGJa2JtZDJm7Gk="
									"stdin data":                                 "6svemosrwbue5Gq9qQ5iCIKxTvU26wlU51Ns/RZbm2Q="
								}
								multi_step: {
									hash:       "U6CUI317Q27CE2BB96QFT8TTQULQ7NJ82UTCOMG04H6U43BMPRF0===="
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
