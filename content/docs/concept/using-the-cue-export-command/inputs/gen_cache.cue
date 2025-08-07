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
									"cue export # package x1":                                   "FP7yCyHJn0Yc2a8ZrNRFrOHYd4mTY/+8zpHixzw0k/g="
									"! cue export # package x2":                                 "Ll8Ki0o7KjGYe5b7OtBq8XqekvlXzkjd6nq50e367WM="
									"cue export . # package x1":                                 "yXZjNDa0vJlRPP+Gb3Rn/OjCbmj2/q7YIPVm34gIIAQ="
									"cue export .:one":                                          "BBzknGWXT/cJuLVRXjMgUgFb5HXAzFuNXXRx7X1fEjU="
									"cue export data.yaml":                                      "m3pYp44jU3pfkN3mGai91jVBKyhNHbekueTH4ZNfTkw="
									"cue export yaml: some.yaml.data":                           "lCX+aPiLwHGvUNuzd8rsZf6qp9x4RNhkKzSj87tNiJ4="
									"cue export .:one .:two .:three":                            "b/Mef+wbMZodNS7/Nyt3VBx62zpavhtqoJ5hFgvOmL0="
									"cue export package + package file + data + packageless":    "jgOujYy9UETWhEuz/DynnfXNx3QjAzTAaqZD+YBX9mk="
									"package file + data":                                       "TFthHQHURb2sUcneAs/qqmLECUBqD1qmtrF58yS0Gfg="
									"cue export package + 2x package file + data + packageless": "JrL+ZZeQ94JyyVxl3KO8u8dgYS2abm7FeolNbyk63Ns="
									"data file inputs":                                          "yzzKP3BHEWv41KeMq5dVoYDp9Dv5pTfOUzMcKywl+9A="
									"data file inputs failure":                                  "Z3FxOfRe+JOrOmDG+5Rei4bcLW6ULSZCZ6voBtxgZ6c="
									"constraint file validating data":                           "d2oLLvj5J+bjsyNFPihuPGH5k7zdJ15d1Axr4zbUHwE="
									"constraint file exported as data":                          "uWKwQjUSk5qFCiw4J3KY0wuF57HVFMJGcPqmf5qTW4Q="
									"-l static single":                                          "FvtbeDYbtiiiTFPp0Opc1GlyQc1qnmv/QrlglFtqekc="
									"-l static multiple":                                        "FgqC6VUA/nYtrrW8AtyqUWfjj70SuYhe9x/SCOfYv5w="
									"-l static multiple files":                                  "7MydhLNP6EreXI98vfHyNJcGOGcP3Iur+iXG7UCmJkY="
									"-l dynamic single":                                         "O+NNZfp+EybPz4YJekFDZ7lXb4cTOgHOmKRqhOmVmcU="
									"-l dynamic single with function":                           "rt3PLv+R/PEgHD92Wme2reQbfVVLhd6K2ua+NH+SqTc="
									"-l dynamic --with-context":                                 "QZpzKFI4/A3jxihqBT1qFPkzkstwAEK3GDPm6fUhcIg="
									"multi-doc merge":                                           "Xkkls+EncCEiJ55W1TYTCcat3iwkutBgKKzYiIxSYTY="
									"multi-doc list":                                            "mVWx6113tKKkHVmDEce7cDdjvpD764LxLC6gnpZoG6w="
								}
								upload: {
									"test cue package inputs prose":              "zFOIJ5sB1KcK1q19KUXlHz4MugFnDCixFyEjTbh5f+s="
									"test multiple cue package inputs prose":     "MBtCH+yWKN1B12kp2kr/mDdLzLAY+SMqr8feeLAyvkw="
									"test cue package + other input types prose": "XurwBCo+wMyNpva1ogTZ2SIWPdbV6mQvOhGMxvEeRzw="
									"stdin data":                                 "ve8egcJp9UwYtNhcS1A0gm2BAnAE4vnrFPsXhh2DxuQ="
								}
								multi_step: {
									hash:       "QK1A6ENQCDFPO9KJ0J5JUOGGHUU25R9P6C0G62GFPN31TE5BVFR0===="
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
