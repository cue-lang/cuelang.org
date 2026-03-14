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
									"cue export # package x1":                                   "qfsp+stcGSNKo/5irjHlkDEn5SGkZRRu+Aw3dDmGJM0="
									"! cue export # package x2":                                 "ElekoJZImAYJgx9sKlpPZ6LnEXy38n+jBSUbjDJ0zRo="
									"cue export . # package x1":                                 "Ph+Viafd6ZWNC0Adncp0dCyz67ZBBCA72ibHFkyrisg="
									"cue export .:one":                                          "avIkbptjGKIfgLZmjp6JLqFI/zm5+NYRIbjHjU+auCc="
									"cue export data.yaml":                                      "3xwnVnZ080ubMmTRlmd6wJI37ZydYzqhKTHc5XeC4D0="
									"cue export yaml: some.yaml.data":                           "1pEPTE4XmAyT4EJ9yeWAJwKSUoDKyqebOK+BLEuwm9k="
									"cue export .:one .:two .:three":                            "Md2lU/7htDiMMidefuq5Oq7krlrslUtRIuLOEbV3E8I="
									"cue export package + package file + data + packageless":    "qFJXr8gH0XtVfvla3KEHHQIkBmv5RpmuzriX1F58paM="
									"package file + data":                                       "LM+BFx7GWth/ijAn+x8dWrh3szjoDNzGeO5Bxpb1GCk="
									"cue export package + 2x package file + data + packageless": "0OlFPV4bDx0S1P5oxskqZMdcRXwz1tZGNT7wHefCRb8="
									"data file inputs":                                          "CtGf6PYY7iy3DSC9arVTdozYYrlc4L6+5lG8p5/OJ5o="
									"data file inputs failure":                                  "I2QsqeGVaJfc3LvYrcDz/FueYhy9vlBHTixS8/jlqeo="
									"constraint file validating data":                           "5MTIuW5g0TrYqJwwn5y1ihuHRcTqHS0qHusreQISEms="
									"constraint file exported as data":                          "qgGOSKsOZ7Q7gpVXiVj8W6v3NP/+fXCkkcKPP104D8w="
									"-l static single":                                          "ZNdKR/RKtOwCPFf+v4RMlXgI4Pvjlu3kkV9gJJxfNSc="
									"-l static multiple":                                        "FNIlh0KCIr5T+bi7OSaKt2rgn7WDFv0wdUYcTlfF8Qk="
									"-l static multiple files":                                  "swMDJZ9RQ8kU7inrevxLfUdLf67tFjbP6xuRAdnFmGs="
									"-l dynamic single":                                         "IU9SuGsecd519pXrwBx23xMGqNOoqCH8/T/fKAyKaog="
									"-l dynamic single with function":                           "NX9VRehzcGxXm5SiDO/xG4fcsG+C/trmuzdm1k7PFtc="
									"-l dynamic --with-context":                                 "++oywfKXt7JZH9s/XuiMCPnLuKMcXU3Sltp6+85L8xs="
									"multi-doc merge":                                           "xq8cOLpFQUND4oPvk4x1M10YKzuWx62rCLnfqGrJ19E="
									"multi-doc list":                                            "iTy+9iR+gmV9QQxiwDXdd+G2jLmWAKeF1X3Y67W01DA="
								}
								upload: {
									"test cue package inputs prose":              "AQktzSblMSmdKC3u8zqK1XcTUU/cCkiOtZybKHe/AZE="
									"test multiple cue package inputs prose":     "5AQPlgzQSzIMfe3IL5Lxlzl02iaumhGIS0xiNhi1CO8="
									"test cue package + other input types prose": "iFAwcamj56ipNuE3RKpQYFSfaVbNIaO9FkYOd0WIlVk="
									"stdin data":                                 "KM42X1o+KtKR44Gj2K5vnEKbaFB0mSFd5P2M5O1LrHc="
								}
								multi_step: {
									hash:       "M366B56PJL7FQPN0SK3E7NMA142SCED06GUUAC9CEF1F54RA8450===="
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
												cannot combine scope with file

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
												cannot combine scope with file

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
												cannot combine scope with file

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
