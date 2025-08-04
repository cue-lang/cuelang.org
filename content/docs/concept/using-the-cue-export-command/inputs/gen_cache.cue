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
									"cue export # package x1":                                   "5pNLwJ1Qo/JDTIBSuWKI4CjH28/GnmXG5DvDty26iT8="
									"! cue export # package x2":                                 "yK7TqzPey8zMzC79Vzey6h6NYYcWZ1zJRpIn58jzNgQ="
									"cue export . # package x1":                                 "ziTeaOEFad1RKYRhvx7cWsrxHWaQgzHjAggzn6ubR/E="
									"cue export .:one":                                          "n1yhBrgU8WyYXuukplBB+nuJJmagrksGIQBg9l7x6H8="
									"cue export data.yaml":                                      "f4oOx5xEVwkj2jSJO7EWAtxiBHQpxrlsPGrzH+uJN1Y="
									"cue export yaml: some.yaml.data":                           "2ajdRpCPY5HtUrQ/ZkESFnQuTKaYoXzrtIu4F9WJciY="
									"cue export .:one .:two .:three":                            "+3DBQUasx8485gH/P9jwRTLNaE66HoHH7otofdkC/cY="
									"cue export package + package file + data + packageless":    "bSm0dE3Kc/kTV11EgLfFGd/tVBVVz2Z6YTysXbcsMvM="
									"package file + data":                                       "6DEXn3k7S/kvRKe9HLn89TSWFb+KVXlqE/I/GxJ1aDU="
									"cue export package + 2x package file + data + packageless": "SaZPWVVpofcLzL0IqUus94OsCrmXU47Ll5dG0YAGAFg="
									"data file inputs":                                          "/VwQNBQf91lIyW2rIdaNro5hQooQ1bP4LYyon9+OCdQ="
									"data file inputs failure":                                  "TTMx9//h7pkvzyIHWIiB0ydYxIgPktWwU1dlOtCjW/M="
									"constraint file validating data":                           "JCHeUgrvwqFWvK9h+EeYnP8UY4fFO1bDTx06Wg+p1rQ="
									"constraint file exported as data":                          "TWpSvgN2+8TpJhoVSFKJcUtYjXdgxb2tpe5tlhPYpz0="
									"-l static single":                                          "+zsUYxIiBRMUM9wRen0qCvbPg1DCE4osnNQCejgs4MA="
									"-l static multiple":                                        "pB+BdabGKMC71zRplXIqWXXeLPIO19VJTCti4H3qEEw="
									"-l static multiple files":                                  "ZoEep5AbgLobmFigUwGseA5ophKA5X1Y60i4oeTv3ik="
									"-l dynamic single":                                         "XGNASLiULiVlZc+8u8yGX+erNKDyQlEiIqZU7m2o92I="
									"-l dynamic single with function":                           "9g6s3Xe5bOgiKX8vKgLCzpWxa+rWnEp5X+F5zanVwmo="
									"-l dynamic --with-context":                                 "SNfndPWCfXZgMTpOLfP9BwSe99N4QdALJkqlW1S91xo="
									"multi-doc merge":                                           "p7I2iYvgmlKg+65r0crXseNH9LvXoszT3f5wb40RheU="
									"multi-doc list":                                            "VRY5wDA31auLqT14MNI7SDmvnzBRxdtJ2b9GvYgqYs0="
								}
								upload: {
									"test cue package inputs prose":              "fkodBurWoyVwY3SrJkFU7OYhEsyuSDzttpy+2ob1NUc="
									"test multiple cue package inputs prose":     "vbf2amL3qCS9w6wnfhtOE41DgMAyGuXUBkYTi+695TI="
									"test cue package + other input types prose": "8Dest4PloO3HPFPoa9kNp+mu1z0iQ1FB0KlVFLIB2+s="
									"stdin data":                                 "HufLRauOEwBs+UVd+uGVj/KSp6qrHvjpxWI7S5+AYMI="
								}
								multi_step: {
									hash:       "CGJ8RI06EPF3UBTT80MV6V44LHGMQD6CJ2K2N6A64935IH9VDO50===="
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
