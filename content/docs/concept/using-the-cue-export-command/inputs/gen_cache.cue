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
									"cue export # package x1":                                   "vUYJ5/aZTBRuAFX9cc6KnqPlCGoiduws91sk63X6yPU="
									"! cue export # package x2":                                 "vikHyegYErlbKWFMS+//xbFa7rzECDsu+TC4307yGJM="
									"cue export . # package x1":                                 "YuUF56uRvIe4vZO8yQLUHMX67cjTn8qoeUJg/VgDM6I="
									"cue export .:one":                                          "+XyzLQCMBeO0196tRayv8aMN9rMIjst8wsgYrA4lxS4="
									"cue export data.yaml":                                      "zVvIv0+ndHU6b1pdkBLCT+e2b58/FL+RuEWKo0XeZ24="
									"cue export yaml: some.yaml.data":                           "m+sd6jZdOB1CMzRGL7m6ssY4mnFaA/XQ6CAfLnja+zI="
									"cue export .:one .:two .:three":                            "LcT+baABgi65jEnKlJaoYzVx3jRZb3ySSmlKIjKOnVo="
									"cue export package + package file + data + packageless":    "LLQEO17FiBmHn2sSHutkHZDE0C7RGnNUwosiRTWklHo="
									"package file + data":                                       "bWYgbyIKS/AjhFftpocwObncsfGowt1EgXUhiXWY4b0="
									"cue export package + 2x package file + data + packageless": "ye00r7OGN7XfJvDbWiSAU2Iw5mGDDTBrzPnOTJwEy2Q="
									"data file inputs":                                          "GwctEMLTfnKRlim5SvFW1fEDrauAL2+A4dKGCFHJcy4="
									"data file inputs failure":                                  "1KLXrh6qFXxL+wK1Q1TfRQtHHVrExhrrC2bzXv0uH7M="
									"constraint file validating data":                           "j2feoIGMxxsB8oJcNBojkkSgzrtH1fPtvnXzdkKIo4Q="
									"constraint file exported as data":                          "3dZ9D9zp9KNA3GJ6tSnR5GBS8QPdTZP5ilqLgjD5K0I="
									"-l static single":                                          "ioc0Ofk1svR9ACXhX9B3nCbfVucANRBgNOzG75uKz7E="
									"-l static multiple":                                        "ZsppJx/4JbpH9TrUTwSFvbsM0jt3yOeuvwkZ1fvJVwU="
									"-l static multiple files":                                  "NIFW4rS2Mn4va/ArGIkZGrtTvX9nnTAGNMAM/LolfKY="
									"-l dynamic single":                                         "H/3ARm4urOLOO0JF2tqOPvIqLGc48dcpBcmFPZQl5dU="
									"-l dynamic single with function":                           "kolLJqRNG+mDZuWTHHXYvoUh9+qKvoweTw5L7cl8Hhs="
									"-l dynamic --with-context":                                 "Ey3NUu+Fv3Kt6imC9l1btU/iUSRDR4/I5HLQQvLKWQ0="
									"multi-doc merge":                                           "DU0PaU3eDmrdFU9BPXZpUdN9jhCq1DWwAGstz6AF390="
									"multi-doc list":                                            "UtXUkCNOtVzp72HR5aG0mQ5QO+58p6ypNWpXRbOcZ5c="
								}
								upload: {
									"test cue package inputs prose":              "vP5KDNQ0rfWIzP0VRY29qHydQSVyPpsgH/rjnglN4Uc="
									"test multiple cue package inputs prose":     "52ABBhoicT8tBbJa9sMgV7/DDrOAScKFFq15r4R+kzI="
									"test cue package + other input types prose": "33rTBLJFoFjUNnSd4vsCp0XlXSlmtN18vwsq/7uNcRA="
									"stdin data":                                 "yGMqkuK4yh6fhUEdj1zay5/dV58Wa8T8dxqmv7WciXs="
								}
								multi_step: {
									hash:       "7LAD9NHUDVSPUDQ1EQOC6V6LUBIGJQ255I0GKH5TEDDD9FQDM130===="
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
