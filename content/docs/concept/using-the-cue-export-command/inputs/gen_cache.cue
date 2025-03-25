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
									"cue export # package x1":                                   "3XTZZ5HKZny5SDjXaWpm/lRY0GDh0Cv+pNefOMu1l4g="
									"! cue export # package x2":                                 "nrEoCeWT3uSqrqcupheMkYujAFCQ0bZVx02qVAyqLU8="
									"cue export . # package x1":                                 "iLO16ehVz/t6ryZ9VZKychCrUeyr7mXobxDxY5QJwTE="
									"cue export .:one":                                          "LAg4/tZWjEpw0NEGDPOnEp6YUtGu5im2Hr2W9lHNLq8="
									"cue export data.yaml":                                      "600l0jIu9uoMeNOYG77wEMMYjxOVRbwO0bbXGoMdxJM="
									"cue export yaml: some.yaml.data":                           "cjy3i4pkpYGtDaoM8s29NZdrSU81CQEWW2vG+nRZaGo="
									"cue export .:one .:two .:three":                            "sNajWF7QxTWw8ohYNMW3cOOaGjpu8/P9tuqOlVGdTGQ="
									"cue export package + package file + data + packageless":    "3aifbQSJPvx1Kkq5iCEAxIlnKVtcXTHna8eT0y5WSpg="
									"package file + data":                                       "Ihd+v6TTW8z9DX/eCTUd97i3mhZmBrRJecmr47lszQg="
									"cue export package + 2x package file + data + packageless": "0XBkRipeEMXwLd0yyWV+LB+u8XUm4YsJlZ4DBqUV5ig="
									"data file inputs":                                          "jXPUJk/Nz/XzEFwNdkZCUL8BHoKQkNg6AHlxbwJ7yyE="
									"data file inputs failure":                                  "DhNt2FMrk+42AYO4G0YktwkhLx46J7jqUxNBCOeK1rk="
									"constraint file validating data":                           "ehT19lrOr6zUUD2cod26pjNptWqCYUXYfk2oYbc1flo="
									"constraint file exported as data":                          "alXg1MPExcJHUb/rf8qxxiyCZ2AHw6vyQIVNhDM0Zkk="
									"-l static single":                                          "ReqzubAMD7XjA5EMJA/fe1ZuM3KZG0fpcTuXGw2lzgQ="
									"-l static multiple":                                        "ym8gP6bcz6HJXVSZvumZJ1oSZzadgjIkfM2vKc9Rpaw="
									"-l static multiple files":                                  "l+YyrsLbAvuWp+Ko+5Nl5KtYqaRTZwYuzp7BIlF2dp0="
									"-l dynamic single":                                         "ni5GqThEgAT/AU4JBuNBZFvQZizyl0USMVMEp4AYm1o="
									"-l dynamic single with function":                           "TUZxlEL0sV4RXqI3dhxqAbH1EE5HgIQUX2rKksGe2iA="
									"-l dynamic --with-context":                                 "KnjkZ8QA73poDUU4lepSLMl6sJ3gmY/ENS25+yQvCgI="
									"multi-doc merge":                                           "5I9weIbxPjnVV6y9Be+yLQXHrb/BFg8B5UN+1N67qfI="
									"multi-doc list":                                            "R0xY8oR7sIK9WAAw739RBwR49ciUWBQpsaMv0fACR+o="
								}
								upload: {
									"test cue package inputs prose":              "BAV+Lkr1WBKtzE88wQnYDA+KO34/aePQ1xdA32fItJo="
									"test multiple cue package inputs prose":     "6zG576JpY/xP41A4T88/eBi6d1jP9qNaH8Vtu14o9i0="
									"test cue package + other input types prose": "gWLYAUghKokZASzdLY4CoMqKPqpaFLqI/J84aXDeQEg="
									"stdin data":                                 "ACVOg+CW0sfHgoM8NfwnopdOokPlaDjtOMPsWGh1DuA="
								}
								multi_step: {
									hash:       "ABQ43JAGEQ1BPL5FQOU35BJ3ATBUM7EB6UM00K85SSEULAAD0U9G===="
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
