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
									"cue export # package x1":                                   "CB1Og80rKhOPwJxboh4HpAAO/WHakMGC6O80kxvT6I4="
									"! cue export # package x2":                                 "zHnSMp3WpkXmgdohgIDwaES+P+LBTsFgN+A8NROdI40="
									"cue export . # package x1":                                 "e50RiX6GbZKuUIyyxliiZorbljdLeMf0emxVbOnfis4="
									"cue export .:one":                                          "aQO5t9NU7k/m1zR1TzM9vOVKjK/KM7DL6SdrxnPEUMI="
									"cue export data.yaml":                                      "f3LJbD4dMi4HaHK5QREH3WnCVeMLpwNR7e7VoQI4Zug="
									"cue export yaml: some.yaml.data":                           "d41DkyUbewuctlCWQM49apoaz+G3zVB3MhMBQfsDzTA="
									"cue export .:one .:two .:three":                            "VGgTRl2GqDnSHpsvBTNKGRmKbE4y0OFPqZsjZr7cCQM="
									"cue export package + package file + data + packageless":    "TKeYrhXqFFx7M2NxYjQMPmfYDiqcB190zpyc7cjLoh0="
									"package file + data":                                       "4mE0Sp63+L5x1MHXcZNHoGcyY4AwAwyDtVnkA01Tbio="
									"cue export package + 2x package file + data + packageless": "/5YGLWsC1cFFDoopkGrhyZZF2yhiUkiqo6OgJZ8rM1c="
									"data file inputs":                                          "CkDjUzxMt420LIcobdiB5RUYOngdj5qLPu8g+7QXA9E="
									"data file inputs failure":                                  "2SK7d6yJfuQ615LUdbkcwWYhEY+87Zwi70ad2Fo2vbs="
									"constraint file validating data":                           "1nEnqdal7BnIDcz1I9nalpxC3CPXvlWsIvRifnU7tso="
									"constraint file exported as data":                          "NybmxImzF5NUZ5mCSQcvbbwc0nPz2+wILsp4EeWMu7w="
									"-l static single":                                          "MRZHTv6Fq4Za/EfCfbt5q9Tlzh5F2mGVDRTUkYKmrgU="
									"-l static multiple":                                        "sdaQxp4r9EmbGp210pk28Ly3YnRvCwpJldWDhk274r8="
									"-l static multiple files":                                  "IzWs8B02ri8oQ89Qd0O32l6dgMkwQpD3mERDjIsGVAs="
									"-l dynamic single":                                         "fTdtMl/A7a20IAtZUdZlzEE09dbeQLjJzm94Bmcwkj8="
									"-l dynamic single with function":                           "hvoNPqm0MgRffeR7bzV7VWDX9cdlCBQ0ICeaRpfOes8="
									"-l dynamic --with-context":                                 "ueMcF0mNvkuVVhYhUpL0Z6ZG3Wnb9qYa2HF7CJdZzp4="
									"multi-doc merge":                                           "DQ8junTvDXNzl33Y5tsICTWqHEoWIv681JkM0KY8h60="
									"multi-doc list":                                            "qrBFlFZT8mw35XM1jb7sHvGmgB5QW0sM350LCQ65uMc="
								}
								upload: {
									"test cue package inputs prose":              "bo83K//TfS36sCzeXbisFmRB8r/rNp6qk2DSMGYOj1c="
									"test multiple cue package inputs prose":     "P6AcDu5JWucZ4EPEGBltnH54XJNTZSC43wuHw3FqU/g="
									"test cue package + other input types prose": "dSeqQJJezsTzl0wuXYsPjpg1hD1kFpm/5jrADtqomzU="
									"stdin data":                                 "ZKjFFp6Sl+EgMXI14Mmgc1QMZZ4FedqzMSb/wjXXOr4="
								}
								multi_step: {
									hash:       "MF08P3CQ7V266BB7KOK0E190SEA0G5VD45OP1G5J8MU1F8JU552G===="
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
