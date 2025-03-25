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
									"cue export # package x1":                                   "mjN2XsDYVPar014zXq0czy231BEqtsrz6GzrHde10zk="
									"! cue export # package x2":                                 "2oc6XT/wr3UYfRFP9DETm3UudZdu3S95kERbttD/Vx8="
									"cue export . # package x1":                                 "057q6Gn4CSb/Ba/UP2HSxnmS5HxogcuNzslK7re6cOU="
									"cue export .:one":                                          "Q/RxifhixLW734UUaIZQBhCKSBpWoDuJ18upC6a/kYA="
									"cue export data.yaml":                                      "aZwUAc7UCQccNrTieePhoSk5rLt9o2Egk+M75u66bgE="
									"cue export yaml: some.yaml.data":                           "FO6MuH8zKVFwpxAfZtfOd4jZvahgQlMY4nH/jgxktJ4="
									"cue export .:one .:two .:three":                            "CGDto7E+b0d3ihN2tmTME618450prFtPsmZr26nqVeM="
									"cue export package + package file + data + packageless":    "RFGgz/8caN43U/vIO+lSYpeIuG2B30Nf/XpzYw/Z1DQ="
									"package file + data":                                       "obhdinjM3RH4cNownAmMu4kRA8KGoxI4K1JoFdNHpOs="
									"cue export package + 2x package file + data + packageless": "cXFY13u5+x+Cv8OiXLHwSQW7Ckk7lxlXm0t0yfQ01mw="
									"data file inputs":                                          "OxMqyf4Z5IrGCSvc2D/zYZaz3CK6yykSKrNURMT80YQ="
									"data file inputs failure":                                  "i0gg15ivECcUuV1AZkn6q93ypkjTx7wYzVeakEEk0c4="
									"constraint file validating data":                           "oCwefO7y4seyD5JWjEvwKNw5TAMHtUBvq6RHr6WoC3E="
									"constraint file exported as data":                          "fWUnVxmFbmMdjD/+89hYiC3whE2MY6GK4ZyiaNE36XY="
									"-l static single":                                          "MfMs92ba4LB0hDbDBcJ/UogaxxTGF7KgeVJ0dM8E0No="
									"-l static multiple":                                        "ay7OP9IdeNwdn8hFcy0HLp6AaOrE7R7acxKz8gNLeKY="
									"-l static multiple files":                                  "mkI+zIAxCyFi4NUUESjCQ2Mk+/6BsAa/X2cJQ4h+BFQ="
									"-l dynamic single":                                         "8h8U0nWo4iD8qxJTRk0qSfy0E5gCTDNHB31vuE973go="
									"-l dynamic single with function":                           "QSi+wlHPzyA5KcOhq3mRm/BN6iQcNwHliICdeNuPX10="
									"-l dynamic --with-context":                                 "0xUBCmZH4bdySuCzomWWRKBi0lizX2fsGyKYxV+uJ7o="
									"multi-doc merge":                                           "wFOWWcWCN2uqkdbciih2ubXcJGZPXM8CFY12cLiztBo="
									"multi-doc list":                                            "XveOJYkmJ8caC0o0gAYF7nTWu8uZ8jeRZQWym2Jh7KE="
								}
								upload: {
									"test cue package inputs prose":              "HW1sojY+Uish3I3WAIpD3ca75OSSoFAftA8eQ7DNVSU="
									"test multiple cue package inputs prose":     "uXFAaDajCAUI4aqnbxhAYGp+26I8mzGBEcjO/f2cvAc="
									"test cue package + other input types prose": "CE5DIhfWhwPdGQq8gcuZGnm2XmHj+XrH/Xi9seyQ0Jc="
									"stdin data":                                 "dJdYOg8+8xCTX8AxLsll9ymUr5HGQ+kNKF/NgSwQckI="
								}
								multi_step: {
									hash:       "UON5NA07TJRAOE02LM0OK5R6K7M1JB017K6H6ENKG7K71S9G5V9G===="
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
