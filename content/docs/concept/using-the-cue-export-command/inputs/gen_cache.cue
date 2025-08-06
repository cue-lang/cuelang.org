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
									"cue export # package x1":                                   "oGGdNaZXsM0mBIbwh1ZBBYNW8bPebEV2QXSq//1HOTw="
									"! cue export # package x2":                                 "+9JDJzr9aGVkeOAnrEKiZrqgjXMg7d386cJlpOOrGBQ="
									"cue export . # package x1":                                 "PRrWy6WQGfu9H4rheQX8euPpcC1vyqVpYdQsRyPOVpk="
									"cue export .:one":                                          "P3MapjhYh3SPe4es3Ics+Ja/CwssJ3POAwkzuNEE9YU="
									"cue export data.yaml":                                      "QDkiFNtl4ZxjTqqR8KyqA65gbs2ACsGhTXLBklm2x8I="
									"cue export yaml: some.yaml.data":                           "si/618n65AsSezC0vXo1jOlddqmW5LOkRKKxO3E16FQ="
									"cue export .:one .:two .:three":                            "4OnnKvnh6twa4QwDIOicV/FwQLlgLnO2TyLl76IQpKo="
									"cue export package + package file + data + packageless":    "g3qOwICUcBVqkstU/V+4suCUC0vAvD9jjZ3KWP6W9XQ="
									"package file + data":                                       "n4d61qwOgmT2OP8FQEYdDF3ff2hUdxJPYU6baMquhSY="
									"cue export package + 2x package file + data + packageless": "RkIUCffo8PkIGUgDqMk0ZTL5i08rB4dDyXMJHKQIlf8="
									"data file inputs":                                          "h2fytsWEt5Reh05kipTJWWaCheyKfPo0M8I6LUNfTRw="
									"data file inputs failure":                                  "O65inRLmjqDBwOfCwVzlkdEKajVVn8/RoabHNzTM6dI="
									"constraint file validating data":                           "whhX81cxpgBK4JE0jkWLYqYljJgS13KLfhyC8gMDzz0="
									"constraint file exported as data":                          "01159SK4CaD5c7AshONF99tqT2dmZ8GjdPWIT4eF+XY="
									"-l static single":                                          "66YPKEb7hFbnNHxGnx9Vz4nfZZYkvbitZyhrdDcrTsg="
									"-l static multiple":                                        "zO9XWYPvp0dbEMUY87wRocJVpkM4uPjoxIYUxKauxlI="
									"-l static multiple files":                                  "8bGCr0ZIa/nsXR+tbj+gMpvCWDGTcmUPVeoFpersJLI="
									"-l dynamic single":                                         "59dQNbDDHaAEmFFgAalyCEGIMB1Nha/BQ9LVbf3YTcU="
									"-l dynamic single with function":                           "WbhKdJyk9GZ+rwfZdoXAi5j68/A5pOP7tuK3RET7YsE="
									"-l dynamic --with-context":                                 "N9XYfBmYH1K04ivev1/6SM29mKNZrTHW7NHtTxZKrv4="
									"multi-doc merge":                                           "z9xBAQlKZAzk3am+m4rRg3hzAuLZbURGmrAgduzJFPQ="
									"multi-doc list":                                            "rPBzzm8/VMWAZp7DehJ9FGl1CMu7u06h7+p1j1yK/oA="
								}
								upload: {
									"test cue package inputs prose":              "dPB5RBgBrDWy+N91yimrbDVf9HumYIcPfsCzIAtKBZM="
									"test multiple cue package inputs prose":     "eV92WrRv2NrOSOJx7ZAMQRTIaiJVBFkSeu4qTe/qQDY="
									"test cue package + other input types prose": "GE4UUWdjq/aEudyAAYLeurIXpSQ+WmIh9uQK+zP4USM="
									"stdin data":                                 "CNVxb/OFVJlT39Q9d6+GkTBpz81oYAWc5uLInzldZiI="
								}
								multi_step: {
									hash:       "H97LQ91VVIBIHAFOGQKC0SEIG6JGQKCVN0GLS68SDR55T3KF5MCG===="
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
