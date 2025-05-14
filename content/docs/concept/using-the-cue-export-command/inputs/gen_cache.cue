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
									"cue export # package x1":                                   "bgxOIqsjVGiN/Nfb22dZHZQYaLDEtQpC6eJtE2/HTwM="
									"! cue export # package x2":                                 "TEgi7HbsoGfIONIk/KB2PWznip72WZV6c53XZEJSxL8="
									"cue export . # package x1":                                 "WA9SC/ZsneUnhXIk1PradDZ1tFEJ0QngOteHE1jue3k="
									"cue export .:one":                                          "CV6s0iTLQ3X/FXrd6QBfVXFvoEPwx0xJWwS1bG+hQVM="
									"cue export data.yaml":                                      "R0L2QybXOpt1XToE4w4WvZsz/vkvWVFpFefu8fKYPaQ="
									"cue export yaml: some.yaml.data":                           "BJx2XN5hc2nzCgGqUk8n2o4ZB9fnBkN+Q7tk3Di97Rg="
									"cue export .:one .:two .:three":                            "NLqlFwrUwA62k+hH4DD+CrAvxNdB2sXY/1NvNb/rY/c="
									"cue export package + package file + data + packageless":    "DIw4ywiiKihpbwdKHAEYd4P9pM6pfSvz9X0ESnS9k/8="
									"package file + data":                                       "PsgrID13IioABHTtpIYFUAp+YnJFydXcI19A5vRdhQo="
									"cue export package + 2x package file + data + packageless": "ptyDhnDwxpAenZ7NOCcmbFGx2JnoegDSXPevtRniWaA="
									"data file inputs":                                          "Kg9x9m4qmjUq4TAHFpRLUmZFcf7aao4GYmE0qIlFBKg="
									"data file inputs failure":                                  "+1jue9EoLI+6XREazQhZg8VPU5vFdiXLoAU/X0xpJgM="
									"constraint file validating data":                           "NZAINurRjzVPjV3D9cWg6uyqORZESUjsNB5CMolvQaA="
									"constraint file exported as data":                          "Sz8CLGZuFqwf2sv+639AA+MhV+y86lkUwbjrCyvGLqo="
									"-l static single":                                          "vRKWpB0GyMeeNvR7JGfJfM8jnwfSFKLrIxErzcLJJm8="
									"-l static multiple":                                        "EfF+K1oLKjqM/R1YOXVNsyxuQyFuMEzYTjk/+Kfflmc="
									"-l static multiple files":                                  "n6QM1JsqFic2vpquYXreA+pPOnnyl2i3LqU6uEjbAO4="
									"-l dynamic single":                                         "nj3aqHPwZHozWQgxvGoW+ONr9TUjLIi0nkq/LBZbInk="
									"-l dynamic single with function":                           "QdgZb/3zVNwxTJxDmzxbSeMXiQ/1UA3fEPtoHkLSN1w="
									"-l dynamic --with-context":                                 "V9c8+q+hI2CVB5s0iwKMYR5qqY/5wbed40olRsxhFKA="
									"multi-doc merge":                                           "PF6qtWF+2LikV/317FLKvs4gHJUFfTgfuibxyBydDIE="
									"multi-doc list":                                            "QFm1QR1VsvLd2o1Rp/OcdPFhBaUcVsq3+pB0gKRVdt4="
								}
								upload: {
									"test cue package inputs prose":              "w1uWYONoLCaf6XkP3R/vAvirzGlweHwICcRe9ozLe2A="
									"test multiple cue package inputs prose":     "5ddsJFUAgrxk96pzQHIDS9CiarJU5F4uBGKIbF+gAJQ="
									"test cue package + other input types prose": "GteFckdIBLRxiAGJcvWaG4RVYSEqVRFU2BXYL9OeSXQ="
									"stdin data":                                 "xvcywa0pg1cgFjbsZJB58DE235/zSWM+cMJcxk13K64="
								}
								multi_step: {
									hash:       "STJU271UP635I01T50V8P35FK671ANN6DET3K8JMH6DH4266NCGG===="
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
