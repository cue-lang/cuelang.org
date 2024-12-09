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
									"cue export # package x1":                                   "yPz2YHttdA8WnUAYE/SQhyyxUOa4cr8TCIE35ICt5HQ="
									"! cue export # package x2":                                 "FMdsnlwr7DHyI/jTXCoBvoSZlKR4w27UtxofdrGxJpo="
									"cue export . # package x1":                                 "m8u8kGWQ0Qn7MeeZ/mMzo+dpH6fW/lN6iWU5PqL5MZQ="
									"cue export .:one":                                          "iL8rzaMKiRSGRn6VxZ6uKEXIbIGHhp5MxPl5cIRAnh0="
									"cue export data.yaml":                                      "Uf8jI2WhCRdjT4WpYlQsnW2Kg+gkYc1tSVG3sN6N/mA="
									"cue export yaml: some.yaml.data":                           "1JawtnH23tj7eE0REwoCeC6jVxUfJ4JSbY1V5YbShp4="
									"cue export .:one .:two .:three":                            "EvkUxCkQk680g1rDTuFH1DT+Zq8mgpPrYZgT4sgpG2s="
									"cue export package + package file + data + packageless":    "DqZeJiKw/6lZ9XC0Lg+5tgJeOWv6kdhS0OisyqoBSRg="
									"package file + data":                                       "neq5rsCcC75rVIJAx6HeUvHZOITHJMa8JlFGlsmKIFk="
									"cue export package + 2x package file + data + packageless": "Dgj50vGmXuySDFwVRnGgbgfGxbAgYGJv9o0TwCyu/IA="
									"data file inputs":                                          "/7yL8lCH4QI0U8nnjWDOTdAq0CFC4lmVd4mYy4nyitQ="
									"data file inputs failure":                                  "J8eCt2vKoY3l/d8ONUbv5673mt2Ik6x51XW8s7MQvP8="
									"constraint file validating data":                           "2YNyoUcb3m/JvVRVnXCwUxheJCGkvyjm7lmehnIT8PI="
									"constraint file exported as data":                          "haO02o/8KD7TEQDPZWvBBttIpazHwfmuUIYWhfpCfkU="
									"-l static single":                                          "MYMtqL4QkcraQNs9Pho4HFO24ZIic9nVgl1ADrgUrQQ="
									"-l static multiple":                                        "nnUmgvp+Y0woY+UbGAfoLuY7X0G/XyoynWTi8ZWqZEk="
									"-l static multiple files":                                  "tnP+ZNPPFZrPzMaDzJq7+JFsqGpnEU9t2l5ksIdHvak="
									"-l dynamic single":                                         "gbzRsEgQZ9rUkiR86znn4kD/qpnOUho+4+iFkhTMS74="
									"-l dynamic single with function":                           "Lh/ktN0MamQBQxddMcnFHJNY19qy8DHaBx6HU7YEXAY="
									"-l dynamic --with-context":                                 "/TglEVx0WVNhXtblefj+j07PIm62EpAQwNX9fEUezZ8="
									"multi-doc merge":                                           "JV3cZ23jUJpILhi7hNipbsRy94jb5u/fbSoWz7b0m40="
									"multi-doc list":                                            "4JlcLSiBNglWs+izjCzKAQuw+d6mouWMq2qEZ3iKezA="
								}
								upload: {
									"test cue package inputs prose":              "cmmZrG/O/udM+TReuOLkWh7tusZbOLSVF8tkwjNuOj4="
									"test multiple cue package inputs prose":     "bLiypas3r5mKmbjvBF4Ub8qsL9Lb2jU8zKPq1LnjsMY="
									"test cue package + other input types prose": "7DPhUJb4ZcoQypD9KKwm+3j4xF2lg8qqyKSsaJEPm84="
									"stdin data":                                 "wfYYt8204ruUyKyu62n/5CiLCWa7BOBI8fmFNMShO0o="
								}
								multi_step: {
									hash:       "J7FK379SI8UCU60B6G4V5HFLTOQ7P4R4RFMM8GLCN97V7E8MF2NG===="
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
