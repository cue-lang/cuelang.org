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
									"cue export # package x1":                                   "2hipQ+kH0/YRxJ8w3gpsqX297xlpEwsB7EBkiBC9lt8="
									"! cue export # package x2":                                 "S6dmeDoxVW1IYdSUZ6j/rh1EmLvDCsleXy4orBtjeg8="
									"cue export . # package x1":                                 "vSSy4NzXsG581dXvCQUB2yyrOL+atNq+EvDBFVzCDSU="
									"cue export .:one":                                          "MWT4qwR1aCRO+TygJo8BPU+xe8W0G/tEq2GWWwPwvck="
									"cue export data.yaml":                                      "iCzngHMWDk0pGzAl65Z9aeT1r+AV86oQ9TJoEeaE1ts="
									"cue export yaml: some.yaml.data":                           "xrEcZqPWd+Lmvi74Pl2fbMdLwwkSGhDQwZb3d++hBKQ="
									"cue export .:one .:two .:three":                            "mfbPXnEBwzh3gfgton/tDXQYWg2QNdbuDDzFSVJFfyY="
									"cue export package + package file + data + packageless":    "D9cldOQZgph/3eCqDqS/cW6TLnmwsgVK29Iig5vmYgg="
									"package file + data":                                       "7xcbMPTv1JG5Iv4mguDGAaYF26VqH/bzaKpVHbe3R/c="
									"cue export package + 2x package file + data + packageless": "HPEsmSiz/0XOWZRzCOn2iYl/YhKWLY89Ti4hmirXHA0="
									"data file inputs":                                          "TO/ENUEU56pEGrqEFaf9Vfel4mo+TK28FSKleVfehf4="
									"data file inputs failure":                                  "fsz8d+OC4ajB73q8yyz7FUH1alsqrzpnDK34Bg1CRbo="
									"constraint file validating data":                           "9iWlok9XkbZYm4nP7AXLlikJOg3oYPU/epoUKiA/X60="
									"constraint file exported as data":                          "HNqsHD+cPbF15Rt4CB/C6qe9e2WK+P/DQGuV02PM5+k="
									"-l static single":                                          "ZZ8yQTV6GfpA+IW/N+M0qYdz0ysFDj6Ykn3Sqznyk3I="
									"-l static multiple":                                        "/awvimNmHS7w9G57p4BFmhUO8OLlUj1x18paY7vggyY="
									"-l static multiple files":                                  "Bju3JAQQPne1Md/lWO+zdHFJeBeFoNUh/p+zJld9YP4="
									"-l dynamic single":                                         "pUlTNsxfUBcZA7gBB9O/KBm2QMeC8x7db4zpspG9tPg="
									"-l dynamic single with function":                           "zj6MHlb7YMF4aCv9sbLAsCFdKtojNeHZHe6Mbu9miK0="
									"-l dynamic --with-context":                                 "0kS4tK/IDc3M5t5DToU4rw9UR6mD2L2qpYa9IPiqZUc="
									"multi-doc merge":                                           "vtRmLBxRtYIsZT1TqKfft5O5cv0gt06WZFhemv2Warw="
									"multi-doc list":                                            "zODtcef18XkzUSuWtqD9Qo9mz1rLfH6v38YsgjvjcMs="
								}
								upload: {
									"test cue package inputs prose":              "kCSHe45meL6Xp6t5S4ycJ78ugmX7zhsi0rw1XZ9BWwg="
									"test multiple cue package inputs prose":     "fu2GDAY/p3/vqCXDr45sx+Cc62PP91zVfTKQ8aJwluo="
									"test cue package + other input types prose": "kOUfMhoyTu+MLY8yxuj1KXFFg/omVTxG9NQJPUaLRyE="
									"stdin data":                                 "CMpUkNkXRk5X3g9gVE+H0f4IcuvrLqqV8hn1LeKYCu8="
								}
								multi_step: {
									hash:       "N5DB2T7E383PCU5U00206245S86I344BAQPOFIM4POJT4UULF8IG===="
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
