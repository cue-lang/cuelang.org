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
									"cue export # package x1":                                   "MyVNijBtqjTum48G+K0GAf09EDksYDw8AsWbVg+K8Lw="
									"! cue export # package x2":                                 "wwSf/LorfpUNHjIaccYNp/p8TFfAAsrbMXPD9wlPnzg="
									"cue export .:one":                                          "OcPcJHDJbEvDsEkjEmi9aqM8swZN71KPRd3h3x/Tx7g="
									"cue export data.yaml":                                      "3EVmeaJ2/3/C4OoiUI6cGGjIt6MdtndtykwoxVK4sTM="
									"cue export yaml: some.yaml.data":                           "g25rh+LHdW2FpQduItkA75KnClnKMjpyLU6i1uN8cnY="
									"cue export .:one .:two .:three":                            "JXsr+0wG+sIbqej6KtkvjbpY7TisHzMkB3q82y3sQB0="
									"cue export package + package file + data + packageless":    "hhkTC9G1A5ZqNz6p803rwevxh06zHwIheIreYteN0DA="
									"package file + data":                                       "YIYfHqB9PrI/wViqOX0h7EqbTIeMPQPOMrtno6ePCbI="
									"cue export package + 2x package file + data + packageless": "UqXy7b/uKbcurdnEBz26xoQi1ghUBsHKg84p5UGC/QQ="
									"data file inputs":                                          "hBu+/Zwmg46dQekuaUrEPZ0axPwbcMKq8iq9FeTpqG0="
									"data file inputs failure":                                  "vrKbYL7nAp/My21MCGeKCe69ItAxIzFbqpIuralUvuk="
									"constraint file validating data":                           "hjhhuldqo4g8HoODbn8zRPk1lMf0h2LeZZg+XOttglE="
									"constraint file exported as data":                          "E6K9xUI5ifRYkkSpjGkDnImow8ZEzieuOllz3FyaAC4="
									"-l static single":                                          "73hgC5AZ0LQJwtrQBYD9Fb2WVLvwvg79i5j7BnZRA6g="
									"-l static multiple":                                        "IJj/Mc7qSGF+uMEKhPVgkA+HYaekf+7n+hwtRiZBC1M="
									"-l static multiple files":                                  "OzKdKoyRNqpTn+4UeUKpJ8q1JwgRHkm7mvqe49uj0Zw="
									"-l dynamic single":                                         "IbBJJThfyKlvsknKcX2DBb4jYUc/vOlUoHs5tP8ffFg="
									"-l dynamic single with function":                           "KQvLLq7Gkv+4quF+JTSHvxYV+ZPLzS3j2HNG6jAmCmg="
									"-l dynamic --with-context":                                 "QoTHm7Z1xJAHPZOcIkQfl1DRwJr6WosX6/82xwujsh8="
									"multi-doc merge":                                           "uHe37Sn84ju0W3/+y3NBMU3EE2g5nKx0k7zQMWNaOD0="
									"multi-doc list":                                            "xqTl2dLseMx2n9FCh7dzmTltoCF/CCNezUpip82dlDs="
								}
								upload: {
									"test cue package inputs prose":              "3+NiY0MlaXW5QX7gJHHiH1v9eYZXomNIK8X54fQCFIA="
									"test multiple cue package inputs prose":     "LUDv/ARMkwzOR0NmcEAH3pymu4DOqrNCS10yStopdXU="
									"test cue package + other input types prose": "jeaSUmeM8Hvgzu9Diz4zeOIgkEWR2OttHHFtYL2QxJU="
									"stdin data":                                 "dmY3gGKmfqKc7ZvoFW+Ehzl1G2ctNuAtDjlTJ5FXB/s="
								}
								multi_step: {
									hash:       "FDQE8P2UVI54OVEFD6UPLU4V8CGF05NO9TORR0KQ2PMG4VE8IGHG===="
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
