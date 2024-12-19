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
									"cue export # package x1":                                   "0NOFlE+OmVk+4vZ03HbRC/KwilxiDa1x05tfz0mcja8="
									"! cue export # package x2":                                 "oXIBD3vAuu4pq15TtQmw8jhiZFfVOwDldVoe6/0jRxc="
									"cue export . # package x1":                                 "nCKo7aJ4iHt6u8YVPK8tnr6MnIhOXI8wCjsyqSsF8bk="
									"cue export .:one":                                          "A8/aLDtAU6LHd8VNwN+xM2HjxbF86Ji/nrufdRtAY5k="
									"cue export data.yaml":                                      "VfQzUie7QNGTYdS6tHcXzsx5hklm4yb7I/8b2VCgPWc="
									"cue export yaml: some.yaml.data":                           "Ac0Yr4nvmg9lY9Io4SClmkiwkrb/x8EOZUNPVSOAciM="
									"cue export .:one .:two .:three":                            "HJbv8umpHHAwq/TA80z0uSP1PdJnXO49svjq3N46da8="
									"cue export package + package file + data + packageless":    "rBBVmNEni0OsQWVMu12688wP8QZWoLE6TD6NXIbkHo0="
									"package file + data":                                       "ENV1OZYI1bNKSMyec9FEe7TqrWLmqf9de6U9b46UNHM="
									"cue export package + 2x package file + data + packageless": "HFbPPAJrINh1+L9PmG+QB2z6OUHc25/HPyPTghgvZe4="
									"data file inputs":                                          "wm1QFsl8YhveTluElKxPKfJvpRD6GxkHM2oCKr9UgLs="
									"data file inputs failure":                                  "UQc8bmLWwf7t33ZiAXTUJHPDxagobgpE+LfejD9kiHg="
									"constraint file validating data":                           "BWOJroBWtIKxCSBXgFBrQIDfHBlWglErCF/26F4/9w8="
									"constraint file exported as data":                          "FShLtNsUeCIOydJiTlUgwj4lfokImRh3D23vdT5FO9Y="
									"-l static single":                                          "XCrq2UoL80d+Vg1q69tvA/H5p/R7ZAoK/4hgogTeO0A="
									"-l static multiple":                                        "7m68Syv3gLb4N8juRUutre8SkLSlxcobXf7pfFTUWQY="
									"-l static multiple files":                                  "jVIyfgRE0oR6JJt1j4t6AZZTBWLzxfsTUHYrEPHv35k="
									"-l dynamic single":                                         "2J8kb50OAi2WAPFAeh/1praGjPmirdnCpf/jo2o9gsA="
									"-l dynamic single with function":                           "dPbC9fq71FOacLGy+PAqWl3arl/qIA7f9cNLjUNeZRc="
									"-l dynamic --with-context":                                 "37PJ79LWuojdxRCcVwDiL2eqxYcKAFrS/sIISvmKl8E="
									"multi-doc merge":                                           "9gkE5NqzhRn7sXbX+VMFOXEVDU4evhvI5a3fxuXTgMY="
									"multi-doc list":                                            "duBiuArimy0BHfkxWP3TSHdh4B32s2ILAruzfsQln8U="
								}
								upload: {
									"test cue package inputs prose":              "XJF8kTYGM1Tmtn4cNZtmEKGI3iJOS/vNec+TqR+IiWA="
									"test multiple cue package inputs prose":     "DKwfIaNMb7Y/C81nbb4BBQuYN+oagr7UmLzF5NOVBvw="
									"test cue package + other input types prose": "YQwHa/ih+k78iOsX73fC8xqLzK4OQvl7Blxl7DkBT94="
									"stdin data":                                 "LBd8eX1ySC+I2Xd39CaI/o7S8kCLz82lszbYc0mV6Lg="
								}
								multi_step: {
									hash:       "QCJP0L3PLKF4SGKP5E2U1V9H1QD29S8M5B4UU33BVJDFQRSV7C60===="
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
