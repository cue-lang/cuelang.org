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
									"cue export # package x1":                                   "eIrsqem4ZfBU5Sp+PsXac5vslWEh5lcM5VZT4DIb5PM="
									"! cue export # package x2":                                 "x78Tzh9zYT8g1Fm7eDekQoRMVs9xH9PM8gZXV+NtMcc="
									"cue export . # package x1":                                 "OVkkesqzFjAzv55jrDvncUMPOcHGCwLlqWoc8ydwbuE="
									"cue export .:one":                                          "rlbTwlra7XvLK6iazoLtGb8gNa1SeQBudYBtik64hc0="
									"cue export data.yaml":                                      "YfdULR2hq00iwB6IKZYNMJJar1IvQSFp+02CzVdNsIU="
									"cue export yaml: some.yaml.data":                           "6qIlfa5yq1m1lOuKY8FSKfHSAsGA4TI2DIYq7iQEo0Y="
									"cue export .:one .:two .:three":                            "BymrliJx0vaE+7vqxBV/pzDc6mHXeZq6+P2HlsceXcc="
									"cue export package + package file + data + packageless":    "4aen87uEDMmkIYHku7jeDYWKu1AEIelVMyCpWzWNQpI="
									"package file + data":                                       "340jL0aQsz+zxWY7l9HzWfcZ/3Zi+ulCnTjX1dlr/ms="
									"cue export package + 2x package file + data + packageless": "tkQrDKFs5AUyjoXh7aOMA4vw/SShfzupXzfYFM4bUuQ="
									"data file inputs":                                          "YFxjuqBFbHM4djz1MFaxMNuQJW2dQlJhrL1XwHEYUkI="
									"data file inputs failure":                                  "5PQVL81dbSSPyEBOZBHB8eFQupqn8P3JPT6fAHbmUMc="
									"constraint file validating data":                           "Rx74ptALKi73fiw17Vt892G24DrcOMDFje+hoCf0C/k="
									"constraint file exported as data":                          "2WGQjMEyqS5IjLgAylbwJw5Gfol6CHC+W30rXTeT/uY="
									"-l static single":                                          "8oGdlMJVbasRlfoiBFiWJW100n+lzG/dL44YHHOHMaE="
									"-l static multiple":                                        "UuZxa7q3mRSOA3lR4cgQOo9cv9+cJQ7tuMaBhoIWd1M="
									"-l static multiple files":                                  "4I2oA9mgqElFRHq088n8OwWmMFzflnKYqBBr5YGhfmc="
									"-l dynamic single":                                         "h9M2yQ4FaE2JWoFgW0VBkEQ8Te5VPxAdB0BiH2wtz5Q="
									"-l dynamic single with function":                           "Z4nf5op7g7NzvmvT8szO/GE9mlgq1XYnEU7PPvIPjQ8="
									"-l dynamic --with-context":                                 "EHqTpyt53J64B9lqWvvWZExFL9JWmgfhWFAU5Aw4FnQ="
									"multi-doc merge":                                           "ctAKwgOxdvZRU31XP9dvJM1WVipG0MjOiM6A9LxyLec="
									"multi-doc list":                                            "pwRQSzkSIXiuxN6K9URyXdqv+zTI9zGBRncotnl/YZs="
								}
								upload: {
									"test cue package inputs prose":              "bMs1AIXbJmy4JfRMosi69TX1On4E5Zb8VHGKPpSZpD4="
									"test multiple cue package inputs prose":     "2LhT5oo8lrZjtLwEhjbvlrNax6G3JD2yxKcFo9itKao="
									"test cue package + other input types prose": "9fsVk8NqXv1+P/ICocmBVWUrk52FkykCpi0s4JPeM9k="
									"stdin data":                                 "NINpwqTrTOaIPjMDEzOx3qtDK6RJRl0bRyUOQ9kp8NM="
								}
								multi_step: {
									hash:       "26FNND8I9OAPGGPBMKN75127G0FG5B4K49MPM5SUQJD2MN2AP5PG===="
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
