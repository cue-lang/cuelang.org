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
									"cue export # package x1":                                   "l/rIAk+veaGAyYzvXwHLNId+VS8/jPcfyXMFISKuPvM="
									"! cue export # package x2":                                 "gXB7hZWl8b0BPqd3eKj0yR/GCllbq+Yd724PkGMCNdQ="
									"cue export . # package x1":                                 "JfF6+EszXgSitTZQmWf4/sQii/xet2dpa3Vctc0neH8="
									"cue export .:one":                                          "nNd5OzsEHagyYfL3j5PdzplufS0zLAJVksCRNOVbW5g="
									"cue export data.yaml":                                      "HvWP03kJVCFx797CBlfo4nhtniEScBEJgXnU5k+Ova4="
									"cue export yaml: some.yaml.data":                           "M3+zmosgdyVPwL92BuoOSYQZjm7fNk7RXY7qrbbU9AU="
									"cue export .:one .:two .:three":                            "a+00cRk7Ds8HAklLk/6dV86HfiBgIpDAxJA/mk7XxHw="
									"cue export package + package file + data + packageless":    "nhiMg2hxIrkJp/XB8yB7uTbYKBa9pGCXaqySha7e5c4="
									"package file + data":                                       "d++VrFxFrcivvFC1oDH8s3dK09V6tB/muNuGVEqrHF4="
									"cue export package + 2x package file + data + packageless": "/C4J+AwHcE90rCPV41qdCQ02PnYG/Hx9sa6ShoOaNpc="
									"data file inputs":                                          "BrqW2co+BGasAGOIFbByx+fk6oy8eW9nZGixiqx5tT8="
									"data file inputs failure":                                  "N7HkXiOOj0qD71N6fZmAbkAxwbhiz0WkTOPjqrQOpKc="
									"constraint file validating data":                           "uTppRsvp1U/sch2AxBRPNtyqtf1bblyoD+MO57kTSAM="
									"constraint file exported as data":                          "atSOLjXXessasAzBkgVReJAHnHVHnUwBFNnMF2udMLU="
									"-l static single":                                          "HdpjDSWE8yNJFoAtWzBsotrkPdKL/BK5DnDWNtQ8Y6Y="
									"-l static multiple":                                        "efv6y28vQnsQJ7GOuh2r9/cdtGQZn6PYs3adkYRWaEM="
									"-l static multiple files":                                  "pKnDkePY1a6rir+kPvuU8sm3YaqnoHm2unJXLvPWK48="
									"-l dynamic single":                                         "j1gsqexaUzS0tZO7fCzWvAsu9xYNkfxUicxmmoH7FXE="
									"-l dynamic single with function":                           "ukPLWepkeIL/5zu2wLHOGwrXDYEbs59WGu2Fph1eksA="
									"-l dynamic --with-context":                                 "MetaQ1gMwQ1rqM9bVn2tocM0MRxqbMizxSkL0yw1rXo="
									"multi-doc merge":                                           "+lVfFBJfI5kEpPhxIkcl/Zvq9eSE2/3rbxp29zFHAK4="
									"multi-doc list":                                            "gqYYh6gUu803C+eI2j0Bu0kFBhD8PcoZkOKwwKoSYo8="
								}
								upload: {
									"test cue package inputs prose":              "AFpGMFbjB3l3YTZYZ5iVeep08X35IaPlixNtSetrwa8="
									"test multiple cue package inputs prose":     "fFMRTqLpxtPXlhPGNUF7xlxk8Q6edZpPftS7Xuy+RHI="
									"test cue package + other input types prose": "ifMAjlVTARI6Ban+aL+k+Tjn7DJztAlNqea30Mr2h1s="
									"stdin data":                                 "HEHTZQfsq2ww4fQCUgSYu4FXiBydWcHHB4ao5bOylA8="
								}
								multi_step: {
									hash:       "9E9AE3OC9PO24L5HGMPLDBBV2T7A2A412GVU1A5Q9SQUE5J74R7G===="
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
