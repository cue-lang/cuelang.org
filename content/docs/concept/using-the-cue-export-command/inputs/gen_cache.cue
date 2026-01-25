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
									"cue export # package x1":                                   "o/WWUMSgQvk1+G76Hi4vkB/gp3QurNbiU2icjm+mBF0="
									"! cue export # package x2":                                 "uO7tNZoMN5Rn2RhDlalkFESNeLBiRhH2AyxfLbvETQw="
									"cue export . # package x1":                                 "Uxa9Np9vWinCEXR0ZKcmngxAD+Fj48KRCpWbjNwIX7M="
									"cue export .:one":                                          "NPZ8uUlUtIx/jzwIvIJLkNjueJ6DOxSKbQg8a/MU1CA="
									"cue export data.yaml":                                      "sO54EumHv6A5uPJbuky2iJcyRBnMGRGoCO0sJ3REIQo="
									"cue export yaml: some.yaml.data":                           "9dq6DCy0v1dIIvNpg8vhRFTKSanPCK87A2CqesGRu6s="
									"cue export .:one .:two .:three":                            "F6i8IOh5g97HS09YeAaVF1chtMipUlLsZ1+giOzF2Wo="
									"cue export package + package file + data + packageless":    "nr2GHYTI8SjU5tCyLT3MXiuNp4vq/P+OBc37ILvp0P8="
									"package file + data":                                       "qAl2nRE1dqGlm80cS9ASnB2+l5MfNBTiys3AgUiZyo0="
									"cue export package + 2x package file + data + packageless": "hOuNgdgrmuVCpZ8uFGN7Gu0tiKsabSgQnYkx/JCEugo="
									"data file inputs":                                          "WlXaAOPZ+NjABxUH9gfYhZA5bpN1zWfHRxWwlBBemTA="
									"data file inputs failure":                                  "rcvLf/hQhdGpvD3Ml5L8mE1Fe/qxDmj/SYQqlzEDJOU="
									"constraint file validating data":                           "jRmDJNnIfZuIBBSgD1jJf94HHFkAdQ8IJYT0tmkDrWU="
									"constraint file exported as data":                          "jlRv7JWpl4dfs5hCViC0OfMmZbIm6A2bH/R9MvYvY+o="
									"-l static single":                                          "zhV+WZWlGwGLzoLDWyc+vf/wbXJZTjm4Zu3Dx25JJEg="
									"-l static multiple":                                        "AfSA5THBq2qx0ZX8ZDtaQ7ES/EEsl7s51VU5yEThhVw="
									"-l static multiple files":                                  "l+5I5XGhKFqP2SPQoQmNcGvoRrIOymlQ2Fd2PrPBlhc="
									"-l dynamic single":                                         "XvyOQSlqASH7+r23SvWVH7Me5j4SRfDjKwJYzmOomMs="
									"-l dynamic single with function":                           "bQ4x8ZIBnfK+L9XVApO5cxkdVELqJI3FWX4C9/ibYAE="
									"-l dynamic --with-context":                                 "AepUuY5wdR5M33H3cCQLjvp1hZaTv1o2ebD4QnIldrc="
									"multi-doc merge":                                           "VQ5cilcrDodIE88RgRxPhyO6oEFVeusx2HPmQKn6U8Y="
									"multi-doc list":                                            "SDQzFtTg5h5lIMJV9zUWXTdjrcREWePiLhQPA0aMZWg="
								}
								upload: {
									"test cue package inputs prose":              "f7Ib+jltMkQP7ZhSBTtovbs/7AIKW5u2/+TPnZE5bx8="
									"test multiple cue package inputs prose":     "/PZqxz1FGKvMu7JdEPYkQM+AH4RHnlHrGo6fOAMqfX4="
									"test cue package + other input types prose": "VQknoq2Io9q3X4TM3kR2lC3ZiIyXP2mvcp7QzHu2hi4="
									"stdin data":                                 "peNvYvvOvPOoXPSfISNIfwg6JmtyGO+WWXr+M/3pNFw="
								}
								multi_step: {
									hash:       "UTF4GTKDFEG4KIJ7SCA01ILVUGH40PF54MDIKOMMERCVF73JCTT0===="
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
