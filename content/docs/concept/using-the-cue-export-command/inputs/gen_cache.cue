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
									"cue export # package x1":                                   "LlPkW8OpDWAOHCfgQeJd/4imMGV+EgQRqDfD6rXVTWw="
									"! cue export # package x2":                                 "2U3pxoQPTLpD0i9Dzp/IHsTvpzyv8lIdjsdXmIMwVeI="
									"cue export . # package x1":                                 "QD18PWEti6YjBk/AMGT9L09Q8P4Wn+y1dgNqm5hh3hc="
									"cue export .:one":                                          "ZbrcQW86SFb3Ya8++iXz+fmnsYZhWMXOF1nohFpEKzg="
									"cue export data.yaml":                                      "Zmsu8a2xfvNKrP82c//Jc1RUhpUR3R9Q0qpw5u8QFYA="
									"cue export yaml: some.yaml.data":                           "0p+Mwum460XOj9owkfhLq793fpl53OxdfO5aDEM9w6Y="
									"cue export .:one .:two .:three":                            "sorxsgdpcCAjfsONIyNLh/gaKIbSrwsKoEiXJZ7+eng="
									"cue export package + package file + data + packageless":    "YpS7E/fUxM5D5G+2nS0DhBWhyz3bV0Oh+erf2SEd+3c="
									"package file + data":                                       "V9dpImdq538bySFqoOc9H55tjBFr2EUvd1ibjH/ZRBE="
									"cue export package + 2x package file + data + packageless": "6SrN3JS1Gf17hyvvZ7qAkV7ZODhceJBAjHN1LYX//uE="
									"data file inputs":                                          "Gr0rgSwZaptWj5THs8N9y/PV91/mCeMCcZBZKFs0Ay0="
									"data file inputs failure":                                  "fOEWTtM15E9S/QO8/LyOmZfk/AdNN8RDkFqLR7zOlA0="
									"constraint file validating data":                           "cEn1VQDRSR3A7v5IMF7XnD/mCUIEoqDJDzodd+GYN7Y="
									"constraint file exported as data":                          "HgE6EmoenZyg5BH78SjVZHnCKn2ggzQ3AxggVF8HwZM="
									"-l static single":                                          "FTdo4bsQnOQFbpL8UIHiWAWz620BdepNbMsWtexbpjU="
									"-l static multiple":                                        "BsSsGa3/2EMElsnzkk/px8ZoA2j2cR3OnLPganN3kms="
									"-l static multiple files":                                  "Oq3aBqPPmwfDPokiGlZyrqM4MeHLywN3yay87PmEMws="
									"-l dynamic single":                                         "3i1Blh2ze97W8YKtqCRneZi0Z1438wHwrPmiACCpjeo="
									"-l dynamic single with function":                           "fE+Ne43KGBAVVYR6zH5SGel5aadGjZdzlVk7yysoa6Q="
									"-l dynamic --with-context":                                 "q9h0ljyCQvupMUZ7obpTNzTNrrPjfdGcl6UZeQqG1CY="
									"multi-doc merge":                                           "AWUVK2tYDqZole6+l4DnL3TqVjMP7G/kBGpgGkJlARE="
									"multi-doc list":                                            "F4RcxtldU+rHo+id9VxS/JBch20r+MzzS7PVMPsgJ60="
								}
								upload: {
									"test cue package inputs prose":              "OtQBGxS82s1v4wS/RSttMjSRzsuF6nyo/KBrPvzAuNY="
									"test multiple cue package inputs prose":     "adY2jNIgdqdfHH0alvjA28+Jb9f+ui0xQsflHCCw3I4="
									"test cue package + other input types prose": "Il5b7nqwALwW8RI1shoMgFhmlTdzcrJXJyYMpAkPbNs="
									"stdin data":                                 "grykRPttaMf7FhSdz4zEOhTBSKXUPIZSs1CkiK2EN1o="
								}
								multi_step: {
									hash:       "N45BKD2LU5CQK357LP926VRP4F7JJGP1AL55HT3L70DDOFCI1PR0===="
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
