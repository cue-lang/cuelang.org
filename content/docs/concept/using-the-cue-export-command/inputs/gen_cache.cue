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
									"cue export # package x1":                                   "QrYz4NfaURQNzoLmZ68r5bOHjN0ts1+tIzAb8WI1HV0="
									"! cue export # package x2":                                 "hO8EQZ+yEC+/M5OBZXs1iShpkKJHcBfONg5dEhYVkpQ="
									"cue export . # package x1":                                 "Ud2+5YqJqzEKJDm6e+mT0unKd/o4Z2xl2BR+uoNQ/U0="
									"cue export .:one":                                          "+nNZxncRZpugs/9puLoOWe//+sEGXyqvZCpbt4LVE4A="
									"cue export data.yaml":                                      "E+AzLLdmc7U6xF8WkjtrHBqdTb+ODm4hxG5onTG++o4="
									"cue export yaml: some.yaml.data":                           "91MBYcZjN2Ag/RvfqmjCH61LoiZECouC4e1iUYlKAsU="
									"cue export .:one .:two .:three":                            "HDDsEdwYCdrSZOJ1blSGVQlT/vf5gD5BgMWNVjd+n7w="
									"cue export package + package file + data + packageless":    "LjvwXl16amQht64CvRT1ZkNiwEaxWkF0YGUp4tOVv4A="
									"package file + data":                                       "jv/ovEeWpX+G5CZjo4JL6YIohWxlHBOpKP9l6No3j2E="
									"cue export package + 2x package file + data + packageless": "qsvGcgg+n/qAl9vGBJQSoDsgRm193xlY9S0tAoLRXpw="
									"data file inputs":                                          "GRZTgU02yzOOkDpTQV9A74gdxAx+W8NgOeFgsSejYJo="
									"data file inputs failure":                                  "CKIG6a8YmQLqvNPlULEfEvbqYhGowRqj3a51gcLBgpA="
									"constraint file validating data":                           "Qa8FSyfCvM+r9RdgLoiwjPsm3yhroyey5UZOpP3xIWo="
									"constraint file exported as data":                          "wCmYPw6+RSgeMX9U710daSz5NpoBlhymzeicEbROoQc="
									"-l static single":                                          "Tw1BbFyqa6PxJ/W1zsWbblw9YzAIqX+jzeiCgrzZwIQ="
									"-l static multiple":                                        "xEZsrKNN5lPbFFOjYvJ97MgAXI/BI8T0v/+vVcvQHp4="
									"-l static multiple files":                                  "gYi4u6fldKvdiajOY/gfEyWOzSpnhSTK3jBbMvjQnyo="
									"-l dynamic single":                                         "d2mX4pmiFCLy++a3ZEh2dnnEY75E0JkdgJLiDAG88H8="
									"-l dynamic single with function":                           "+4786EF0I2RoUUgLbQ/3yuYeTFuzMcXQOFMimQbRyic="
									"-l dynamic --with-context":                                 "qRNkTElG600XH7e59N8ZWYYbAn1PChzsQGp0Q/HvEGI="
									"multi-doc merge":                                           "Uxydy1HWahECiBe9dan4Ue9jaexh6Nn5GsYsK3LH5tQ="
									"multi-doc list":                                            "NlIFRPnmEH6GVvd+RjeLRafXWRLUMlfkNLSck9Mn8os="
								}
								upload: {
									"test cue package inputs prose":              "z37JN/SyXO/bnmPMbCmNAHxkMb1eJ6RPn/VCXvZbngY="
									"test multiple cue package inputs prose":     "FJxUs8i7qJ4jNRxmUok37wj4gFZhJE3vAXTwg1KKsc4="
									"test cue package + other input types prose": "RANr8QGNbZcGycSwjb1wcRaEuKe/vHCgNhXXPBTydD0="
									"stdin data":                                 "/LYi4GM6ZbBe00EIzqOOc7/ar0UX1hyQoVfmLDpfnxk="
								}
								multi_step: {
									hash:       "VE6H1MUT6I10R6HNEQ91BL2VMKTLE7V8274U1DKVU2K1L09SR500===="
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
