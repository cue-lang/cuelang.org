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
									"cue export # package x1":                                   "kQP+WQY9045FdKkoZW/HyH00fHmw+pnjLQ3vi4POIUY="
									"! cue export # package x2":                                 "kClLP4ymhspDuKz03sFFXLVrLPH+KlslxXXg/Ld62rY="
									"cue export . # package x1":                                 "hMl2ZjkDEwwafMEdxo308SYYE5SZ5Czv/tOINBWlwzI="
									"cue export .:one":                                          "yS0wrKAD3cV7ZqU4uRCqzoCt+97jGOEiCvEZhD5Jfzc="
									"cue export data.yaml":                                      "CVJpEot8cns74MBybXuzgxfP9YYn2eeuF257Q7uEUDk="
									"cue export yaml: some.yaml.data":                           "y1JECjl6gbQuPElh3BWI8OH8/klv1TuEMk/nCRkvI5w="
									"cue export .:one .:two .:three":                            "Aph6btbYi+kMYQyj4fFbseFa+h+iP8jGSYTNi2OMptQ="
									"cue export package + package file + data + packageless":    "Cg8NudH+dpylPFptub3jKsaqFlwl9hHj1nQDfNJPMDU="
									"package file + data":                                       "ICs5TLB8lFipxt4/qmlSXt/1x8S5kbcPWo5pH7wV/jE="
									"cue export package + 2x package file + data + packageless": "R9fUjBEQ3BJx8/URQlp52t3cdvSwndULHKma3ZNSWjs="
									"data file inputs":                                          "LcGPt7Md16mk9AviCycy0AFpPxmmbmiHFfbXqXxgHNs="
									"data file inputs failure":                                  "m1zAZC5o6NucpoktshhYWAzdlXKYL/pue+5jRsR9Fxk="
									"constraint file validating data":                           "Y/Y+HKIayJDtRXvDD9fhZX3l7GfFJDlB6vh3Kop8/4E="
									"constraint file exported as data":                          "5bpLNEjVHje7CKgQTwmXJdsAqSKJnmcw3FupjQZRZks="
									"-l static single":                                          "/2Y8MmybMfxMaaTmCaw93WZQVE56fDaWS6HKsRwIklQ="
									"-l static multiple":                                        "F8z/xsI2cy3D5XEy6i43PpP2Nj4q3lf70b8hBFF6Syw="
									"-l static multiple files":                                  "tr22MXQDnOxzSt3+vyVkjuFOLxON124eR7gZDRg1GWk="
									"-l dynamic single":                                         "GTo5Yi6rSbSipMU5/vwhx+w5XRHSAeM41rY8WjPjm04="
									"-l dynamic single with function":                           "vWNxG8BtuXh0WnqFc/f46bFQAqn39t2i71sCySwuJT8="
									"-l dynamic --with-context":                                 "IPRl7H60sOllrtQo1Ylnk3cVJUP2BlkI4uJKdX21zog="
									"multi-doc merge":                                           "SKI80x/v8dfGbCYcMK/7vdE6Uf1OdNW2Maals/adUU0="
									"multi-doc list":                                            "VSrpZTsFOyOnLK5z1Mg1owxedT0ysvcsQjZ9A8wqIn8="
								}
								upload: {
									"test cue package inputs prose":              "IGgtbYnhaWVN6IGl4Iod5U3Ki8ydLdgweipbit9p0oA="
									"test multiple cue package inputs prose":     "IVxIHcm0E4LKiwb5KgcjCnnpmhnqeWyh9IRl/Cjjcvg="
									"test cue package + other input types prose": "vMrB/6HdFNw4klWH/fYEFbvepNn+GroazHtoE7yaPfk="
									"stdin data":                                 "m9jQ2Lfgss8HEEM4mVH2VaUg3A3QGv+MXmrldrfWkp0="
								}
								multi_step: {
									hash:       "MA4O5KQ8F3B2VMOCCQREFPJ7KVDBHUT7P9AMBED76V9NHBAHCUTG===="
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
