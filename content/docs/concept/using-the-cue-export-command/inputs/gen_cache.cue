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
									"cue export # package x1":                                   "BBF1WIqKTwGqaweRZYqaUPF3zfyNZk4/uNPuEO5J3d0="
									"! cue export # package x2":                                 "00N/BNfKgWlaZszEyqW9y1e1OEWyFOkfDNzPZlAI7hY="
									"cue export .:one":                                          "TChlBGZqKIjWIrQgbAlQdgQPyAjvSnlYwEEQ4zQBUh4="
									"cue export data.yaml":                                      "6HCbq6+fsmH5lbXi0oDnfnFBBbCD5SxQljyDmSTdfxQ="
									"cue export yaml: some.yaml.data":                           "B4KPudBKO2k4kOdmUcCrkbPbiGxc9/i3InrJ/pX/Np0="
									"cue export .:one .:two .:three":                            "we8H4Hc9780sy+rcX0l7VQ/F7tNPcisl26+qYg05+EU="
									"cue export package + package file + data + packageless":    "yMY11qaaGO9P7iIS7G5jOr+FWeX/Y9TfBKkmDwcZlbQ="
									"package file + data":                                       "ILk3kHQb3tl5qlwRvhrsynn/KKv6tocJ3Gv2kb81+Hw="
									"cue export package + 2x package file + data + packageless": "QFi/AoduZP8Q4FrhX9ZjOXMOYOB4hVNMRj3iAtn1A1k="
									"data file inputs":                                          "qLQ1jRKYX025GatDV21rnWPemVLWBJm2fp+PVaHWdNs="
									"data file inputs failure":                                  "9iSFsxyuBQ7pHWx2dCy8qXdqWrSsFRyvDfYbfjdGCRU="
									"constraint file validating data":                           "QkVj7ywhqrPAal+FD4fEkstSpFoZ6da9qq0X1lJVDyA="
									"constraint file exported as data":                          "XT6cBRGmQWxHwEIXoOETrd6uKSdKtyO9en76P0lrrxE="
									"-l static single":                                          "h0dRrGoLfOiDEv4Ot2pUM65hAKTAsAOoVC917mf4tQU="
									"-l static multiple":                                        "AD9tq93Ldwv6GgX3zZo7TfMSSHexWzNLzCSQ1Ycr2cY="
									"-l static multiple files":                                  "tSwiyIjRX/nGo2qTAlCB/j6Su6UJyLhyimKnUz5ZRo4="
									"-l dynamic single":                                         "OGvcjpxKXQKvKLDgz7wlQPcTBJIE56qdyqzgeVGD32o="
									"-l dynamic single with function":                           "xLF7ItThbGz7JX5XDyBZsC5M+zW8gyLUAqnYmpmuzk0="
									"-l dynamic --with-context":                                 "QGH5RKffCievKe2tR6NJNbM3TTujzzxMa62E+DvnWbI="
									"multi-doc merge":                                           "VOLT/9JRc+ldI8Q9RWlxy/Gs0K9H2AwluihlqUQEz1c="
									"multi-doc list":                                            "lv8Ijzk2KL8tmAdcTPEPxfL5NeQsYbAbT8BhLydy4ng="
								}
								upload: {
									"test cue package inputs prose":              "mlzhEMwks6VC4g3ABP2glOFKWIoD3HDw72yB+r1o8Rc="
									"test multiple cue package inputs prose":     "obtUWtRhoFGfGRQpH63UFBQ0tceJlOv25V8VzNlgfeA="
									"test cue package + other input types prose": "SQQQZVE/gQX5Y1NE0XpPolG5ayxLK6S8kY3f8VTVHCg="
									"stdin data":                                 "+mZ/WYC/uaF0uYjjL3SNM6o7MXKTgY3vYNek6QNX6Ko="
								}
								multi_step: {
									hash:       "UGDH94FCJKD02I63MMN3BMJOB5943EM0OKBVK857CVOHEB7DUP20===="
									scriptHash: "TEH5SA1CE9GSFQAUSDJNJFK9VIHQRFJD8JCU1TIP2S51SJ2MI0M0===="
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
										cmd:      "cue export .:A .:B pacakgeB.cue"
										exitCode: 1
										output: """
												could not find file /home/runner/pacakgeB.cue: stat: stat /home/runner/pacakgeB.cue: no such file or directory

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
												# package* input with a <u style='text-decoration-style: dotted;'>constraint file</u> and one or more other input types)."
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
												# positional parameters."
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
