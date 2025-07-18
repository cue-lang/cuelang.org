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
									"cue export # package x1":                                   "et8BgTxQpiVmScsFay9Ltsls8ShGpSbfqj25J2QaL0Y="
									"! cue export # package x2":                                 "SYgc4T0S/Lw8Ai6yuEbFQ0SACUOzw0I6k6U4xskRE1E="
									"cue export . # package x1":                                 "esoD6E8eQ37RuPoorEr2KunZICiJzgzVuFT6dxGxiLg="
									"cue export .:one":                                          "PNdBQq0nokR6RTg2ua+bhtvRSnfwjwfE6jmL47u++14="
									"cue export data.yaml":                                      "+gmel0ZO+Avxj1rdk3kd0LqoggVWK16T96WlaTTxuPk="
									"cue export yaml: some.yaml.data":                           "JR1KVPi4mLq0AU/CwRnZldbLzSh8f1Cgw2UYoNjU3+M="
									"cue export .:one .:two .:three":                            "P2CDLmgKxDGUu07b+6ZQ4heT01oS2/9Uo//9t8D9rbs="
									"cue export package + package file + data + packageless":    "cP6SO+0lqfQk1u8PQVKi5/tfx6qcFTXiLxvQWv6Y8YQ="
									"package file + data":                                       "MhekwM7tEIOeH2DwkbXgYFyW9t8qgHIfUqqaP0xjoyA="
									"cue export package + 2x package file + data + packageless": "0ZhdcXD8gOGz/+ORrr0T3Cqcl4oPY1LuTfOUoGiPs9E="
									"data file inputs":                                          "OZ0/a4Tt9fVJEgEHtGRdQcAx9YVpnQwcW9DhOoTULvs="
									"data file inputs failure":                                  "fp8DrZscRJCyaE+6wqxGYuePDT/6R7wfvJMMAeGthKo="
									"constraint file validating data":                           "EIS55nxm0yPSeTUKsE92iIHAad4LEfXKuCkiORuc4GE="
									"constraint file exported as data":                          "kwgjbeF+hAhj7HBSUZnGCKOBK8rYQhU4V7KnFt/ro2o="
									"-l static single":                                          "LrHRoAnNNApgnQxAf6iXAAPT+zO0mHnlN8YU9V4hHvg="
									"-l static multiple":                                        "w4S8Qsz2eUdUjH7Ut7R/x3FFw4vaD4YfSXtQOG6HEMc="
									"-l static multiple files":                                  "Dcg2uHFdDFM+1jPXwt2CWwQ0rTml+b7SjH4rMljclNU="
									"-l dynamic single":                                         "XF4aeVMJ0QIYQbrcNtQesmB/TtN0tq998RGEE65d9VQ="
									"-l dynamic single with function":                           "f9roKtewIG1XvMyGt08j62LwQwgiSARw6KNsPWdkFjo="
									"-l dynamic --with-context":                                 "TkglSnfHCSl47Vk+6aXvVpZ+lAFYpTviDtwOXnm4cK0="
									"multi-doc merge":                                           "mDyXjN5VEYXBmKb0c6diC9MZG+ZZRtXHbsCzfOEGW3k="
									"multi-doc list":                                            "rbqieBC8HEDoy8IhFH24dp4uISyO9GIgODiIHAyJfJw="
								}
								upload: {
									"test cue package inputs prose":              "z22pVxyjAbYVMoF2QTvZQ8bKHn1jTpD/3aj+Vw6H0xk="
									"test multiple cue package inputs prose":     "rPnOIGOy9ATpA0Xj4eBMZcC0tOCScuIGf+5TgZZrDuU="
									"test cue package + other input types prose": "YXnjYsQIpH10LI8+uSvSq0eAQUZVob5tf+WRunFBrCU="
									"stdin data":                                 "bdS//vRep50Ay1K7U2NYIZyATk9aTaTqxXxmiTS4GLw="
								}
								multi_step: {
									hash:       "2UR25ISGJ8BRKA15O1FU6J22A16L1340UM2E8HIOEGU7A59SDH90===="
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
