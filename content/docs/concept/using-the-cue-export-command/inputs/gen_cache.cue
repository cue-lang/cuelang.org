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
									"cue export # package x1":                                   "ngbU/bb0sFtcO0aeUAPH2290q6IJ1sVIdH7xK0Etgf0="
									"! cue export # package x2":                                 "KGlkstlMl3hNVkm2x6gyV5QnZJ0EYCIz4xCWObcmE8w="
									"cue export . # package x1":                                 "AfimKjnbG/RKsxK+UpsRXUAjsPQtvaHsAViwry6XyJ4="
									"cue export .:one":                                          "FF7IlCHo+gZmfXizg9ZVUJjAGFppvqW0I7+fJz1bI3o="
									"cue export data.yaml":                                      "LhcPTSYhRSSBpJ9ol2TLWY0xamGk0kx3mniRjeeL+ds="
									"cue export yaml: some.yaml.data":                           "OAXDR9WrCKGJE5fJ4PbE7vy7kOZErnhOxlPyPnvGW1c="
									"cue export .:one .:two .:three":                            "yGP2KsOBgepBLhurf1sXVdg731sC7BB9LV4jXlq1qVA="
									"cue export package + package file + data + packageless":    "tqOkXA+ALjc5o9DogEikdwbjUmIY0K1LypVJDwpB6qg="
									"package file + data":                                       "xZu+6l7Igyhhkx9m/FC7/CTYQZbMjiK+CidqJv07YjM="
									"cue export package + 2x package file + data + packageless": "2u5VmHZ7XqOXa5fC1DSZqI5sB2vIxlajRLhjxJ0jPPg="
									"data file inputs":                                          "Rn6kNo+nsewLYhwjVj2YZHUtDL8equeorGX50K/S7ZU="
									"data file inputs failure":                                  "xWfa++H7O1giBmjaoMvUx0umcpaqeN7X8eJ8JU/CTeI="
									"constraint file validating data":                           "fkolktHUPJ4cj4WyaJEl3WL7dEAkfSt78OPU0feUZDY="
									"constraint file exported as data":                          "BpqEGNYhsKgBAN8pppaxPa8ZPNwV+cu3dw12hU8EZco="
									"-l static single":                                          "ZV3JhiiicZoUST+VfZ9AXpWQ+hERkYRMBU03gDRYj6Q="
									"-l static multiple":                                        "pAMps5wg0jlYsE9CiVezKlJf5lFsm9hf7CVyOC0Lk8I="
									"-l static multiple files":                                  "l9yrp7EYennOmPpwcHiRM5Oqr4KrVPcPVDxM/Y85Beg="
									"-l dynamic single":                                         "DBtXctSMLfP2ScVA4OWVy1DEvFPgRT8qILD/mRSXxQQ="
									"-l dynamic single with function":                           "AEWLNiep95hB+FfYJVHwTyzgv+tLfIX1wxGKr6cWymE="
									"-l dynamic --with-context":                                 "XiO51YiWSgxWP5ZYYEIpK1IZUcEfis39mjQk3vBjupU="
									"multi-doc merge":                                           "sW5STIxCyKLj+2l16m+IIDKy9WMPybgSKdUflbPLfz4="
									"multi-doc list":                                            "38ClLQ6R0n4KjZe8EmEtUx+DB0lavTNCRM0MCZUIj5Y="
								}
								upload: {
									"test cue package inputs prose":              "uTFPgvKaM/TIgk0bFxIlxEaxifaDjnNoP83up4rLwes="
									"test multiple cue package inputs prose":     "6ip7aSrLGPyFnNUzKEU0ALrt9Yx/C650sWz6Tt++1d4="
									"test cue package + other input types prose": "3of5MCTXs5cJktUCO9/y4UetUTR1+fMHOAa0RR3mDFo="
									"stdin data":                                 "WrH+g2nX0T4RKT3atnxDHZiCS8pAjMv+pL/fhDI4oT0="
								}
								multi_step: {
									hash:       "IRPMHQCM78902M0NJC5OF1AQHB799K7MJ83MKSRFRKJKBCUB3RJ0===="
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
