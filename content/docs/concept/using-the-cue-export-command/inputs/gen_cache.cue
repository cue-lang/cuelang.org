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
									"cue export # package x1":                                   "YOz2uqXdr7BI1SnS2JJ0EJTYBJJRhxhLBw7pW5pLM2U="
									"! cue export # package x2":                                 "p+ZRvkkyTJY6fyAQRdomg1dzmjkizFb8PPMwpBwIRgE="
									"cue export . # package x1":                                 "VQJKIq6paV+9dKZQBByCMlijgr8uuawe/CLgtFnUcvM="
									"cue export .:one":                                          "VMhl3M1OngApOPgi73bftmNS6cAJv1elY2XdRpkFmd4="
									"cue export data.yaml":                                      "rRofxxFQc3uIwdlYvHGc5b2DwZ5bd+sKEa1a/xQvVGM="
									"cue export yaml: some.yaml.data":                           "euJsUmCDZ0gHF9L2k6GjjsPH1mjBkah6ovQ+rjz8ufE="
									"cue export .:one .:two .:three":                            "KyRskOjslelWCwldDnKtG6juX5Xo7gMq+RJvHuoYYPQ="
									"cue export package + package file + data + packageless":    "j3SVLGZa+FhBRyH6fwXVrR+scfOOgPwCbCjoM9vWvkw="
									"package file + data":                                       "ar/8NOxTtpukLzVA4fFvUTF7yMyOQWcnTmlGAuzL9Ag="
									"cue export package + 2x package file + data + packageless": "vPkyEBfMGYChWr+Dy545KA7JKQAyxtx2ghKYA3GbGfY="
									"data file inputs":                                          "G9TvgKUspyKCOc/E4iGErgOToTv7ROTHVVDGyqfzVhs="
									"data file inputs failure":                                  "d1mKEKS9o/ogoZdolGOroLc5JmqQdkwTuy96HnOZgMI="
									"constraint file validating data":                           "b4ilbnId4+ySILq7DpJIR+7EB484NcPdhVCX9fcDqmY="
									"constraint file exported as data":                          "c8hJE5xP4QdZkiI+oxL+xDuSaI9kuH0enoajGUSuwFI="
									"-l static single":                                          "S062Bm4Tt/hZzSLnp0Pjf1LKf2fa5nSWj3QC8HxAEMM="
									"-l static multiple":                                        "/em8NULsI/ccJWMZtWuM45jO3YiDk1j9fSo13VWL5p8="
									"-l static multiple files":                                  "aCeaqPnDQyIoQdBoQUBLSCrrOLZ2Xya0FxJPgT/DFlo="
									"-l dynamic single":                                         "QflznNm0H5wcY5mD1SMMPpwuWVzA0uCZNMTDjp9q4OU="
									"-l dynamic single with function":                           "ABL8WC2NfBxLVd9jUdJoNVKs6geVbJ0nTcsYa8PqPK4="
									"-l dynamic --with-context":                                 "tR252trnIKw4CDGhBuwXGWzF0PK+4sNuHka++Un3Kl0="
									"multi-doc merge":                                           "PUrH/P05rR4t6JkEwqG+qJoD0NQeob+BxHGfPyA8qB8="
									"multi-doc list":                                            "0Z++DUrjIX8t1m2PZsqzwV+6eVEcltoENsQ059OEt8g="
								}
								upload: {
									"test cue package inputs prose":              "JO9WMbnhoK4vGut0uQDvWwp9wa9k4QQVYZOkEeOvgcs="
									"test multiple cue package inputs prose":     "+hiYYl7wOsyzbuCKuRv+M3ocsuKQlLpTjVTELjgbsd4="
									"test cue package + other input types prose": "XvU26mueEStm8pkCOvBCWtfp2gXyosESAndZYfGWJRg="
									"stdin data":                                 "f86EiCI5xcLEroqeZqcFCXY5cFtZLeu1b/2/HPR/0Xo="
								}
								multi_step: {
									hash:       "IS8C7P3JFOPGBCVQCE8JF0CB9LPUQ3J4VL8F5BSLJ5LKITEMF03G===="
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
