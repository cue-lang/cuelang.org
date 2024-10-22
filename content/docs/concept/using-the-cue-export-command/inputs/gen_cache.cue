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
									"cue export # package x1":                                   "F3OcoomSSqJG9zkxfa6/zirB0jpAWFQZ4dLNQariXho="
									"! cue export # package x2":                                 "X3Yh8lR8wGRQW4DWsyd9pRenuELPYqR0PcMfmjESyjM="
									"cue export . # package x1":                                 "dmumvWI1/BAyPukEvdICSPge9bDOJbxmffzgNJg9YK8="
									"cue export .:one":                                          "/4oFClo7d6oxf4f1U0jm7ZqQVweBi9WzhX2jpvUqALI="
									"cue export data.yaml":                                      "FGCYku8h7KZ3giXsz38HmBzj3savTjvgbQ8lLXsCQ7M="
									"cue export yaml: some.yaml.data":                           "DeBO9iDGsameNH+eFA6JrIF/HXZgCNdY9DxFbVsUTjY="
									"cue export .:one .:two .:three":                            "cShH/r6G6IhTy7aLARt7hNDKqGA6Dpx0NFnuKZsi1VM="
									"cue export package + package file + data + packageless":    "hlHWastAY5CC1T5P4CLlVnUn87+nGVYaqMXwneqAIlA="
									"package file + data":                                       "vsBHk1Z/lNtSO7aPqjZ+KPaPfECEnCqD5/AN4rR7r+U="
									"cue export package + 2x package file + data + packageless": "PQ+ouxT26tyK60zqpcugv4G/qlcgIuuV582DFJFvwCw="
									"data file inputs":                                          "LZwWU3XNl+xbcf2p85YpLiHkgDbYaBxAgimDXL3DY3A="
									"data file inputs failure":                                  "mvJBgIaveaDTWipNdfV8ysOyU2AHvQkJVviyQ17oriA="
									"constraint file validating data":                           "MZYM0nQKDM4aJdhW/lN20Tt4TMd6b8GIwzE19PvDrww="
									"constraint file exported as data":                          "SL9lo/XTSFvsRESGp3vDJ48zr3arT7BOaFx95xNLPdM="
									"-l static single":                                          "uJUyMJgG/tUShRoGuVhAy01HlmYQZTTUV6QExjVG0AA="
									"-l static multiple":                                        "DKT6oVe9X/N94inJbo8AIgyOjrZDWSbR0+OVIcNUFks="
									"-l static multiple files":                                  "uVmYLHozsWbN9Uy+doY8kaU3kGwQa3EtARFsxQiL1/Q="
									"-l dynamic single":                                         "mDsWFDs9kQBg7f6Nohe8cQq+UKa77avhksIZnOEsRI8="
									"-l dynamic single with function":                           "13nk4E+A1o0Jmao/UAdMbDi9x3sDBBrt5zpnhpcrQw8="
									"-l dynamic --with-context":                                 "mfIjaqsh6CFgfZjMlFnGuL0JItpxKvdk0NGlglGBOgs="
									"multi-doc merge":                                           "37fiQVYrbHmrsRCW6B74xIh381L2pjIDN5cO0LRfFlw="
									"multi-doc list":                                            "yj36Q7Dpbd+5iie8Tp0CjSKR2gWwpjr1A9RPFIdwHEc="
								}
								upload: {
									"test cue package inputs prose":              "pOFGkp5VgN8HtDTUZ3AWHd08eSBNnGaV1YefO4oKzzc="
									"test multiple cue package inputs prose":     "ZmzX8FelI+g2zpdHjNPk+PttRGHZv/AmvaK6AmFAGQE="
									"test cue package + other input types prose": "QzGOBDyJVbTISu1ZYZ3J6bcM9x4URS3Zr3Gaw6D87uQ="
									"stdin data":                                 "H0895EESM+2/ad9a8Rb0Mme4+R1oKm89iMc2xeaxxao="
								}
								multi_step: {
									hash:       "D59NQQETD1T7DBMA61DKH09UHFUU440HA9RBN2F2O3JUH2719500===="
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
