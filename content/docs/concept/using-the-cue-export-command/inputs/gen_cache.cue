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
									"cue export # package x1":                                   "pw3QYyJP/g7EvFCqh63E0xVJJr4NOF1Yx/kLOcLvIyg="
									"! cue export # package x2":                                 "gHiZcQ6fIwlulIF3qDshqS5XnN4FSsps2YEUgyQ9xVs="
									"cue export . # package x1":                                 "/+qQ8gqve6b/7aazkoOXRGhvazy7mS3EA3SDZ6+pAu4="
									"cue export .:one":                                          "9DwOccksQlHEWqJPRMdVGmmLcGfAg6wir51E76gI4n4="
									"cue export data.yaml":                                      "la2yHmHHrbzEoFpeDcXlM3TwiU0i5OTRmt6LbMG7ubY="
									"cue export yaml: some.yaml.data":                           "+NWqcjJzOi/YehqUDJsFtKyFoScfNCTr4/7xqRRF9wo="
									"cue export .:one .:two .:three":                            "Q8b49dMIdAeMR6+FjridcO8AW5iHz/769INGdkkhX9Y="
									"cue export package + package file + data + packageless":    "GWJ/+vXt+VL5/o806LNi40kQ655T1pWZR/qnsMbcD7A="
									"package file + data":                                       "itw/Tkk8aYZR9Wn6onOy27NUSflQGR2r4Acsvolv8es="
									"cue export package + 2x package file + data + packageless": "lbv3qLCGbYiMlohU4Nbuv9tm7Eisg/rC/chtzJiCoCA="
									"data file inputs":                                          "zR+ua8w3MmldsANMAXCQI27PW9Z4UePsZX6Y9szGqkQ="
									"data file inputs failure":                                  "UcSlWemWlLkka8C/gsYzsbPWUeemiw97C0IXiIZhyGk="
									"constraint file validating data":                           "2Y+Xy26OtwzcstyIoj85YT+HkVjiGLSiMZLcqadit98="
									"constraint file exported as data":                          "RdyXb2H1yK5a64IZYGsWqdk7QTgNibldzkUy8wL5s4I="
									"-l static single":                                          "nHxX6G1xVeKVKI7QsiBBfiLafs1Y4dS8RgDYq0jfCUM="
									"-l static multiple":                                        "LxViuGNv3W20iwDjv474S3nxMJpcmG4vR9WEIK9bw/E="
									"-l static multiple files":                                  "HBHR6+RN/O6dpoUyIbxGvP4v/4TDFLtzd6Jot9Jup+A="
									"-l dynamic single":                                         "fSyNwiStHLaI7MTiR/lyhYnmmaShQcWhy4Ph3pcdyY0="
									"-l dynamic single with function":                           "acDeGMCWu94Q+vVS7iAFdCi2zAEdXngrNEnvSZVWwWE="
									"-l dynamic --with-context":                                 "tBQrAMOQ7FHPGGsyIlMyTebki5eCO6yvQ3wh6HbJcww="
									"multi-doc merge":                                           "i+Bmo0f9B1ciXlXFJ6EntWqea6acGDp8WGUhr4L6Vdo="
									"multi-doc list":                                            "eVYEbsQEnY/LUArRdVjIe+BTpPXmYQfM5KniQS5bAoY="
								}
								upload: {
									"test cue package inputs prose":              "2C2B0hJnXVn4rgX14ZggWnMSXbNz+hTQy4oy++dFls4="
									"test multiple cue package inputs prose":     "6V0IxZnZRPSg2mzO3QVWSXQwNc0iQGYZq/TgpbSXbPU="
									"test cue package + other input types prose": "oOXmbFzI7EY20erAgUm3XwL57rltyTx1g2GKUhszcy8="
									"stdin data":                                 "XdC7hm7cajTAcrBN/yVWb+SOSb9yuwKuTdGwNWnlB+Q="
								}
								multi_step: {
									hash:       "11A36K66A1M8TR8V587RIGSOGN3GE96190GOJNC7LHE7KJDDP4MG===="
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
