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
									"cue export # package x1":                                   "CSmvIHKVKtY9xKC7b3J3xoVY//09yk5juutlbCBWz6Y="
									"! cue export # package x2":                                 "tN8QL0a8e0bbVO3DlUZqMl9evyV7BRa8uiSrpvJN/YY="
									"cue export . # package x1":                                 "p3Dr0KLrXRuVgYo7G44gKCZ8a2HYW6o6Iqqpci4lxI8="
									"cue export .:one":                                          "dPHpsx32xnkoj4qhzdmOkZek3qpxA8cSv5NT9x/WFNE="
									"cue export data.yaml":                                      "m89fvdAsrgIYvHrZc0ub2DCH84Uz10n9ou1+Gjp0HeM="
									"cue export yaml: some.yaml.data":                           "RMwBijvwI+dTnmLxSHjuMt45pnPksv2OtXVNQPhx1Wg="
									"cue export .:one .:two .:three":                            "Qebbcq/jkeGuhsFvBSxBwaaU95Gk5qcfOpXC+L6VG6Y="
									"cue export package + package file + data + packageless":    "w1W9n6KgsxsfuG4hNropAoPjsGAf9vKr6FxgCrZQzB4="
									"package file + data":                                       "Htv8DOzgSqZY+xzPFyjPH+TYqcEcoP+/Lbb/DOKz5Hs="
									"cue export package + 2x package file + data + packageless": "YkkobjC/inbULNV7XIyfEkFjKU1kw/BC42eV4+EzeP8="
									"data file inputs":                                          "l/y4zTPqvaG2eBXpjhGaFMU4zgh/nfB1dqPp/dFnXlE="
									"data file inputs failure":                                  "I7qJv0vtYJC9AyuFeHWwRH2coYbPSsXnAp68mYzahlQ="
									"constraint file validating data":                           "chK7/faZ9sznejK17gEdf2wdqWplMW1/9mKuT5Me02k="
									"constraint file exported as data":                          "6b9N0C4NeteO4LFvMUZQJ7/+dmIJ/rf4bqNT3yEAhTo="
									"-l static single":                                          "W/bL+A1jfBi6xGyOcxBBwk0FE7DQmQVvtVu6i1kTtw4="
									"-l static multiple":                                        "HPjdHKsde6DZrT2Mo3sGABtysGcGOt+LuK+DkSELHZc="
									"-l static multiple files":                                  "S8wuHM6uWsNlVQGkDzQ/yTLIq9MxQjVuuv4vvyMymck="
									"-l dynamic single":                                         "8aw8x864BJ6qSS+ORU4mhoVVH7qlpy55Mw+8BxCgg1U="
									"-l dynamic single with function":                           "MittowID0qUF6tOcX7nSy+BPLItsvl+IEO0a2ttuqtE="
									"-l dynamic --with-context":                                 "bzepMcNepouZ6pKY/hroekHp36DQrY2hO1FhSMyiJgI="
									"multi-doc merge":                                           "Dp7Y+xWYlhaQAsv/teROcb2kAt/mgpD5I9K674gpi8U="
									"multi-doc list":                                            "HBpaqUB0L7/+bFWo3d1+p4qi8aVc2ig2o7bX4cIto8k="
								}
								upload: {
									"test cue package inputs prose":              "5Su1MCQdUKf5zZbBcT4VTsh+4KzEHpD2uMwAVkZfddg="
									"test multiple cue package inputs prose":     "MmZoA9+wY+/rteVTdGB3o/Ef9XJ5RhuiVG2+B5Moaiw="
									"test cue package + other input types prose": "aZlmtSO8J1vtrGbjcGyyey9zp2vUEQa0KKdn/bDrf18="
									"stdin data":                                 "9Z3qR+FuWUu+eXzEv4EcfLm6cEoD+s0iiieoDTcqDkw="
								}
								multi_step: {
									hash:       "LSNHUOUM389G56DGGUQC3I99VETCUF3T9BJH8J7JVCFDGEUDKDJ0===="
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
