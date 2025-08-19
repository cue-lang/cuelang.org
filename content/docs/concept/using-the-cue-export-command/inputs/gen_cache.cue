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
									"cue export # package x1":                                   "v/xecrAqlc70VfzYjNybs+lfHiCxZweQRzPDEpt5PL0="
									"! cue export # package x2":                                 "RiOjRPrJWbVZm06pASuw8ab+/qhnzuHynKP55JmV510="
									"cue export . # package x1":                                 "TmEOtetj1XNG91TG6CtMlsXrpGq6HlsVBiWigC0KBX0="
									"cue export .:one":                                          "iHuE/wd+8/gfuElZa5bJ0uMBihC+m6uOy1wAkG/L290="
									"cue export data.yaml":                                      "OOyQpn+FZID3FdjlPojJ9emWZWNszuU4fuqc04NVq2A="
									"cue export yaml: some.yaml.data":                           "/m590Wu1SNcaGwZXVqGpWvrZsIMIs2tiabMSeSwcX4o="
									"cue export .:one .:two .:three":                            "OwWgkfnr6xhmP/cxFbZ+sMjY3aT3Ugm4kncsSnPTL54="
									"cue export package + package file + data + packageless":    "cAmB9+5DfyqmiM/zr5O8huIUCAdixuJN6NT1sMwmbAs="
									"package file + data":                                       "fFidU3TNwXFXlZaBVrLBf4fflxT0A9eK+Hyl83KJ3Ug="
									"cue export package + 2x package file + data + packageless": "5UR2vJYzjBQ/ZNLeN9S3S/aToSKBQmC8DhIi6V3eZxk="
									"data file inputs":                                          "MCEZGZDKRGR5EnpId/BIlr7YwcSG/S5fO6q4ysELc/0="
									"data file inputs failure":                                  "/pKzDrjYDbqxPQguJUor/3Vfr2436AIPua3onf/RGjc="
									"constraint file validating data":                           "60qDNZUvt+wxrXHnECobuWT16vopfcYl2t7jxVq0Wno="
									"constraint file exported as data":                          "Lwehjc0kWOXlB5PYIYqfZkRNPlDP60Z9p8QkGPxv8G4="
									"-l static single":                                          "WLn+i+NMUT6+1p/XL5xgdG0WHH2Osw0RFQU3VecYf2A="
									"-l static multiple":                                        "0RNDSOcJlLuxYqh/+kuf/PETt6WG96Vrry7ByUXumXM="
									"-l static multiple files":                                  "AwNZlom+nA6UQi3+c3DuCUedFUjFcV72Mj0yG3IUwvY="
									"-l dynamic single":                                         "1maqhTe/MYiXvNCqwCtw6QWx1KyR6UekuIZZJxWZCdI="
									"-l dynamic single with function":                           "ONcv1Kh8ZZ4Vqu3mn7bTWfruoMhsjmz2jOE5vTeiCRY="
									"-l dynamic --with-context":                                 "Z+C0e2CN6RmdRKdr/jr02CDgFg+TIbb2at+m+xVtYEE="
									"multi-doc merge":                                           "g29rYiAJ5qxmYEXasquF5MGx8P8KxmfWadubHFhi8Xg="
									"multi-doc list":                                            "D88GyT1maLmTqlOupSbUnG5uijIAPKUvnPty/4eOx6A="
								}
								upload: {
									"test cue package inputs prose":              "lemwzyMGXmZ1aiPWLxX1wIjeOXjGuAxO9rub5myav7c="
									"test multiple cue package inputs prose":     "dP+QiMbh4rfd2rI8bUkttLGodnmkNvpJpF+MWmHN6co="
									"test cue package + other input types prose": "+ZeWTwS3vOGxRsi+igpoj5izyhMd6ekfpMx0Np/lDAU="
									"stdin data":                                 "Gk0V+JiqFCWcuaisvOi+/u3oFddNuIMOX3t4j25ZilE="
								}
								multi_step: {
									hash:       "I9EQISVGIOP298NBQ9PPNJ58VF25TV03VBQ0P5V5MRGLNFOT8T00===="
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
