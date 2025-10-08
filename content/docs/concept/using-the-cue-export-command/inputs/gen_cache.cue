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
									"cue export # package x1":                                   "Ns7BKweyaUpPI1BUisnlnK4m4Bed/FQQfELfiixd1NE="
									"! cue export # package x2":                                 "JqjlP4S2ZKwc/tN8imi94Jhv3fBdhCD1szFmY2MG8tw="
									"cue export . # package x1":                                 "QCIzQC9pkg8GyENxFRB8Hd5IkiqfIoO48AT/1QADp80="
									"cue export .:one":                                          "nMdsTysYPe2Zx+E2aaIb8OGwhe6M+s21hmfzMcePpXk="
									"cue export data.yaml":                                      "IlXT8KnrVLV4ddv/FZALiaskxf1DnGQRG58MSJ8c+80="
									"cue export yaml: some.yaml.data":                           "C4Llo8Wlf/6kPUutBtYVT0nhVSGGLCl/FFvN9M3/ubY="
									"cue export .:one .:two .:three":                            "lNakQ/CYRHZcC9NToHiJ50/k1TcrZ1zgSnAw4bdTmwc="
									"cue export package + package file + data + packageless":    "ofJ7tdEEFI0a0Oa0bfXXGbBZDoP0vhCAj/ZUVrm3zq8="
									"package file + data":                                       "pjHDrYh4dtcVnCGgdDOuYeb+W2z0zIqK7qSFY1mxGTs="
									"cue export package + 2x package file + data + packageless": "4yMKmbABhCG4ls7IU8ZLCzwjcpjyaF6hsoFV/nMY3iw="
									"data file inputs":                                          "0zJOLXm7qt3R7f6WKGvtSBuBt86N1iKJ6YE5svi2Xp4="
									"data file inputs failure":                                  "0U3Wwjsm9JWMZNQNemudAPY6DG9ZZhEwjnI7++umDb4="
									"constraint file validating data":                           "PUvNE9m/xbZLJL3RhJTbCjZ+nbKlZSvpI+dJB/1sFrs="
									"constraint file exported as data":                          "YwqISeuCzIr5WRz8Lb7JQ2DljGE0iGqanIyTBcEqgAk="
									"-l static single":                                          "VULRlOEYNIaaJ+7ory9V92JtMeUdIKe8a0FD9e+SPww="
									"-l static multiple":                                        "uLiOq1Oq92kC5Kc3xSvneNC2ON9hlprNPMctj3CZvUs="
									"-l static multiple files":                                  "qLLeo2OP6Qv1iaaz69VFi8E8Vw6JGDGrprwRw/vQRJg="
									"-l dynamic single":                                         "mfKRqXc/LEtqi1a+oi5fixe+uTXeYfzULFLR248OiTo="
									"-l dynamic single with function":                           "epJ4HXYm2NkwTrZnBdLbc7dbLGkkDIP/eA87PwkcJiM="
									"-l dynamic --with-context":                                 "XZn2n4eg9uk+cBiGPWcRbxXI/1w4/qisT6P+ljeWVBo="
									"multi-doc merge":                                           "IXQY3KTULR7nzV9KwXUwfFrTMoOBIktH4aXfJaaopkA="
									"multi-doc list":                                            "Q2O9Dy05l+NH5EE5im8h9DdiUrpZLilhFAj4O/nUZMU="
								}
								upload: {
									"test cue package inputs prose":              "SNc4LCY89ZrHwgj46AJfHxXXqbSRRWCbcQva30Iddks="
									"test multiple cue package inputs prose":     "pDaleFcgK9qEDfydSTpAn//ds//kl8Yv/DB9i9tTyd0="
									"test cue package + other input types prose": "cAqKZrQEBEMDjy3hedM9HHMENzymlAd51O7dRDLeTiM="
									"stdin data":                                 "TpDLd9WdRRZqlqSTLafv/btOwb9KZ8fZhjcp6yCzNcU="
								}
								multi_step: {
									hash:       "VI9FNLOC7K533751SKUB7IQAFJFVLBKOVTOEL81NKIFFMB26204G===="
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
