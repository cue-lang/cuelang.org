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
									"cue export # package x1":                                   "L24RkSTvOPNTR2d5B5JgxeiKF4Ax3+zBL7TmRnRXoRc="
									"! cue export # package x2":                                 "5NVO5mO2dzC50pTC+RS6tbz/eAPbIQGZacVdxFvw4MY="
									"cue export . # package x1":                                 "jzNc50S8r3iGH/GW+SurckfmdedYwCslUKtk2PoIRFk="
									"cue export .:one":                                          "4DYljhG55/8VlainAGRV5HqfXFzA4Wbsgy98D7kWcBU="
									"cue export data.yaml":                                      "EKFbLiQ7ZR9S+XffD6QAKjgmFxZMk1cLAvfm1Gj2eyw="
									"cue export yaml: some.yaml.data":                           "1MZyIYLcyMk02kNUCaeC5WMAsJtQqAJcmH5ltP4NtNM="
									"cue export .:one .:two .:three":                            "HGV3nuFkCSo7awb6LdgOSeUojivRwrsukGY5AUem2D8="
									"cue export package + package file + data + packageless":    "LrnkSYsqRMtBGjy3SAAgUDbLTQOyAV0BHhOcC6teuG8="
									"package file + data":                                       "bTi2FBEYDf0HC9vznJrJ1hbFV5laKVlLt9nQMIhaOBM="
									"cue export package + 2x package file + data + packageless": "NsPouI7vAphcpqUDjOAGQ14TGJCbRHlBYnaCPU9O810="
									"data file inputs":                                          "YpPZBLt1zp2Zd/9IYTfggZTKYUBcBnlxf59wxPU4s5g="
									"data file inputs failure":                                  "7Qrfmkr1xScoN1WPnxKwIV1LZFs32My2TVIKjM+iOkc="
									"constraint file validating data":                           "mnwqlZ6CDFLi1TeG9RCGLQKWZvQagh0dZz6wroQcpQ8="
									"constraint file exported as data":                          "wY0j5lBzu4X7q6vCMNtFyBlf53smbGh98i4Hi67V5T0="
									"-l static single":                                          "DkAceDE5dKlbQXBIyoZmVNUC4CnOJmWRcAxquUHsTq8="
									"-l static multiple":                                        "bi1Am7mhj7lY2f4/pnUPOjNaEgTmkSoD7m6fwOUzw1I="
									"-l static multiple files":                                  "7Uqrg/mLX/ulXk7czf0s4AntlXK5ThoClev9hkW12e4="
									"-l dynamic single":                                         "ryLE38G+8knh1RulKp4H0GZrbu9ri1/XM5f7BJVsUFU="
									"-l dynamic single with function":                           "P2uKGG+5sfxBBTQnmAEnAZKzgMMNtYlOzGGuTCQ+J4g="
									"-l dynamic --with-context":                                 "cJDfzNt1HntwAhf+o1ubFEpPTEBhLbzpRg558QtXEOw="
									"multi-doc merge":                                           "ug0E4JxJredcp9jaGoFkvcWmnFGb109UqdCumxgDAA8="
									"multi-doc list":                                            "CBKIabEjyWUMMHEPD2aIkjsJ+nugg79Alg66t7N9Imc="
								}
								upload: {
									"test cue package inputs prose":              "P5zdc3WYzIRjDYFW0oSZXYDv6I3QdrtMyrqEDoqo8nM="
									"test multiple cue package inputs prose":     "LEnydRKMiCiANew/V6ruh+0v/1Q3RIDXKcF8xRCLbnc="
									"test cue package + other input types prose": "NKTeUNpb9CO5eSRUuT7har+Diqrte5QsXcHNTfpmY2w="
									"stdin data":                                 "J5XEHAExRu6+p2S5w0hUIXT+mFoR7CINN2n+w+3+Oe0="
								}
								multi_step: {
									hash:       "0QPIJPIKIPTFBQ99OLCHKHQCLT54LMUSLGMINUBR1299VGG2KTRG===="
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
