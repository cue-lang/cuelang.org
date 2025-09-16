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
									"cue export # package x1":                                   "4kTWKuk0s/fT02IpOlu6ja8t7WjdnKx1VrEKmSrBSiU="
									"! cue export # package x2":                                 "5ZhKui6NRfCndIwajd+Y62937jXAeGej5XE3G6VcmvQ="
									"cue export . # package x1":                                 "TdZsN5Kr0b8RdDRrG9KnlHM3OkzMtSx97ajsAT7U1Ew="
									"cue export .:one":                                          "zW2JT0RxO+ISHArzilbnQXCujFW7UFzEvp0b2babBF0="
									"cue export data.yaml":                                      "xb1h8VUFXCTfKF0SmmMA/4+rPSy6Is/2uYjyd1udB4A="
									"cue export yaml: some.yaml.data":                           "8VtKVLlrvJLdqmSLCwR7uatzCL/TovGezzobcUSxeEg="
									"cue export .:one .:two .:three":                            "/bE3FcMj4y0/PDvTJpYDHlj+5VvzkvEOzyhpgqMwU1k="
									"cue export package + package file + data + packageless":    "B8IOZzlwk2djyNbrNa46h1DKxjXZfKbop/qzD4wuXl0="
									"package file + data":                                       "4NEvWlc3QtHHqEav5eiBiRqMkuDc7DqwWkDwf6rryKw="
									"cue export package + 2x package file + data + packageless": "BltpJm0krrD/vSKsYlxyCQW1W4zy+1AJy4mkelEb1MY="
									"data file inputs":                                          "E76ksltH05uce2zy+7am7sqTFwsncxiYFIG2buS822s="
									"data file inputs failure":                                  "Wic9lJhbovXOmIu4Eh9AHlidGNg7zZzHjzQNXr2MTC4="
									"constraint file validating data":                           "iTHs1vF6W6GOMyvp1dUlrfuIExQhrQyBUH/JiMivTD0="
									"constraint file exported as data":                          "NQy1zmzix3irbdWY15vxVDm+zpNmSfCXxOXF3IGWPdI="
									"-l static single":                                          "V+BghqCvcioDuULale93N+hJQuvVwrp0egm1uTfdSDY="
									"-l static multiple":                                        "4gdf/97/YIk7+LCRj8sZiry9P7cFPlsFl6lPF9mgsy8="
									"-l static multiple files":                                  "H6yhAwD7n/hOrcpkIjphy3cB3jNtdw/jvTOCCgOgGx8="
									"-l dynamic single":                                         "b4T0zloKGAxvQR9ZR1r59RB1CBYLWLTV0hNuVaYoKY8="
									"-l dynamic single with function":                           "BadTMEFz45M1rxcVk+63nDscVICtA6ypEZPGx+Mb2OQ="
									"-l dynamic --with-context":                                 "ayukhRTdjr8pG8UnZc3FqsLSSu09rduMB0mgUd+0fUQ="
									"multi-doc merge":                                           "CAMA/5gdtSOQ1tj8jjVpEjKL5FcAMolnIqrv7p583U4="
									"multi-doc list":                                            "nOdfpPWtY1DpLS3dVJLeZtdQf0+UxtWRFu4oDUTlbwg="
								}
								upload: {
									"test cue package inputs prose":              "vlx4MeUfzuFu97mYxDdP76LRsjuiZ38Els5iMh1GRsc="
									"test multiple cue package inputs prose":     "h7INpupQsTUR6B+Fo/9uXgaMWTEgUNPsM5QerhPkrZ8="
									"test cue package + other input types prose": "02iygHoRcDgdyHqiC5atMC2i4cNbwmJnuCGbxwKGvoY="
									"stdin data":                                 "3BYu+UPMIDEadhktnk1YeCb3TUWzKiziIuNO/tXu1pk="
								}
								multi_step: {
									hash:       "M9S4AOR8ID95TK4FU0OVMEN78QIHM1INOHVR08FTOSFNU0FCTGI0===="
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
