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
									"cue export # package x1":                                   "DGgwzQRKPnwwurw8tOKCRKRCjlSWkH+vESR7SOgz4Zc="
									"! cue export # package x2":                                 "3QG1Jeopf8l8hIBG89rOCT3i6mzcu5DPJw3AJFU1FaM="
									"cue export . # package x1":                                 "mZi7WDmik1Pn9C3D2g8xpzViVN4ruObZchESASjOIec="
									"cue export .:one":                                          "NADBDW76XBnRkxZY1oIEfSejFEwT3x0QEAWDl7XkT2M="
									"cue export data.yaml":                                      "1DkP3oGdE2z4eAxSljfmE3D6z3unTDfOePK35798fZA="
									"cue export yaml: some.yaml.data":                           "lk3rPrue+AEX+Q+hEtpJQGnjTB2o3w6ec6iSHTQ1cMw="
									"cue export .:one .:two .:three":                            "wV4k1gQjc77qrf3ddTJzPMfEDACMONKqy0nC7Q6G3cE="
									"cue export package + package file + data + packageless":    "LHPV5J7cSj2z22oLn1zzZwNwU6NYCjtMJFwAqVFF9X0="
									"package file + data":                                       "FVaX7MaxiCrG004NMZZJKqilqIzgsZ31rjhvW6b3AJY="
									"cue export package + 2x package file + data + packageless": "owGPbVXA6mgU3K2fQkmA7aJQBOow2VvTkjJcjuNz4gA="
									"data file inputs":                                          "2t5t9Rue8wW4i8xQB5qlsVqg6RBV86O8r1BWma/W/cU="
									"data file inputs failure":                                  "tMEThCi/vk1kFUzDfrW4/K8P6FWTthSxycoViWNUlbU="
									"constraint file validating data":                           "e9sKbS4dri8G4isPaeeoIFj4Iuv+Xwde1qFXCEIJkkc="
									"constraint file exported as data":                          "VhXvT51bXPsoOOt3BP1H1+H7g7c/X6QO4HVlMBQwkKM="
									"-l static single":                                          "Z6SJ73a2QePMylWog/Qntp0RTzCDK/prFveFl6Ed298="
									"-l static multiple":                                        "0nvYpsIhdTmuSIlOPvvg+/CAx0HSFSzeG2xWKqbuSSM="
									"-l static multiple files":                                  "T8kiF0qTsfhQA08zIOOt7mGQS7FcfptOWfF84LXqUUU="
									"-l dynamic single":                                         "OpCDzGQ/Q4cjkB0/e/DTrCyntPdZe9TNvquVr24yR/k="
									"-l dynamic single with function":                           "gWFraPqC0qYEEamq9SpxjQbuBtJWMVB5i1EpzLPQoNk="
									"-l dynamic --with-context":                                 "gs6VwVnbiKaZYL5n2WeoMAPoMLtNYKKpglCjjTeHOuE="
									"multi-doc merge":                                           "gs58EI0v1vOs5hW+Ib+b6W45q1QGgl/BQjZnvpRvjQI="
									"multi-doc list":                                            "9EuAFWho/v6ODpRfCbUPOYLTGZAcSJmFLdKfhcTbX4k="
								}
								upload: {
									"test cue package inputs prose":              "eNzNhjI03qkkAdUH8JIuX7FPrQc4bEOjqn5Y2kr/MuU="
									"test multiple cue package inputs prose":     "X4SVub4MTdGmteX8c/XYjT+0euQ7w0B5ScP7rsdawz0="
									"test cue package + other input types prose": "LXWqMqtPChfhmegE8C+5D7FAb03Lg5AG1G9trKKTY2I="
									"stdin data":                                 "/o8x8SDlYluo6QJTW6eZ+sw9LrWFLznZCqCLTbd0gl4="
								}
								multi_step: {
									hash:       "TJLM4T66MM9LK3M8RIJ8345B5MFU02JJVBDGJNCFA3UCGA74QMFG===="
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
