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
									"cue export # package x1":                                   "kv1vvjkkRW/LAhzZUFvRDPMSALG9ECIxXB2GMMq83Ao="
									"! cue export # package x2":                                 "q3M3FU7E8LNskoTxwK6xvyfmaHSGW165oHuCtk94ir4="
									"cue export . # package x1":                                 "dMZXqTEIJjNB6j2dyhmnieAzAUPbKJBWOZeCnwGr9uU="
									"cue export .:one":                                          "+5xSjWM9BKkNZw2ah9SFqo7Rrv70DyeGE8/n5liOOWQ="
									"cue export data.yaml":                                      "E4KbAQ8757AE4nUDCKCYe5UQensc3A7UmNRGOeI+ZhE="
									"cue export yaml: some.yaml.data":                           "Teuxe9vE3pkYJEc0/EIGEKUb7kp+tTSntXhRUfOiYvw="
									"cue export .:one .:two .:three":                            "nMhVWXJpfizEeyD/MqidnygUlDSBZFSKmVqgOqtjKJE="
									"cue export package + package file + data + packageless":    "D231jAh8kh9Dwq8uEY5cGFnPlVTQ4TtusM+FisbzG8I="
									"package file + data":                                       "27m8oZENZntL3LqbZiCnsIuMuonf1M2hxIHF8CXPkI0="
									"cue export package + 2x package file + data + packageless": "BFEdTyaF5w6a9rY3EIgFTi1xh5zUbNlOLGuzbyH8Ecg="
									"data file inputs":                                          "jdElvFH8kneCyaMx10tj/dVV476G4xk4hqCuHuNym4Q="
									"data file inputs failure":                                  "hfbbUHULzQTc6d0GX6dnLeSHj5EfS7ZrEeCBwVnh6O0="
									"constraint file validating data":                           "N4EjJCLiGMq38UYVqh+ChsZfPVIRBqbfY5y7q1nbwCI="
									"constraint file exported as data":                          "TpCYWK6WoCFGpaIbFTkUR80cgfJ48P0fwTWrGGYkf/s="
									"-l static single":                                          "qCJdAkzZnlu3WLcnuFgJniMomdnXZx+eLg0PB+0kFQE="
									"-l static multiple":                                        "YUnewYUZe5UmV7rXlqX2oeGX4PJ/E7a+rbwZKXnL/jw="
									"-l static multiple files":                                  "/o8Ik5a9QVWFnAIj6vAfZhwiLTIYG8WbZZGE7ylph88="
									"-l dynamic single":                                         "ID1oq0hmZUDyTvTMdQh0VJFnl19pjSu23dxinsfIezU="
									"-l dynamic single with function":                           "EyF+kO2fXv6ZGIgT9bK9YFdVtI6fcyc2uVnjeXdm/Ao="
									"-l dynamic --with-context":                                 "os7Vqw8qeFAPQSVoGpy6H7VNjcsUtHT27NQR48ZJjE0="
									"multi-doc merge":                                           "EZN2SO3EqwofJWaPDH8l/QyLARz5BAngBjY+Nau6Fhk="
									"multi-doc list":                                            "yXEMG0noguG4zF4EGQSfr49u5bLRE7XRPgDvaWcUw6g="
								}
								upload: {
									"test cue package inputs prose":              "oLF5MRRDKNwJmHPPIvUbcZcomZn0xne3lFrJzPJpr/8="
									"test multiple cue package inputs prose":     "55SQXdY1WmH94E7ut1gL1Aq6SI1vRU9PW0BxXsN3zB4="
									"test cue package + other input types prose": "NI6b5mmXQ1lnslIv0/Yo0skgqf0WWe/WeZM1hqKWrjc="
									"stdin data":                                 "VSfA7bK7xy/X+RNaTCvTdj+Fs+ObT1gD6+/uYyXzCl4="
								}
								multi_step: {
									hash:       "KE2OF1Q845TLMIKJV24UD4931ETN0CCFBC33KIP3Q8J2LH32HVJ0===="
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
