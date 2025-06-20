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
									"cue export # package x1":                                   "jQBqh2FCOzPudSyhEam6h7uj/SBFLHy0Ne+sETqsQSQ="
									"! cue export # package x2":                                 "1rygjotIIhCKiAwH+aUj6ZzZghPuUkC/FJj6V3QpulA="
									"cue export . # package x1":                                 "YZB8kfP1VLlya58BvxRA5EqCMy6JfcS8eLC6T2H6afw="
									"cue export .:one":                                          "izeKdD5kdnEseJsXYwaAaFYC6KyQkRGFwcoIaLt76TY="
									"cue export data.yaml":                                      "rB2lCz5Ev6X6PWynjgEfNouu7USO0nUEFVMG9pwDYQE="
									"cue export yaml: some.yaml.data":                           "/C6nxscdHRV8GsYjL4jBm6oK+t5mH9J1VOWiAs9ODv8="
									"cue export .:one .:two .:three":                            "fGSh6+Q0pBQbhEKIDC3uLHLiqXhfTiZ6bc5h1KPIOz4="
									"cue export package + package file + data + packageless":    "8SSNm+OBxDgKZDcXel76jiRmB6z/pnawIW/RzzbdJaU="
									"package file + data":                                       "hu4eOVUZmWCC2+r/JPIHYM4CSYf8mLBZ4f1bUTOIcfM="
									"cue export package + 2x package file + data + packageless": "VE5HSkekYg5gaErJfq17/E65HZhhEHtvOer4XpGzsj0="
									"data file inputs":                                          "fiWIIjOfsf3uE3LFOGgsRpS4Aq1Pxkp8sO0RLGWymmI="
									"data file inputs failure":                                  "WABfgJJvoNYv+VV8jySchFFeJjVRVcZhmjMb6fuadPc="
									"constraint file validating data":                           "nk59DIFvkWaZZ8qyT3L9Ha3ebYPMFFBtPTbWNnRihXo="
									"constraint file exported as data":                          "YBI5cgrDw5J5u35sIThWMvY1vhgK4qP06q9w7TtfXCk="
									"-l static single":                                          "LbqdMVHUiSoJX/n6ojavZCzCOvoz0UlxEEd6eULv2Lw="
									"-l static multiple":                                        "I74kb86aam12Ha+skL+aLV0elBwBt0/2R5bSXtkw37k="
									"-l static multiple files":                                  "cbgBokpqoK3hpkoyBjft7Hq9Ho7wP1+1D2VDVXYHb4s="
									"-l dynamic single":                                         "jZXcRPyCmknUUpe1U433ylbz7LAJZu8fRqNnFU3cVOA="
									"-l dynamic single with function":                           "Rwox4hLdHVAyMQyUtz+UffOZMPAePTG7K9le2dcODg4="
									"-l dynamic --with-context":                                 "emG4QpACeyp5ezQJHRJyIa2J8naQHQo9VEismpvt9OY="
									"multi-doc merge":                                           "EyUsLHp5ugai0M9Bk1M88tcHiGSCQjJ7EctJK3tS6LU="
									"multi-doc list":                                            "sQSUIHFAbVwypzenmI1j3eQgNSAxU74ybcN3t2zOqqY="
								}
								upload: {
									"test cue package inputs prose":              "de6m4ldVwcwMV7vi4zDSaTpOcv2e6Q9htNNqIh5OHBg="
									"test multiple cue package inputs prose":     "TFliv8XyKiX4oPBkFF1seIS+Wi4UlXJkbgxxNoHW8Vc="
									"test cue package + other input types prose": "TsgQtCMsiqCJXQJDBl7787LrtfF3eg++KE0/ADjhPZQ="
									"stdin data":                                 "gDO8TasJpEYA/BIOtnQ0pj6v8/cp7mh6glXz8/lqrOk="
								}
								multi_step: {
									hash:       "CN2IH3UME48N886RM5U87JBLRP4HG2VLAH70QO6SU5SMF8Q7VKGG===="
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
