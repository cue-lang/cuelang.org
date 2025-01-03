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
									"cue export # package x1":                                   "Pq7fj/NxB3DGDegzKuH0DIbgtkQWOg0bWPpDvZXk3/M="
									"! cue export # package x2":                                 "NJjpAxTDE34iHF22iQIXo4/wSO0qubgQNkP66mWR+fg="
									"cue export . # package x1":                                 "CBzbIfMfc4JRXx0slQ2TtcawiRktNK6SMWj9iguirfo="
									"cue export .:one":                                          "JXDyfAdPHcNOdKPOhSfh0ZCibSiNCcjB7V7hHThSZ5Y="
									"cue export data.yaml":                                      "G+ihXbN+CGGLoJ3zAywsQ9gssp4gv9y2EJ4F76paMKE="
									"cue export yaml: some.yaml.data":                           "fMcyaWiKWX16iZnLHiVl0BXur4eI3ld3qUAVHGtTZkA="
									"cue export .:one .:two .:three":                            "qOPVeqUiV178/qOYjsh3rAvMVc/iibx2gs9T7h+3K1o="
									"cue export package + package file + data + packageless":    "io/yKPbrvqwdSRolhrfFWJ0PxpLfK87g904+ulqQSyI="
									"package file + data":                                       "mrbxXc6zzOm7dem0vrMdffHYfXmSk1wpVXjYd6KTj4Q="
									"cue export package + 2x package file + data + packageless": "LnHKpGAKqL5eIExpdd/cm6nzhSfuJCryVAkgu0SufBk="
									"data file inputs":                                          "9lBdmPTK0xadwuUbGaSqq3Qe/lBRO3fEw4OhUZBvXCE="
									"data file inputs failure":                                  "i+SxoIR3FQEk0MKTA1OTpJWlkuvMGFjFI1Em1glq7Jo="
									"constraint file validating data":                           "X74MeG0QOnxwqrMTFnIaelzzdXjkapBmM8ledaSq/FQ="
									"constraint file exported as data":                          "W4qdh6/SsdJnaY4YVl4qXw6aLjgA0R6OTVFhJILM9Jg="
									"-l static single":                                          "bTF5b2InqnjaWQkGhMzh5uO6HYrqHhll/ISGzda86RM="
									"-l static multiple":                                        "OLwRG7X4UR7XRD0rso3/FFALUX2Cuz9iclcWf6xqLYc="
									"-l static multiple files":                                  "VsqUE/wbuC24l+KdJxuZ02fYgu7GDKTkCDvdF2ZMNK0="
									"-l dynamic single":                                         "SNfWzXjZp/aA7bf+i57/mt721G14JFzhIXo+4ocHuqI="
									"-l dynamic single with function":                           "hEiZIpY3pKDxQW721KHlXNnnzfrqSxjYLQGX3Q4Y3/o="
									"-l dynamic --with-context":                                 "fcuPYTEzdksokuJC9E4YGJ0AIMSPV8t65aLwE2V54Ls="
									"multi-doc merge":                                           "hh8+qQzSbIafUx0lgAXAIVMhnyMsYQm1T2VK0uKAaUY="
									"multi-doc list":                                            "Drx5yNR1mc7Yn2KGaLHYOr/FpghKVr6W6RwPSY4cpmw="
								}
								upload: {
									"test cue package inputs prose":              "SXjSi3i6zVIOhRpF7HoyhCG7KbS4LLHtqBOMAmC7ZhI="
									"test multiple cue package inputs prose":     "ZdcgxPgmd0brfd4+MqlMQ0RoXAuKVVQKzOAjZu3EO/c="
									"test cue package + other input types prose": "E0wB9HgtPVRZC9PFSrTSfTC2RJtpwQStdVi9s126ytM="
									"stdin data":                                 "mzAg8N5pOabEeuU9MH/lwLVQtVTfF1o9HB5AlAUi4cs="
								}
								multi_step: {
									hash:       "CBSER69P2LMAAN5VPRA1970M998KA87GHJVGQPMN1Q82ROJ3F6F0===="
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
