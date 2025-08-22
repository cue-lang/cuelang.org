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
									"cue export # package x1":                                   "GuHcTXpTMCcCNjxE1g1/xuWpRSF9f3Rkt9ORRTaKFvE="
									"! cue export # package x2":                                 "Rre6zm9XhPVuqGS5Qq7Xm2bvc13UIQs5jcCrspSR4kc="
									"cue export . # package x1":                                 "HWlT5TRvkUSfR86KJdz/kn/3+6GVJYMcXgwCP65B2i4="
									"cue export .:one":                                          "RNQgwy1VWpMFu9n29dWyeLiO4z+M+BX7wY2enmc1Aos="
									"cue export data.yaml":                                      "FKrtHPw89uGWh9EkD7NcdxH0qzpANLw0MPufjJ8mVLI="
									"cue export yaml: some.yaml.data":                           "/XOBlq6D4i1DkFbVSH6ciNy0B/W4/h+aBzHaEHSPY/Q="
									"cue export .:one .:two .:three":                            "nqGTnFSMaVIfgdY3y/qEp4z8w240XOtJVtd7vq03000="
									"cue export package + package file + data + packageless":    "5s4ibxueoUMEn8ZGGrwEflGkfq6vHMjItruv4lue6nc="
									"package file + data":                                       "2uiG3jGK+BR+wqJJty+Zttnv0atGx4ricfHquZWi6vI="
									"cue export package + 2x package file + data + packageless": "dKiTWDS9UeiT2wEG+2ewr3IjcoviOOiS9eI3gljN3DY="
									"data file inputs":                                          "OSptArYhiJ22l/5eogx1X+d4p9vhoo5TNo1NM0BK1EE="
									"data file inputs failure":                                  "N8rFBbIFqoOBLrIVdk7x4liX15ZScyXSK4XgCru5RAU="
									"constraint file validating data":                           "LHC7TjsEKNClnGKhmdr3wdVgXEKsewYiJzTxsGEzymg="
									"constraint file exported as data":                          "R6SJ4m595rX2Rnw47GecG0INSme3OZG3bjUJYD1vDYM="
									"-l static single":                                          "0chNfdVG6yKHyiILD9YaaTrbY1kcOk9vtfttD+AdW9A="
									"-l static multiple":                                        "al/50xv4UoyZdNSrh6xxnumXNDjfnXBrOqJhExvNbX4="
									"-l static multiple files":                                  "d6hye9GhGk27C4ezmwhuFydPjVXhNzIVCQIQtLMblZo="
									"-l dynamic single":                                         "gHB7GAG8h3MnNIru4duiRuQrUEKTTzpHj0LD3oupqdk="
									"-l dynamic single with function":                           "/2iDS8Rrp/7IPpoT9QRjvpZHvBF2knoUamILWwLF6bs="
									"-l dynamic --with-context":                                 "uPjFMNXmGPBhcgSYW2E6t9A1V6IiorEJ40nu0vyfMDs="
									"multi-doc merge":                                           "GGVn+0qBmf95V2w19H3zqJkD3BPkC7kFIrSARfkluao="
									"multi-doc list":                                            "3igGYKRzT8aGwJHoaVxKRp510qYJsoMQ2+7GuWcW6kg="
								}
								upload: {
									"test cue package inputs prose":              "+mzCM6Fqxek4/RVOg4sl0e4r3dw/tBeydbtH71zV5Z4="
									"test multiple cue package inputs prose":     "mzKwFh8CJGu5iFgaPfk0u64PWpLXvt+KEcd4otUQI3c="
									"test cue package + other input types prose": "HdzJycgYaxLOv4ySNEkzTzaeTAKiGPIHDrn9/oiTW5M="
									"stdin data":                                 "zC5O0H8psMZlExIk8Yg81dL9HWpBSeWjJ+M/9qJ2p4s="
								}
								multi_step: {
									hash:       "NMBVO3APHBHFHLA4AR37ACK2I7526JC14VEFM8SDMFE4BU1DEU40===="
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
