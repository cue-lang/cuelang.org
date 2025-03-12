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
									"cue export # package x1":                                   "gKRz8OgXVPUcOwlzPtGcNJml3f87d19tI0RIudlC6Nw="
									"! cue export # package x2":                                 "hqbNU9OxTSGLpUeVfYug0KBAnSyZgzLym55UZddsGFM="
									"cue export . # package x1":                                 "qNeyjQP3C1xiuDx+7nSipTE1mRSi6bmKQrct30frYzo="
									"cue export .:one":                                          "NKROCLqDLdtTipkgMX4pen5bpPyLaBDvlWb3zVzE2hY="
									"cue export data.yaml":                                      "6t9ZpAjDEzD9Tl4fgOzqaFuc/d7vH8/9fOJRFXIVrqM="
									"cue export yaml: some.yaml.data":                           "hk93RaB+mlbOy4ZmczsDqpD3k3Ww3FE+eSZR476TO1A="
									"cue export .:one .:two .:three":                            "29Hf8xXTEkx3vQMKX7D7nduKXzJFzAYTYfxC1KH/dO4="
									"cue export package + package file + data + packageless":    "r47B11tcfWTedqcq67Y7FVvOZPNKa1BzDipYFo7l9P0="
									"package file + data":                                       "Z3/UpM/XyeIqJmjorKmkkUH45LE63oEd/0C2vqoagd0="
									"cue export package + 2x package file + data + packageless": "dZP4rXTrNQ3GFZdbHNyX0ERlNcAAJlPsz4IzZJY2YeY="
									"data file inputs":                                          "mFIa63wx7zh8rHJc3TV6g0BgvKOReKTdRtLfNCcqOMY="
									"data file inputs failure":                                  "0+rPghWK+n+v5NTR3M+nxJNlP6qgw9Wik2nkrWNoHZE="
									"constraint file validating data":                           "QHwoE00JRUgxAoPsj6EE5F9V1zvUrXBk/v9JWrDArfY="
									"constraint file exported as data":                          "jydyG9uBf3V/GoY4rUNNV3yTXmy6yAsrmuwsaHPhORE="
									"-l static single":                                          "OPsYHnvGoy588RbLewXdWDhZHzj82JbyWjaeiUle8xM="
									"-l static multiple":                                        "amnndWEt3uWmWLeOt6BTglTb7f9XysPdwI94KLgHmkE="
									"-l static multiple files":                                  "odZuBdquYB9eSbzKAk5VJ0R13bwfkF04+ohs6Tww4AU="
									"-l dynamic single":                                         "oOEp1ncZDEfjeXxIM0GjBslmk/+hwcrTa5TMXn68ueM="
									"-l dynamic single with function":                           "E+x7wQx+PIYh6cPKrhI51UZ/0JXS7tIFRG8vfAHtVI0="
									"-l dynamic --with-context":                                 "VJK5iMWNsz541nMnsoYXOTrw9nkkF/gIXrjXledGjBU="
									"multi-doc merge":                                           "JUJnbN/vVZjLMfRil8F/8ELxF4ewFfaiSZJl4pjsKPE="
									"multi-doc list":                                            "MVf9LQmEiSbeHhwb+B7nscysXxOz9ebvPKQb5GOShzQ="
								}
								upload: {
									"test cue package inputs prose":              "xfmIMNqk//+F+lMGwVzNSayc4aMXVNzpwLL/tqkHw3w="
									"test multiple cue package inputs prose":     "iYj8wJXKGbupGujhTK2jVlWHfi6OuYfGjVRSVFweTZI="
									"test cue package + other input types prose": "+ewLTTV3eRnPSqgQ8e/azYAly5HUWlkPVCj5o+108po="
									"stdin data":                                 "3/7pwLYk3783IqaKwN/1MxMARf3KsejhuqhHeirsULU="
								}
								multi_step: {
									hash:       "FTBU4JECBRGNOLKAOB4B8V8CDJE3L0QG9BCDELTNBEUQSF4BRAAG===="
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
