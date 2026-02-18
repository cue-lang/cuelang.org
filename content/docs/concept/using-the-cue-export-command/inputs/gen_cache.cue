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
									"cue export # package x1":                                   "Qv5BtcuUuE2COCVp0FMKKlZ9RB+MnCWjsCvH+rop+TQ="
									"! cue export # package x2":                                 "8gbjntrw6pseMl5rntgJ3KTOXkKyUZdOFvJP/edfyJA="
									"cue export . # package x1":                                 "RG/a0V2un9KU51BCS2OXzgsla/IS81x79MBvLA0rRuk="
									"cue export .:one":                                          "/FFtixQTo/2ZKsfT3QF5b/Saq/ZHdS69pjQ9yoM28VE="
									"cue export data.yaml":                                      "4ghCS+xZs+uMrUtlASGaRHGgTordqMwS+bhvxPO5seo="
									"cue export yaml: some.yaml.data":                           "oIS+UFh0sJEa1cqCTYw0PVVk79/NS0/5ZqKO8rs8M84="
									"cue export .:one .:two .:three":                            "ZAoC8vanhfrIxc2z/TrsZ2m+Nn5mHPBR0LMxUYi5UMU="
									"cue export package + package file + data + packageless":    "DcnAP1OoCJkCIdcbiS1CEicnkcOAYsgtCe74jkReoHE="
									"package file + data":                                       "uVeHaJ5VzvOqQWfzoQAYVKzQeOFw+q2niR9NFApWNV0="
									"cue export package + 2x package file + data + packageless": "39TJV//qTd6+EbY4AuRZapBUxQVrYg4QiEyb7lLTvEc="
									"data file inputs":                                          "f8ROvNWNvvOg0/0Q1vREPr1OOB32RiSVKygiQul36M4="
									"data file inputs failure":                                  "rVNySGqRQLKAasQJxdn5tk2ScV5Bfw8QR9kMpkPu3Dk="
									"constraint file validating data":                           "06iK9lrP25tclbjd4Nd7xbDISX5S9SIOfUge6OylJc8="
									"constraint file exported as data":                          "HWIcDULm1S0mKM5gl0zCV124y4763a1BH4B4andCs+4="
									"-l static single":                                          "/5CGrSbWuYqmgHZKrT5SUS99kNt9jdVbMaKKeWkSt2I="
									"-l static multiple":                                        "TBc9Qu/uTXxoDyG2xTP2I+c4Zk8Efl8yLoJZUu34FJE="
									"-l static multiple files":                                  "Z+q4gA1MjlbAbSdb0ZQQJM9Wlj91EDWwF+QFLw+ZjUQ="
									"-l dynamic single":                                         "GB5oLy9dOj3GIma5srXT8A5bM0fbOEJXPuEV/LUifIs="
									"-l dynamic single with function":                           "zZmusJSlGQCxzTZBKKGl7sVS7xZi0c86oCg2b1MZ4bc="
									"-l dynamic --with-context":                                 "ASRYOt0cgKQAmRcwRYajkRpmG5MuqTwJneFdSpW0GHM="
									"multi-doc merge":                                           "jDKqxXH//LQf4ayHeeSXvS3n0DQUGkAaKibw97P6u2Y="
									"multi-doc list":                                            "R+GEoY4FG/2tZqnG5wJKhSTrDvrMrp/f8LZGcBhPAjM="
								}
								upload: {
									"test cue package inputs prose":              "iRHIhIkZfhNDtjyYJs9PtNIecOkTCsiFrJvvzazoaO0="
									"test multiple cue package inputs prose":     "MxOuEfm7EmR4S5eZLAvc+My98VRO3AEO5GRPcVkJcm0="
									"test cue package + other input types prose": "znnhToXMEc0tQ0U93jLFl2ZXciq3G1Qqm13vDgARITY="
									"stdin data":                                 "G3/QKM9E/MftxcLf7kFc/v7auUJst600L8WWbho0NoE="
								}
								multi_step: {
									hash:       "5E6TOKQJNUHIRMVEGM9FTTAGRQM14R7COMO2QQR5PPFMCLOUSACG===="
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
