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
									"cue export # package x1":                                   "U1Q+/vVWLykWvuWpJXs2lC+oRs4j6nKMcmpN6QLifIQ="
									"! cue export # package x2":                                 "T8wIxYrVwfDzu9hE678fiX6JHCv5twfhXCeMlixGtCU="
									"cue export . # package x1":                                 "0eHYoDhWhfE3REoO7Xm7AO1Umu1yIvB494Ol2qPL7mw="
									"cue export .:one":                                          "Ws4hUElRGvMK7sMwAAPAuNbT9+pGGAQ38yId3dn6ZzA="
									"cue export data.yaml":                                      "QFHP+NFQPsc2tEgV8EPF5xO3r+xKfASnKZIT8WlzZ0s="
									"cue export yaml: some.yaml.data":                           "DF1nibu3JfFVxmouguf4o8F1sM9nOuhn0CVv6YG5+MM="
									"cue export .:one .:two .:three":                            "r/5fa/3DEWvgQJEl97SbwcbfUuuqLlPNelkFK/BKSbU="
									"cue export package + package file + data + packageless":    "GNsRx0cQ/sWhpw0BlymbNmStCODz6GkWYRN6247TVoc="
									"package file + data":                                       "QuXiqP3oCokn1FGkcQ0Hzi6jhR9c31LZS4a2yZl2UW8="
									"cue export package + 2x package file + data + packageless": "6FrPpw3fQ69KCzyY2FmCeuzoHX0hj7QWUti46ZJh3qc="
									"data file inputs":                                          "jgORwlUSY2OqDf2be+q18TfRzvucQwgXHU/ccY3wt7o="
									"data file inputs failure":                                  "JHKMbg8bXRojna6ZEQO0xMEdYMYblN7g6K5lamsix/w="
									"constraint file validating data":                           "9MduES5b548Hria8xPUrJ0DU4b4FwzRmHpP5dgsUkKw="
									"constraint file exported as data":                          "FwiazlCpyQd3vO8TH1UXdYmUn7Z7hrzgglThRTASQ3c="
									"-l static single":                                          "e3Qta2rovYHal01PQrzP2N553+x277iCGsGacJ1/7Wo="
									"-l static multiple":                                        "KY+FZ9QDyDJlEJelwIfCJjX7rCVNedmtGZbgvvSiXK8="
									"-l static multiple files":                                  "sOrFIj52mqLexD7yK0Y4JJPe5/hSQudLbnlOzoXANCk="
									"-l dynamic single":                                         "DKCl5PeCsBX4P3chBx2vxmx10jyCtt+WFEyt9IqjdGA="
									"-l dynamic single with function":                           "8k4DKx39YNyqQd5aYIECyP4hJdCxO4Uw+LSOtrbghyc="
									"-l dynamic --with-context":                                 "8eAwwvaR8Bnb7Q5tDcwkT+Of1UzWv3Vh9+cYHTh/8dk="
									"multi-doc merge":                                           "lEizFHmey4o+QmV5aLg4YBiPjo95eAbaOxxeixLivH8="
									"multi-doc list":                                            "66Ml6n6/WikXqQcRlR29CxZSUGgN+hNPX7BjZhpiBts="
								}
								upload: {
									"test cue package inputs prose":              "nb/blFKlA8t46avCiKqNP6np4qKhwyaBfTKsu68w+is="
									"test multiple cue package inputs prose":     "0/tDQkoQszr2e+b9CEN9UnAUiShb4G17GW6JKV7yk8Q="
									"test cue package + other input types prose": "yidNTfPcQTk4pYIDmsJTH2RFPkmGsAPnz2KHGkbMdro="
									"stdin data":                                 "aqYxLd7+CDkIQYlotsTwhtx3vsM6GNJWOvIScJrJrkM="
								}
								multi_step: {
									hash:       "ENP6OTHCKDOQJAV4JD97GD9M0RIG155SVCQDSR7ICOGPFRVJC7H0===="
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
