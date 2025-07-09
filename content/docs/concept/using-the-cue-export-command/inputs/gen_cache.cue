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
									"cue export # package x1":                                   "/2cPCsZlyjbbCqPpLvnsEpqQ5fisEeHEiWpPhgNqCJI="
									"! cue export # package x2":                                 "KPyis3eL+STJi05n/6Z5F5Oi+1biJuj3dwOSivB3fSs="
									"cue export . # package x1":                                 "eJnOEdODB7pMGd2sp/dlORtORAq0einMCfxT/lqRIB4="
									"cue export .:one":                                          "+Z7idDbGd5anNUAcHPQMQ0mzRwrXQw+McjsUydEMi88="
									"cue export data.yaml":                                      "viiASvAelzGzcjCUtQ4EjwkuvoTKaryD8RtuSQpue5Y="
									"cue export yaml: some.yaml.data":                           "0qcBJX0C7Pb5b93ZsqE2iCdh/lqHvY5lXWRwMze/AsI="
									"cue export .:one .:two .:three":                            "Gm9OWM68vv66tKXqIOfR7sdaJ4EjYfApeywTc8wOHgE="
									"cue export package + package file + data + packageless":    "+6USVLSdRDoTGwUnZlG0Xey2gC8ZRiHNUSiyTSApLsg="
									"package file + data":                                       "kIKUXlmjd6QneKZFzhOi5gu04KMbxPzTtEuht6k/3iE="
									"cue export package + 2x package file + data + packageless": "KsGqwiHeqP8mjEcmQ/bU8tKn5ZIRyT/WqgKfibVoWYI="
									"data file inputs":                                          "tCiQWI1dTQqenN/emLn7vCCc8W+E9etw28fsEyOjo68="
									"data file inputs failure":                                  "KHm8mrTstTXX1OPd9w3akajmbvU+u9+rHT52dB7svw4="
									"constraint file validating data":                           "T//8QmCFMuGtCBjC1/AKSfnlrI981V5YPhnr+IGd82g="
									"constraint file exported as data":                          "l0zdXm5ogZgaK3rBFiYckSL1UIcX4SrlCW0px+qd7Ao="
									"-l static single":                                          "3ed4qmlIxgblOveggoIz5JcdNzjlzGJt2mY2AEl+SPo="
									"-l static multiple":                                        "IOs5POk86jetTRM3eVxKf5BWSJR5CoJBB4tG75pkE4A="
									"-l static multiple files":                                  "0aQWXPpCYsvOXYIODDeZMwB4qtRPuz/LuMUPhBgPU8M="
									"-l dynamic single":                                         "IVRDrHZ6A9PuSml9hVag5y7e54zZZe6S1dyCozBnQLk="
									"-l dynamic single with function":                           "KNAxjvcOPrrq4ihbt+TJw1MkFiJ2iv546r9YBcEv55g="
									"-l dynamic --with-context":                                 "dHaPbaYjts2A2GRGVxs3MJjD2xraTW1T9Fegrx5YFuQ="
									"multi-doc merge":                                           "IFPXsME6TwWIBLrB1R0NFBW3+Vu3EJo6k7C9Bw58WuE="
									"multi-doc list":                                            "xNlwpl5LLEd/VWA8ULvsN6rYJtF5SMdPYL6//TMUnP0="
								}
								upload: {
									"test cue package inputs prose":              "lSNSYT11+CWBrK31bmRGupkI924eqexHLmlNdJVaL9o="
									"test multiple cue package inputs prose":     "UvF7yju3VzrnVnIDBu70dvmhmbYyhf8HYVQ17W2/Kio="
									"test cue package + other input types prose": "l/N05Hkp0LNbKW2p1j1oIPfWdACWt5xYMFJJCHnrZGw="
									"stdin data":                                 "5e8nmDejI30O9Pwkb1Uf4bPQ1nlQMq2M2ywLALFOlnU="
								}
								multi_step: {
									hash:       "NJO1I4PB14QT2JV5E2BKRUBBRMNPNT89JUO5C3JUI62L0S3OGP2G===="
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
