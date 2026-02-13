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
									"cue export # package x1":                                   "SmO3on1R5Yt1zPw0nxGS6971etxbY+KLtcxwInsKrWY="
									"! cue export # package x2":                                 "kOciShNrt0citcxbkB31Ua+dbZnL1eyZgLz3Fr/C12k="
									"cue export . # package x1":                                 "3sRR9k55U5JPffBQRt/7saO/xNFF2X5H9hKxIEamUdY="
									"cue export .:one":                                          "/bDV3SBBkt9j+DqVmMgWSna7oNxL3i6seRNte500I80="
									"cue export data.yaml":                                      "Aw9an53fu3yAgu5lP92tO5AM7x469XQCaHr69ybeDmk="
									"cue export yaml: some.yaml.data":                           "Av6Ep65C6ixQKMESGLfl/hQrLNMmkZYP2PM+rWpuNgU="
									"cue export .:one .:two .:three":                            "WSIdJNEGePiXvwrCkc0ax7sr3AYc0NUX20LDrDxaI88="
									"cue export package + package file + data + packageless":    "D5YifV26oD91EpNpVZm5i9kPyCu+GunAx4IPIQ8I9g0="
									"package file + data":                                       "QGyJfndu4ZytDrZoyWmASytnotCZyEPVREz8DcKRRmw="
									"cue export package + 2x package file + data + packageless": "t35GbAG1mon/0lkl/0FPAYWrF5oPDGN9fIApls1fT5Q="
									"data file inputs":                                          "WKfYiW5s6qYpqMs0xBeZgWQeeiEqMlvXRlMCTNbpJu4="
									"data file inputs failure":                                  "CG67DjPiRMffsbCrN0iGhz9mKMmY5dqoCkFoaxEc7xw="
									"constraint file validating data":                           "57wgNUQcaKaNvk+3Sw6Fs1AqgCAIO5vIdR/eV1XRmLg="
									"constraint file exported as data":                          "Jpg5jwytyUU6Q5C/NzANv9RCvBJepLagpTTaGOeozig="
									"-l static single":                                          "yj0KcgsOZhO6d8uoz8sY6XyAqxFyxmdwF/sbxTjazBM="
									"-l static multiple":                                        "xiiGvT5qBIQUcg6/sv5n0hIOxuINaOcfn9gOrYTtczo="
									"-l static multiple files":                                  "ETst1mnW7hnoUU9uU3V4tkK8wmorSf2fu+8ZIH6HfF0="
									"-l dynamic single":                                         "vaG+E9K6ziTErPT55sfX4JCX1QyxnReDuhHTG0Ocieg="
									"-l dynamic single with function":                           "kcfJBjSHLroTVp2S3ivF5Ev89SA4Bd3puRlcK/S+R9o="
									"-l dynamic --with-context":                                 "ju+hCKHirY61UW3PAwsr3E4GG4zkvT58oeOYxJ/C954="
									"multi-doc merge":                                           "IkXh+rexcIVxSHGDUJTWNdOM/cl/BMrss9Zp74OxaE0="
									"multi-doc list":                                            "kzBWIKa08OlLHTBXfh6xhMj/w7b6X+DIHPoNJMunzlE="
								}
								upload: {
									"test cue package inputs prose":              "muVroV0yCSnJojDPR3YplLO93hDSDbwQ/NmNYT4hSL4="
									"test multiple cue package inputs prose":     "FlQjJJ+SXziJEACTZTB0DFNHgRJBS0ODd26W1FYJXUU="
									"test cue package + other input types prose": "ogH9fXIchOQVB5/RdW3btXCXdWevlG+9nSf9noYn1vc="
									"stdin data":                                 "xj5MO6Cc1TfKKMVsUN4h62Q63MiUyfqfl15KiF+DNQ0="
								}
								multi_step: {
									hash:       "8KIST8QBQJ1RT5PR10168DNNGJTA9M462JQQBOD215M2ERUDTE00===="
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
												cannot combine scope with file

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
												cannot combine scope with file

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
												cannot combine scope with file

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
