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
									"cue export # package x1":                                   "aF47c4wIc1egSbhIUmr21E2a47n7QCBD5Rm6LBxdTQg="
									"! cue export # package x2":                                 "lL4R3/0pW2wYIeqh8nn4jRrZOIeCTUU+naYLd1DY1rE="
									"cue export . # package x1":                                 "qfpgBzs5Xr56xDOAnMZVmiJ6RP7DIAZvVQGudc4dOvM="
									"cue export .:one":                                          "drtJNLVSam9M4arbMC7pCIDAk4IrLn1ndVgXRgenC1c="
									"cue export data.yaml":                                      "g2FUI4cEeltHzrXxLoSMYRm6hQOL1/kMxy5XR8g0BKc="
									"cue export yaml: some.yaml.data":                           "w/ES7aM+0tweEeKofIUejZTuYJG0Lci5VTr2/RN9qv8="
									"cue export .:one .:two .:three":                            "LfEolRgaL/pekq23FErQBAidsMY02os2cAn8wLi2128="
									"cue export package + package file + data + packageless":    "rLNM6gLy5/VqnS6aUIPS+4H1De2+kEYL2RxlpIu/WD4="
									"package file + data":                                       "FAr4T7c7DMwHn/b449ze9CBreP38AcnzA7JLJOEKeBo="
									"cue export package + 2x package file + data + packageless": "PTXOgd+yqACrcQALVRWvQTseqZlA5IWTSz7L9wrT15Q="
									"data file inputs":                                          "Anspe0d3aztV3s7iw4pU0L5KWu6W4213V0wkBdAumak="
									"data file inputs failure":                                  "DnEYO66ClcFS9+lQcFA1qWIsbpNQfuafNmmiFOU1alU="
									"constraint file validating data":                           "3X2WZs7C82xli2sRBYemkvkJCunu6imZuBxwOJlC9p4="
									"constraint file exported as data":                          "hi87RqIVpSyvVhikUck4P300DOtnyW73Zyti0uLAJm4="
									"-l static single":                                          "v+h1Tq0FP1oxuY0KWvVVNx2m6jT7a56Y+L63Js68mH4="
									"-l static multiple":                                        "tbc83aIm9/8GptGdofPe/kMEZGevb6oFdBhsguJVvWE="
									"-l static multiple files":                                  "qISnLfYJz6vm/Bb75J2CGChUEiXNQYvebGRUxkvAeww="
									"-l dynamic single":                                         "tOUQ3fB7namJJQoZmRQPALU9ft/BBPPaoleN5RSRC00="
									"-l dynamic single with function":                           "uPt0876/IjnPTmPLRUILyhoY8KXTEZk/MlJZ5dOrb5Y="
									"-l dynamic --with-context":                                 "UB9Ae4vtmBioS/hupCTGII64p/Zn81YjDstc2xuYCrQ="
									"multi-doc merge":                                           "baxsA/x07emV1iPBy0X3ZugnqiiPF8wt5NIblEiT7kg="
									"multi-doc list":                                            "X5AmY05buZ+Ugxc8x3lDc45p2hRxwmDB27doOdhTJD0="
								}
								upload: {
									"test cue package inputs prose":              "I6UbtjKH/nbvm5Q9nkJko8wmBnqSYNAhcZ4vpEzOK/M="
									"test multiple cue package inputs prose":     "vD2Tt0FsK8vokW8RLv/ObkycmltCCJpapTnP4JSS0Ok="
									"test cue package + other input types prose": "1m5fh7VCsJtbV4sdWMsQ0CRcvrZASfBDZF0dsBt09TA="
									"stdin data":                                 "19gmdzcG5Q7x8ADQ/F8o6F8UzE7lZ6x3akYPwBiFvBY="
								}
								multi_step: {
									hash:       "5VAIK7JP9EA5KI2FV1LBMAU4K2UASSCSFIUAU25K3RJ8IGQQJJEG===="
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
