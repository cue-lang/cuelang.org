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
									"cue export # package x1":                                   "uA4n6x1ZpsW0jrS0zvXUnS/H+qTrLoKvooFBv8eRWbs="
									"! cue export # package x2":                                 "EYcPaRv0UiTY7Hx1Esayyu+gY8COH1DF6ksl3AoxMdI="
									"cue export . # package x1":                                 "4nH4hbjdDtIa6S802M+wuXLJVOwWyYU0Byx+8lK1QhM="
									"cue export .:one":                                          "0gLc+QGt3pl09BY0AuKB85Zx5Pjma9aVxaegg92l3t4="
									"cue export data.yaml":                                      "1apqAL1UhWNY0212YnJ1sOlXakxyU0rVHsfWDQjlrlY="
									"cue export yaml: some.yaml.data":                           "TRF0gRbNPhGFjsq0XL4BuOHb13K5ykQkzY4pc3szvrw="
									"cue export .:one .:two .:three":                            "nsUZN3CDdhRbVDeOjKfGgAGUG+w7gSBnsuiB0HoRGD0="
									"cue export package + package file + data + packageless":    "UEvE6//uQz9oijXYamxf3uuQGB1YOjXRYnDsq2UIJyc="
									"package file + data":                                       "CnFeNIsOks9vK5LhwAZNYJuauA4j2+WMmAChu9xaSTY="
									"cue export package + 2x package file + data + packageless": "FTFNYpVL9jY8ygLcEurg6CPnAMFTzjXNaTOYBop6blE="
									"data file inputs":                                          "/o7xIY2XckCuBO6Z2CYkf0809ATktP4KvafHBrMPgbc="
									"data file inputs failure":                                  "gsoDa8gweuEorpUmxzu5KnY8ysJnO229VPfy8MPgB4c="
									"constraint file validating data":                           "7iPONdsPvH6BWAcd9tSnp8B8Ad793Yo4p7y9SefEkYo="
									"constraint file exported as data":                          "dka+3JqI9IaIrZRYcv3SOGCQBak6/R3i49B/J3mkrR0="
									"-l static single":                                          "0A0kw4G5qqnpyUx9xuAS0o3dFqBHiZAXJRm2N5EtKls="
									"-l static multiple":                                        "R7Xl2eq7UIsXvdeCQIANEwYgzoX/lRox+xL6Cxm4wSM="
									"-l static multiple files":                                  "wjmlhXinaUpmYF3lmwgpTGe1+iIHcpJ0asOpKyW7oPY="
									"-l dynamic single":                                         "vQgsMmG/F1vAKYmVVm6lXADqN7UuYPIzFcGCySMGWCc="
									"-l dynamic single with function":                           "UF2D1cAIbQJYmSXIBD8i2WTJfvSiQByOMV+cRYf5OlA="
									"-l dynamic --with-context":                                 "+RRIrG9Jrnllv7bNcuqfEtaf4Ns7iWZR4FYrdb47KNU="
									"multi-doc merge":                                           "7ikCp8gqXenWVDUsIpyrLRcq46I+rbM5R20a99YWSdY="
									"multi-doc list":                                            "FCFSIYFrGKdzU7zgNAD4XMzSYGu/FAnVMLYxgUeTgwY="
								}
								upload: {
									"test cue package inputs prose":              "p6uMfXrHrscrzCY6shkeBT7iNVoDcX4GN0EX5E+bJUw="
									"test multiple cue package inputs prose":     "XWrdiQnRkjHeZmIM++dx1eEdQanZG//pcOhNEXDilfc="
									"test cue package + other input types prose": "FewtZ9Xp5ZstJwy3JIcfB6FXqIUF3ZvUoMQd0Zc6/mc="
									"stdin data":                                 "Npx6R8wXQ2ICtKF4Q4PumT6SMvlthekT9COupF0ECZc="
								}
								multi_step: {
									hash:       "HERKIBHCDDRD4MCRBVIA10888DA0JJM35D53NSKNVJ8O0O5K07C0===="
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
