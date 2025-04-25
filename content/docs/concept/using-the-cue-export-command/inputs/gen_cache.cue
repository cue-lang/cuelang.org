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
									"cue export # package x1":                                   "kxxP7rH8tZTrLdPLh6IW83U11X2lgXKx2pwI5aQXbUc="
									"! cue export # package x2":                                 "jIQp0LduGMmLI4+7CN9yMx9iWny6i3cAHxz99PnHWtY="
									"cue export . # package x1":                                 "dA1vSpkwUunpJgBk3YsFyZXqOw/kTX3HM5g9FCPojY8="
									"cue export .:one":                                          "YhoVPZWLzli/2PVHxVVuKmXqgUV+69EI1ftVerOlNg0="
									"cue export data.yaml":                                      "QjIZZL/YTY7BVmd53DbIpKILal1tLJwl8i5XHqmySYo="
									"cue export yaml: some.yaml.data":                           "UAQOz6wAgRd6R4K2CsXkWNAkgzwbN13qRK3IObvlMy0="
									"cue export .:one .:two .:three":                            "A3aD11OxWntTrWzEIEkWhjPhhbNXVjLE1oveNVD6Wi0="
									"cue export package + package file + data + packageless":    "qp/rLtphRRy9tIZmp3uVvsZ/P7zba065PK2z11OJemY="
									"package file + data":                                       "Zd0lyqEmGcILiGoIoJ5jmeV//j505SP13Tl53ekpO4Q="
									"cue export package + 2x package file + data + packageless": "kv+L+1V1h+658s+YMaEF4FjY7D8M+8MspNkkwuuZVds="
									"data file inputs":                                          "voFD+w6lf53choDVpphMa7HHtegQEAIz7t23sjpYbF8="
									"data file inputs failure":                                  "mRIKOfrmyN8Xptqh2dGJPde6wSxFHBp8O3b++9DsGho="
									"constraint file validating data":                           "oMngmnLQMkZNXpzmfVydAbg1pKZvUyRNP6G1QBmqLfU="
									"constraint file exported as data":                          "Ndp05XoKNvKEh65zxW7+CNwYR9D+MqlozJUHtMkXZTI="
									"-l static single":                                          "bcvgb8fvCNNckOmyIHdOXvevoZBw8cl+rpq4Q2FKSqI="
									"-l static multiple":                                        "hv1Vxcu/KoxgEzcOYdaV3osbInRMO8Syd/gu6g1kNsw="
									"-l static multiple files":                                  "G3t1BD/BooMnvpwcjRLDiFSTjWOA62GY9GMkYJXMSKg="
									"-l dynamic single":                                         "8SKQG07BZbkMgUdJbqpDh9819kJs9WShfWlB4CjgKmw="
									"-l dynamic single with function":                           "Y6Pc1R/HTlHYd/Z32bbhYwTiQFU/cdMgY2fNwAv2tBQ="
									"-l dynamic --with-context":                                 "Tp86C7Oa2ZBR1eRW2cBhgmw2au9PeSw0CXHiprsMItQ="
									"multi-doc merge":                                           "rHg5fYlT3+qUEk/Qryuvo6taPAqjkCwncWK9ac8ACts="
									"multi-doc list":                                            "Cys6OVc8nFurxjULU8NnemXzzawap95OoVkaYUsX1p8="
								}
								upload: {
									"test cue package inputs prose":              "mfPK9V/T8hO+fluw42M97TYS2l2SLbW0WxXwaE1f8UU="
									"test multiple cue package inputs prose":     "ySkbsAQee8zmIP0I6kKaoPQj81g1FLwvYfZh+1Z8l6U="
									"test cue package + other input types prose": "aGDUtOCZB8Y59r/6GxfyJOqpuFP0FNDgzwXU/P+aSGY="
									"stdin data":                                 "dfLF72M2Kc8fytWlIwO0isvXwPuBBp1bCLJdy4RXp7w="
								}
								multi_step: {
									hash:       "TEKDRCIJRDFJ542CSKK1N33FCIOFOHO555BK7V67VO0PDI8D38G0===="
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
