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
									"cue export # package x1":                                   "6LPTwIBw3K1CVBYHCKp2woYi4cegFoAk2HIHCl8Xzso="
									"! cue export # package x2":                                 "wUlPQrYJVHOHDzCbYNXoh4tCpiEvsGevWCZ8mecWxCE="
									"cue export . # package x1":                                 "rm5QLfEYxljukoLb8bWUr66aXDc5fxwimn7X6zN7YC0="
									"cue export .:one":                                          "Ll5n4GKW1i+vub2h3V2DJvtR9g1Ieyu+oYfYdFpPSic="
									"cue export data.yaml":                                      "/V+s7FVrvNpbpUbbxyMYxEUouhA3PAqhtAgap5QAx1k="
									"cue export yaml: some.yaml.data":                           "nYT41vKlXUV9nmLnp1LP9gb/n4PsoT2mW8dYY7VsI3k="
									"cue export .:one .:two .:three":                            "M3eWRjSmw4BtDyEcx8B7LzemiuMznWtCI+9NKcqLRdk="
									"cue export package + package file + data + packageless":    "Yy7d3EU8gDTCdg8m3GluZIjWo/BvIz2yoTXSu3e1kT4="
									"package file + data":                                       "yZfft2eXlcTarF+2cIehpeI3ehixcjP0Apm+4a2ZG4s="
									"cue export package + 2x package file + data + packageless": "R9GgD7wGFxHoXp/rUXw7W1t8gwKYrJZhxQKh1QOJhqU="
									"data file inputs":                                          "nWj9g5xjFULjLSMlj8KZMsz+5c+RwoAmL5PF5P85Jdk="
									"data file inputs failure":                                  "r0vpg2b6V66mEGo3OFesf9inJ60q79BbPWPnQZOIBVQ="
									"constraint file validating data":                           "C/8zN+I68gUBACb5sekTeIHehVdIjDVZusiHPNToqDQ="
									"constraint file exported as data":                          "OFdooFP6EPeM6+uM7poElSVRMduU5pAcIGKqbKZ+WPg="
									"-l static single":                                          "su/Gu0rnQ8DZIv+whfyvBBjBkZDl0KjWb7lbYyCBk4g="
									"-l static multiple":                                        "Ivix3mUtxoVU38T++IslxDUESpx9HPyWoohh5LNi08w="
									"-l static multiple files":                                  "URlYbdBgM38jVPCmogyAkvN0yMB+vgx+5ZkAhxtKXVE="
									"-l dynamic single":                                         "xgyb2mBAonvk7MWm0pAG6vdurDloj49w74bZYew2INM="
									"-l dynamic single with function":                           "hIvyHpt4hm43cpda8MoYSLLkLZax+5inJhSwZ2iHVvI="
									"-l dynamic --with-context":                                 "fYkQsnvcT0JKNf/Ab9EMe099iA4SJZ8//9HU+EexyiU="
									"multi-doc merge":                                           "tj+1W55FIIsm8fvXvOtqaJu04KmqhxKXDVGtfoso4E0="
									"multi-doc list":                                            "niIVQJm4s2M5D8CeqwdjNGP3fFVDLAMbgtPEEGwnuKA="
								}
								upload: {
									"test cue package inputs prose":              "FwVR8PsPO6m0eoC9Tbf6gjw8p8cv6ClXs7fmvJqmuaE="
									"test multiple cue package inputs prose":     "/tW09VYoGKYEnG5ebKoXtrQOsv+11klR3oIwttVJLCQ="
									"test cue package + other input types prose": "Y6VE2f840TJ8MxFidDQa9anFxvZ5AAVv6J1yFs8spjI="
									"stdin data":                                 "tSxGwkXW7Cr4yzbzae2l7aGlkW5r1gy8Ni56uy0MHo4="
								}
								multi_step: {
									hash:       "UA8CHH05UGG5244TIJM018VIS35HI0RFH2JDKH44NUB9JNL65JA0===="
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
