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
									"cue export # package x1":                                   "f8X4v+5r/2D6hr4djDsPQD2QepL1J2FuSgY+xSFkJzs="
									"! cue export # package x2":                                 "Ez/ZZHSjCSpTcMqp2+thTol/E1NObIl2nPC5rOj2lrk="
									"cue export . # package x1":                                 "46EkBVHpZixCnaCGLDLBBxTsiWTRaYrCv+MY+ITmkiE="
									"cue export .:one":                                          "ngNZO8u/YBuzZFJH/N593r+MdVdvWWnOz57Tj8/Stkw="
									"cue export data.yaml":                                      "3/aeblviV/j6lxdLmqvRMuQCXfHTpNcdYLvBscoRaNM="
									"cue export yaml: some.yaml.data":                           "UfCGA9RVap9CBhHaxRnT2SkLe3Z80l+uqEN4hAIq6+0="
									"cue export .:one .:two .:three":                            "kpwH3vSXvMTz9eY7zm3DjlNLpO7/GF7aGqAUTKq9Xes="
									"cue export package + package file + data + packageless":    "rnby2BgItFC5oJnZbi4arS25iJkUgkeRdf/D+EFl3lY="
									"package file + data":                                       "gDBx2QJDN/ZjAIUIJSda3kTLAhvZC6OspMQenMV5DWY="
									"cue export package + 2x package file + data + packageless": "nYOp2cR0yWDY00zxKl+/31ePwyh3whrrBRll/USkrYE="
									"data file inputs":                                          "2LoJVUXucyT+xhr7VqVB9Jpz9VcFFzeTG/t8R0NjM/Y="
									"data file inputs failure":                                  "ZZeApeUUWAfSo3grXYO/MZ1J6uuEg2TxjaMh0MaQgcU="
									"constraint file validating data":                           "Q0aAzBBBmSrPH0wR5wX5+Xzf+4EWofentJrFndnBPoc="
									"constraint file exported as data":                          "Dx430nr4m2vNtkoJrFPB/l1WA4uv/yDR1zlrvqZZyP8="
									"-l static single":                                          "WR3aD87GWjfe2rrpM4ZDZIJl+USfmc9re5l+2FSmHEc="
									"-l static multiple":                                        "0FPf10PaH7jz/dHrtNdotqr9GP6Hms4WP4GmcuZ1q3E="
									"-l static multiple files":                                  "6KmEUZIj54MbHjH9wbZr0DorKFUQASc9vaR/FTSE8/w="
									"-l dynamic single":                                         "qCqjcu/s062aQdPIwJua1N2uleGwl8EwkhdFh+C4cqA="
									"-l dynamic single with function":                           "pbqwZxPbuZSKrEkqqxNEG+BBvEjkpDz/uTOgeYqj/DA="
									"-l dynamic --with-context":                                 "PoadrIzKHUWZwEgDRaU8DSCw4S/pwLNNbFEMedKdSfY="
									"multi-doc merge":                                           "pwbeOQJAl+ar17TG01ynK/oS5xzeGer9UkIPzcrFd2o="
									"multi-doc list":                                            "UloqbfM7qsZybMVTBOZvJ24DPJRwv3C9YQXUwDl9g/A="
								}
								upload: {
									"test cue package inputs prose":              "ABnM+Fvfq5kz59W9cYod3ztsuDWL0kEEf0UY7bxI/KM="
									"test multiple cue package inputs prose":     "F5UD/nWkJRIvmMkglkY4VZ/xIDvgV+I382L0L6cok+0="
									"test cue package + other input types prose": "gTIkHokfDiP1+yVfXrfxqt0MwkX3pNR9SVJiYKRTz4I="
									"stdin data":                                 "DOdXkv/PHTX/JXqv87XQIj66sXsiu9ZnpirbHAvXUtM="
								}
								multi_step: {
									hash:       "RA7FMQV2BRINJG7F8732R4P920TEKOUU2S9NS23IRT42CH7O2630===="
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
