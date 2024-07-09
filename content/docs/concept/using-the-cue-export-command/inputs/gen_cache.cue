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
								}
								upload: {
									"test cue package inputs prose":              "mlzhEMwks6VC4g3ABP2glOFKWIoD3HDw72yB+r1o8Rc="
									"test multiple cue package inputs prose":     "obtUWtRhoFGfGRQpH63UFBQ0tceJlOv25V8VzNlgfeA="
									"test cue package + other input types prose": "SQQQZVE/gQX5Y1NE0XpPolG5ayxLK6S8kY3f8VTVHCg="
								}
								multi_step: {
									hash:       "B3OD7S725ICP34ET3TTKPQMGMBNR92KVOCLOGBPE8SAI1AL5AD10===="
									scriptHash: "NI532LFOPOKCV8NJAUHIP79RIRAP13DABFJMPV9K6HD0J6A659VG===="
									steps: [{
										doc:      "# \"A *CUE package* input can either be combined with other *CUE package* inputs,\""
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
												# "A *CUE package* input cannot be combined with other *CUE package* inputs
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
												# "When multiple *CUE package* inputs are specified then the resulting CUE
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
												# "Multiple *CUE package* inputs
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
												# package* input with a *constraint file* and one or more other input types)."
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
												# "The *CUE package* input must be the first input specified in the list of
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
												# "If *CUE package file* inputs are present then their package clauses need to be
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
												# "but don't need to match the name of any *CUE package*
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
