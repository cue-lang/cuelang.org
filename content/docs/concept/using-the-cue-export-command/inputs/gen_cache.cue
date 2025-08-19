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
									"cue export # package x1":                                   "rkz/QTDGVOnEipzE+6l2OKoeNuXhSSN7PlGWpaqXbKY="
									"! cue export # package x2":                                 "V6Jp/2Pzp/9e3DLhu3V5KRcA2vFm87fRfJ+Rhy4IyJI="
									"cue export . # package x1":                                 "5TuUCanzOXjUmR6wEupKGIpmDZ/LdCdiMm5M8UQs4u4="
									"cue export .:one":                                          "guKmrqheAbF+wuuBkwOn906ntxuuFde5oeqEnPMtLTE="
									"cue export data.yaml":                                      "sGBhefnkCMXE3i+KDhRFkMAHKDXn8LSNQwnuh3x47Lk="
									"cue export yaml: some.yaml.data":                           "9QAlqjd4rd16moqty7KfbxsIyQsXN6LhDcu2oRu/jFc="
									"cue export .:one .:two .:three":                            "xI9DSjxV+I8LlSpbfMNQTwd1q+CHLa62rrDh/krg9bU="
									"cue export package + package file + data + packageless":    "DZDXErXS72Q6Ai9C4ydbx1QklROgt/ixtJChs7kP0PY="
									"package file + data":                                       "oIM9VN0s2lvRDNaOK/QHtSv/7Ldldm8mAlfzfSCtL1E="
									"cue export package + 2x package file + data + packageless": "Hwpfyt6XAbJ/ctUicyhk+sc0mwR5FlO/UgSO+U0x+ak="
									"data file inputs":                                          "n5/D760p6oga8+GLmQMMojtdVrg9q+TLf/4HA7nwT+o="
									"data file inputs failure":                                  "tXDcyYytRZU2kf6BYaocPZo2ufzbzX/lR2Xpxfi0WhA="
									"constraint file validating data":                           "KXaMSEJhpeQY4D/xSqD4uAZOhEGtkCkyospUw9OO7TM="
									"constraint file exported as data":                          "W9mYNTZHb8+JG9eGfkXEeuYHnCr46eOOm3wqy5ZAS9E="
									"-l static single":                                          "Zz+v1omG6z21qZ3heY2g8bNQrdKSTMl0z4rkBFYAztQ="
									"-l static multiple":                                        "DKTj1GfP5Q3sKDtq3n28m5aoxTgWIuILkAl3jr/KtlQ="
									"-l static multiple files":                                  "ObTFPHFYKrlwwiz3v2iDh03RSolBRMAtmi2bvHtEA+E="
									"-l dynamic single":                                         "z7RYB9i0IL9hPDhdEV3A/Lp0fBFVmA5b4D1IXDZKiXg="
									"-l dynamic single with function":                           "57niqLNXLDJC/4PrLYdOMv6HgScy5w9app1Dshjdzjw="
									"-l dynamic --with-context":                                 "mF3VfBqvUjj1XIqVK2T2Ih8xCc6j2a2gdUdzZV0PXKw="
									"multi-doc merge":                                           "ZGWErBBPCxdiwb0M7n8SNGE6Ie+XfFPubz7fcfk9QqQ="
									"multi-doc list":                                            "Hh4/hqL3E3SXTzmLPWvGJcOKcB0WxTs4pxhJDq2VEP0="
								}
								upload: {
									"test cue package inputs prose":              "S9OQO/BGIqgq+rJ7toKVl+cznXECmaKk9dGP37GMVww="
									"test multiple cue package inputs prose":     "LFie8iVGTn0fmndDz+r8HBUUnT7G1RTGRom+ov3XVJo="
									"test cue package + other input types prose": "GNm3ke7n4n3zUHy80oDkTbxZpZncxF7f43kQ/PpwdZs="
									"stdin data":                                 "nAtvQU4c7MUBZZfe4UyiodV+/23fu5fq2aoMRiOec8o="
								}
								multi_step: {
									hash:       "4BDBK6QM191GMB2PC90TEL8LBK5531JHNHILS7L9RIN95LLLRPPG===="
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
