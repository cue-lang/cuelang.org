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
									"cue export # package x1":                                   "7cSmwgCXuNibYkiIfd+lIPbCfguRweqDdiHFzN480c0="
									"! cue export # package x2":                                 "/4OvfUMa+bJIjfy96kKm2UUr4QYeJIO4PsLSgR2LnVo="
									"cue export . # package x1":                                 "3PBicqs6hZmuuSIjDLXykr4H2NVg1+5QpqtLA1NzTjE="
									"cue export .:one":                                          "7H0cZRYa63xrn2gu6oEbFUYeSHMQ4t7Aqk7wAjaXq7Q="
									"cue export data.yaml":                                      "ASA3ygWtkDIy0se8KVxKfsC52zyh6UW8EDTA/FINp7k="
									"cue export yaml: some.yaml.data":                           "kGx/WCZtxbCPlcHwRXYoBCtZW8vKrKgNWN9jjESilGQ="
									"cue export .:one .:two .:three":                            "7vrVAnIlSPXz0H55RYvz9Wm/5/DB80f3gZ3/vFML9Ho="
									"cue export package + package file + data + packageless":    "vg8QqTHFDBTS4B5UO7zggr2mq1YgNXVVe+3GDJ7hHQg="
									"package file + data":                                       "7vaFqiJLiX1SL+9+o+wmdAhIxedLUAlzkuTB4V6Tndo="
									"cue export package + 2x package file + data + packageless": "HCsBnyx0ntyZg603/Mtp6iTUn4DD9Gn+mBrpMAQQvtI="
									"data file inputs":                                          "yKwFUADkve76cPC8zHNjlDJfd+5/2k7wXTTpCb7grZ8="
									"data file inputs failure":                                  "xmx2C6lhM8itFqd22p8DO9EQNayqKa1eMRCyhE/uHyc="
									"constraint file validating data":                           "tH9WbeNJCMTm/ZUVgOvxV2gBv/ZHZ5pgHA2nOPCx5nw="
									"constraint file exported as data":                          "DH97q5KKtvkl8hWqMtt+NT5gvPCVwrukPqhx9Qbve+8="
									"-l static single":                                          "9Jp02Q2Ca4G3TBvGomYM8rmNQbTzGv14WHcnPuW7UX0="
									"-l static multiple":                                        "shgQSVFhJ5p19ye5ZUP0HSn9UK6fXukwdHP/OfmXBEg="
									"-l static multiple files":                                  "b94+RXY4HCXTx+LPvesJJLv7hhCdUPo6QogCKzvdBoM="
									"-l dynamic single":                                         "4+Wf4RGHzwAveaVH/UBxVWS+YhKCK8E1frLPoHQMqZk="
									"-l dynamic single with function":                           "/CJ5n/11/uZX8ayN7xedMFR8+sOCJCLMf3rIHHG0KzU="
									"-l dynamic --with-context":                                 "ER2c9moy6Vii+ltWWzOEpGzXlWx1YdtLxuQd6qOkJcg="
									"multi-doc merge":                                           "6N8sogcjBi8JxZZz0yCK/huaueV5KtleAsM/NikOtZI="
									"multi-doc list":                                            "q34Dw7+0v5MfOTkX3UKDhm85V3wJ8GMpozfOr8iz2U4="
								}
								upload: {
									"test cue package inputs prose":              "SMwPXJKImo2lradMWgtj2RWPB9rkAl7LgiLLIyBcfyY="
									"test multiple cue package inputs prose":     "8ky55IRBBHkzGaMSVW8Hui/SChVeCZD3gMGXj4EpLkg="
									"test cue package + other input types prose": "5liCO2o5ilxfihhije1++vJt1K1KmzQQdMDs8Z5r/LI="
									"stdin data":                                 "0cDEDSIuISnk82rCRF77LFCpm2dajT+5OYHoTKA+rLw="
								}
								multi_step: {
									hash:       "BN48Q8K809R9R93CRK8KFF7QGUVFMLV1DFUAPLL6CF3CA0LSJ5A0===="
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
