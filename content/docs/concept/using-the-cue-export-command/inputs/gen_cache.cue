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
									"cue export # package x1":                                   "jv9mzYdYfOBpMTCn4Owds1ZWVCN9Snu9JRouGY+8Ld8="
									"! cue export # package x2":                                 "mq6SumVB70zTqW7TVLvhbHfjqakiXKC1YzSsbQNFJvk="
									"cue export . # package x1":                                 "9X1CLwXOHEDA2dXZDFKn44zrderxziykzctL3+FdsTQ="
									"cue export .:one":                                          "GNa7GmU4ZQEbxb0hLghE7QSQ0J/dNYRCDTQhkRrsWfg="
									"cue export data.yaml":                                      "vp6tH5CIUyICYA6hP9xvBMnvbwifJnvaWnqxzpVnOso="
									"cue export yaml: some.yaml.data":                           "IhrjJvdmhBOwDN8HsU5WQy6G7rWQZctHSUwIIpUBY2k="
									"cue export .:one .:two .:three":                            "tWJIS3sObnRc9eX3T2C/q48WyUjaK791OQ2B5QjvkVk="
									"cue export package + package file + data + packageless":    "b68j32BuaZpcj2NRvQcerj6ignpWvCa1FkIJAnjdsn8="
									"package file + data":                                       "D0QioZd8++XtX6slChVRB0FngXE27aIAt8ul51B05B8="
									"cue export package + 2x package file + data + packageless": "XBEOsP5pVRXJmP+8vkNhbh6RhWjTYHIn5gdH/38Hz1I="
									"data file inputs":                                          "jA8lYoGGtbPPQczJWkvvZEwsURkfnDl+QjHCuq60T0M="
									"data file inputs failure":                                  "XEqwyjAhdtACK+/a8JWtDVg7HCAD6aaI3izmrrnqk5E="
									"constraint file validating data":                           "W7sEeYDbrPosWqR/la/EQCFTBf+rT2bIGp0DwbO780s="
									"constraint file exported as data":                          "XG5B+y1t5vriDhmzHEmtBSksAg+GVVLiMr7qTdP7+aw="
									"-l static single":                                          "WZULYjP8KXwFzDbgaVKq8UC8vFSW8l2avjvZ+beKf3M="
									"-l static multiple":                                        "e3a0oaZZ9ze0tIvYGd+CMd4D/F0lYFHbrrbM7c5E2NQ="
									"-l static multiple files":                                  "upuelJLxskD44c5ePKzpvSyZN/tO/1Tm4TINNKV3zQU="
									"-l dynamic single":                                         "Eh35v+638HyhL26nR+NAJ20aOf6lN3g2r1ukz46Apss="
									"-l dynamic single with function":                           "GB1jxumQWusFA1zkGWAw+/aOplbDgVrh7iIAMUbP5MY="
									"-l dynamic --with-context":                                 "6Wwc5QH7IAzsyQE8lbc5VWPHnWUfFjunqnHa6ooNWf0="
									"multi-doc merge":                                           "wD/I5zzdgP6P4vIsZ21ePfJDTGdF5wz0K4aSjipYoyE="
									"multi-doc list":                                            "3A/eA6zcXHPowhlEgxzrRrs6WQ86u3Qk6Z9wqEnonK0="
								}
								upload: {
									"test cue package inputs prose":              "q64tQlwTTvfPJfJEZcMmXFJoPSCcbeqWhTNHG42zyKo="
									"test multiple cue package inputs prose":     "Y4A+8gP7/8e1fS9VCSYoG99nLg/a0ALHM8soYuL5faQ="
									"test cue package + other input types prose": "c8BQB72ih8tixTZZPM+jB8hPzPqwlk9+rsPiSAcMs8g="
									"stdin data":                                 "Uv6UkDUF6Hvcv34QtWKucvqAOQqyf0imgseyuB89Ksg="
								}
								multi_step: {
									hash:       "J4CGKR22D1FVS7QU9LKK153LS4CRNPFQIA5QBIORO3MIMS0NK34G===="
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
