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
									"cue export # package x1":                                   "8ucgzCNykscPflBppAYTrbUGYjBFTQN5u1y2gLqvGfQ="
									"! cue export # package x2":                                 "EMJpctZnYXY4CrZgaQg4YaSb7ieXZ+0YiMmHA0gn0bs="
									"cue export . # package x1":                                 "kl3s8tdTm2x2IZrK+RtcOZrYYZ4eAB9HN06RqPiGLZU="
									"cue export .:one":                                          "UJURSiTml4DBOh6DG6bFeIa2oilXRJpFkn1oJkqMojY="
									"cue export data.yaml":                                      "7fjjyExsNnuy+XK1cg+yXUuLDinx9r3cjVsMBaGOWlQ="
									"cue export yaml: some.yaml.data":                           "ivubN3uepbOYyBk6ZeUZBzzIeIjtzIhjdasmAyYLN4U="
									"cue export .:one .:two .:three":                            "NV1t20A8jywnrBU/LF4J6CoWPHuPOt1faEG8fLDHUY8="
									"cue export package + package file + data + packageless":    "KNZxv5jJ4DHcbWNEKoP/LQDLJ75lc7aL+povndt1928="
									"package file + data":                                       "+VNRWOhKAp3IuSKtNjqjazfEMP6kvZyQ/f0ub/U6HkY="
									"cue export package + 2x package file + data + packageless": "IqpmZfxmqpapegVDTbfa3XZ9AET/h59QpOEYJDq1UpA="
									"data file inputs":                                          "Jpshy9H6sPxpafjx7U9ZolYBb8b3fxs+1wjRiLehzhA="
									"data file inputs failure":                                  "eR9HfMfttmxquNUBDcKBYyphTeuNcjpAKS5wu5xJ0ak="
									"constraint file validating data":                           "MUi+LYVZYpDvubUjNcc3Yv9qWYM+RKt4oibxPKdyMik="
									"constraint file exported as data":                          "7ufvXgilQYmBiMYOiOnl2iPrTskqKprXHuVr3oRLwYA="
									"-l static single":                                          "gMBGEJmKSkyq2sQOnDYxScYIaG0qKeuJBagbSfQZwP4="
									"-l static multiple":                                        "ogIH9J3y4AZg9lx/lO6FgfqDuanF1R1L1hpv2aqjyxo="
									"-l static multiple files":                                  "QucwIIlMxpMx94Lt+MbUXVWPa45Qu0shmh1+mtHqmVc="
									"-l dynamic single":                                         "5OP74TUDVU8JrjR6U49VdivJmULoMaK8vLLLiN/QGVE="
									"-l dynamic single with function":                           "nhnuY3/p3wOflHT74MMlPY+MgBoI0IX8/b/M1vnJxL0="
									"-l dynamic --with-context":                                 "4VcqPJM1dr1gaBRhKpLgPQcvQRMUvaA8YgbTarLcRwI="
									"multi-doc merge":                                           "2xP2QSRMmtpEMPBFjjyMqWeJpEw+L0E7pKb6rZ/Tuww="
									"multi-doc list":                                            "7tfREWgd100T+b3wKmd9jVNkKcSgpTlHyJy8gsBRihk="
								}
								upload: {
									"test cue package inputs prose":              "/vpONgFjFvDq6K0h5hsGoBXkOXWIkIl3j87W01KKDMk="
									"test multiple cue package inputs prose":     "0ulgNZLBEi0ZUBNOUeavBDLdy0uQ4eY422T4ssAG/7g="
									"test cue package + other input types prose": "6wK+FzhqqAWORzI4SP72qm0ugZrbPPPcRNL+RDD+FSQ="
									"stdin data":                                 "en9VpdBt98CFK5vHALQYT7f6+8RLBBltmK6SPN8kWnw="
								}
								multi_step: {
									hash:       "N6BD7SB8BB4FNBAVP0N5KQB6QGL153NT79701J7VM554E9U63QI0===="
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
