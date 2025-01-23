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
									"cue export # package x1":                                   "ALdaLy7lvl3KRlmwAdeOp6Mmv1HxFGA/oIpD1MN8Hxo="
									"! cue export # package x2":                                 "oWiGaigklTWMk6iyAIGhY4PucQwYHIo9DbINS1YcEcc="
									"cue export . # package x1":                                 "4qG1MTfrOy4RYJSGrYR5lAHMJYTRw7iNBN9LTll0EtU="
									"cue export .:one":                                          "VcYJlSnH8lG2j/LSo6zqlltRNpPj9o0GqsOEwaJ5IyE="
									"cue export data.yaml":                                      "sDBjzcVzfuWjsoAO8g3ALsPcs8C2DdYoVruE2SB3Da8="
									"cue export yaml: some.yaml.data":                           "rJQb99fp22pmr3TiEUCdyzAnEJ/SSb4m2pbEcgu06Kw="
									"cue export .:one .:two .:three":                            "JunrJku6UetvqXYbDSpbnT5H7Vqc72bO4xVoNWWYHg8="
									"cue export package + package file + data + packageless":    "rgGMDEdOf12L9bSslc4xJL5Hb8HGWMB6hgZq1jCLWIY="
									"package file + data":                                       "EIuYfTW5shlPBmmmNmwzxVSTE4vchOvnhyKEBOA2z5o="
									"cue export package + 2x package file + data + packageless": "B0C2OIf1qs8T1UL1a7Xlde3N+izEzdfLtZjtbqVs/Wo="
									"data file inputs":                                          "S0SEEsBT4F2RMr4XEPPIG67gwQZG+TYbvWfaDLRQ6n8="
									"data file inputs failure":                                  "UzU2TuMCCId9HEX/L4SSHSqCSWnCSsVH0RhotMOzqxU="
									"constraint file validating data":                           "V+1MLndf8QyO3ENkjXDmMoAGIlgnZXdjUj1PnpugXbY="
									"constraint file exported as data":                          "fgFL8NwZ22nbUsgi5GFx71GyXxxl3JhX45YZgdaXR2E="
									"-l static single":                                          "cDJ6hJyuy1fj+euCQYp0JvCZYKoqZOlf6GbznZRPiEo="
									"-l static multiple":                                        "LnG7vjMIiAPuh7bgWzHCzc7FKLNplsY8+DR+GEEn9Pg="
									"-l static multiple files":                                  "RIIpzw7/U+YOqvAmDKsBgkapJQpiz0fhigGRrfEMnpU="
									"-l dynamic single":                                         "ul1wUNFORo9P+ZRvVTS7VpSqswHnC7jG4fJu4Gw5IHA="
									"-l dynamic single with function":                           "WTSntwD2nPUWJOcgeUpvrzXQYSgiCmF09gNJPZpg8AE="
									"-l dynamic --with-context":                                 "m02EACr6RpDdlmkwe78yGzqog2BiuSRfL8Gk1nYISHE="
									"multi-doc merge":                                           "iY0SvaMKmnU7sh7ECfXKjCGyGdvyTcREH6xq26PgFg0="
									"multi-doc list":                                            "PigWxLYAtngmQRjPdf5kBxDC234iyK1iRth92cI0O7U="
								}
								upload: {
									"test cue package inputs prose":              "pEmTVcLMVDHTotfcCUx04Hxhg4SgX9J9Xlcrt0CXNVI="
									"test multiple cue package inputs prose":     "3eOy0tb3Lt/VFna+dw4iJ7+p2DpdGtG85XZGDE4IxDE="
									"test cue package + other input types prose": "UtHYlduKkzXBxggI5Dv85KM4Asa3+cUnif7ZcoDEaXs="
									"stdin data":                                 "hqOmEiaKA+X8s+nBHUXh2s8wgHzzO2ZJbH1JuAI6NkE="
								}
								multi_step: {
									hash:       "OFROPMMU7AL64P5EE49CG3FEUF760C2FGNTH45400KA8HF4DDD6G===="
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
