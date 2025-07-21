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
									"cue export # package x1":                                   "ZSr+Bip5g5aHQ1hxwmiOxCpD/7gyPWxmBnuVcW+iRpQ="
									"! cue export # package x2":                                 "qffF+R/gkWiVBolrMssJjf1a3oCSgWATYbzEbDnFZM4="
									"cue export . # package x1":                                 "XMJa2hQwjoCEUOZ1PukkDEaTsuqqH7p1cy5tKmE91UE="
									"cue export .:one":                                          "Q3f5xFFBtH7wr+83FHke8RUBhckIYkPhuqx3HE1RZDc="
									"cue export data.yaml":                                      "6HOD9t4pAfJ5lvmPzvJgj7kDmRH6lzCN1EXM9qejuoI="
									"cue export yaml: some.yaml.data":                           "89XaJHEOnJFX6IG6kH8IbZxTMq0GXG+qIJcovskPxlY="
									"cue export .:one .:two .:three":                            "ffVPfgCTXqyuQs8a/uypvTZYx2wWlNpXDlmLhsfYgcQ="
									"cue export package + package file + data + packageless":    "9bMgMCDoXQK/YEw5h8wkfYPirUW7y0PLHCYArathgTM="
									"package file + data":                                       "v0PB7lww7VUq/FT3bGCBIC2hPzlrv+tnffNBJJerB4g="
									"cue export package + 2x package file + data + packageless": "gdsieF1ePcT5Qx+ZPs+xJlxvkiA0bCRo0Z/U4g/4j9Y="
									"data file inputs":                                          "FzUz2w08tBOqbSdUqpIPAMAH7wjHNscl59g8SRLJMNo="
									"data file inputs failure":                                  "wB+/EIXtIdk9xP5BPRoBjHb/23ZdruvULq8DGIUXjP4="
									"constraint file validating data":                           "1gblD9twaeZs0WauHg6NZ9KfctrL6fxdh/fPfddbmKs="
									"constraint file exported as data":                          "UMVPxMQohACxCr6YGFQ49yOCGwvOi6IQO1ho9OU99uU="
									"-l static single":                                          "P+LEwkqOWjkkIb2l5bIImUJOh6YhN/pKTQkoQ2/zxuk="
									"-l static multiple":                                        "VvePHD1tdYW43l/fkpWPPNMMUHiOHLsJha4aatESPKM="
									"-l static multiple files":                                  "UxnWRvtrt6aDfOlRIlrfBy5dlSZrADIOhv6Jk0Iizfk="
									"-l dynamic single":                                         "mWWYegl99Jw9htOfjvqrcTizX1SbsYnmkWfnvwrACSE="
									"-l dynamic single with function":                           "4z+PxkXAOWQYmdVCeZSrG8yD0CDS36E0GE9nvU3UfgQ="
									"-l dynamic --with-context":                                 "NQ8AQW0/CnadB25N5fwoNerdqMoxr7b9v39AXwxwYn4="
									"multi-doc merge":                                           "n7NtJfCnnHKFVPIy1UQXTTYqtym8dFvXYTwNJ4wS8us="
									"multi-doc list":                                            "/A1ysiqtsnaHNBpqXbtN8QHpYc+AOYLXj9bE5vbm340="
								}
								upload: {
									"test cue package inputs prose":              "rm6sx3RBfQ0RYqxRp7y5UyLHN9IUCtt3nQXRTKoqalk="
									"test multiple cue package inputs prose":     "JJmbUEUQodpFI9YnlZgC54DKbsYAcPyI8s3f/FezxSU="
									"test cue package + other input types prose": "LToaqeon6u6p3szW6afhipIyj7VoW20eaXW0WkrPyp4="
									"stdin data":                                 "9gdD3yg7C6CkWW9CfWNzLEr5p8YPgoOSgcftWxzYkFA="
								}
								multi_step: {
									hash:       "F2M4FIKICLIDODCR7JLUF6SFGN05ODA9TCIVU3N0VA4UO8B78O10===="
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
