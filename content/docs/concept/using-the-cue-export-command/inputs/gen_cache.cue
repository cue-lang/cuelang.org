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
									"cue export # package x1":                                   "QsfmBaosrX+hwXSAQ4Qmze5NoBd5MbFmIXyqM8GwEVo="
									"! cue export # package x2":                                 "YWiw/luZ7bDcANJU10M1TAc+2vUAjhAWDX2q1cOqgx4="
									"cue export . # package x1":                                 "zRVjP2pVJ3UElBep5sDt8UnYAJTGN6pI+6dgbjYpQQw="
									"cue export .:one":                                          "4M7l1CTdOmjplE+GOBRE0uFCHz2TYikdFeb0nPehEEI="
									"cue export data.yaml":                                      "nLzjQW9L2uXRotyk2VJX4Ujq1aTi31OdlTJAIRZGQ1c="
									"cue export yaml: some.yaml.data":                           "+FzKrvhzY3tbLvMojdCoKs9y0YlpCnwZCJvA4gzj+ek="
									"cue export .:one .:two .:three":                            "u6/yvz4sDoIIaUmIfi5PXCa8r0iLfEyPXZYaD45AFfQ="
									"cue export package + package file + data + packageless":    "qtlmw+PJKl+Z2U2XtZtl4AruIzTTe7Gdo2De0OVk4AI="
									"package file + data":                                       "rX/65nJieb01wlmN8+8OxbQ2R1x88c2HnDtqHN8yMCc="
									"cue export package + 2x package file + data + packageless": "X00DcfVoUyvNiOoOPe27jKILQPvmgeTWQdRN67iSGIk="
									"data file inputs":                                          "WWTviwc7Uj+5xXTwDtUuYpZ1PJ3/IXJX5r+M+0bPZ2I="
									"data file inputs failure":                                  "fu3/ahk3wOaZPIPo1uHDb5/BeHV7o31ivQWDJR1GIgQ="
									"constraint file validating data":                           "y0gcIOTKqy4TPUNcASo3+RVx3tEDetRFu1ATHeryZh8="
									"constraint file exported as data":                          "/W+WVaVRVrA9fzmnruE4nZs6VwbH1wHW9Ec9rVcjZL4="
									"-l static single":                                          "gPxeJFUNRidNfdVYqHrRWDJuljXRzdcdrDh9lTRmCvQ="
									"-l static multiple":                                        "p9HjPtp0ikBsCnLN0Ya9jV9CgsRDoeXBc1pL425Y+Zo="
									"-l static multiple files":                                  "7EDUYkYthUDLIn/pKNYC9jBES+p8b6w99oESirtCry8="
									"-l dynamic single":                                         "O+DiIymwv1gnnCBQk0slGXNta1sAWn2iFZnyRbhCLIE="
									"-l dynamic single with function":                           "wtY8/zTHpS7HSuUN0UQ/0BAaX6tf4RaB7Ces1MYRNCw="
									"-l dynamic --with-context":                                 "9y9deXeZnorXS9tqKem1ldC7QlynVv2bT4Q1vQS/Tu8="
									"multi-doc merge":                                           "0U+dSK01U++cfoRYm9UNAs3NRTn/CPVJN2VrwTH89qQ="
									"multi-doc list":                                            "wIMqi7I8ZoVbYiZSSaoGf4fztI2B6mxD2QKUYz0G1RM="
								}
								upload: {
									"test cue package inputs prose":              "zlwP+1hRoqCuLCbwaS1CSAUAB0MJxgXGalESv2lYQHQ="
									"test multiple cue package inputs prose":     "X710xZ1hoH58fPsUh/Od7lrhLb2yQg/0EVbG0QLMSew="
									"test cue package + other input types prose": "T5nPqJ9GvKRin19SqGif0KsRRgX8+jM+TFvnwhR6Do8="
									"stdin data":                                 "kJ0zQJMUMqmiDjgVydemRh14N0DmGaB+FtbcY2V1L0k="
								}
								multi_step: {
									hash:       "LM6BGAOGAGMM5FE1PDUAUI1A9SBM4Q9V0FJSQGQ45KGJ6C4NDEM0===="
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
