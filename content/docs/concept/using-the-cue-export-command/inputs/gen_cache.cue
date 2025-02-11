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
									"cue export # package x1":                                   "KeRBpVjQz9xLJH/3lEmpp6lXDOAiAniihme+KMIROiU="
									"! cue export # package x2":                                 "Ybmp/4/sScMxczC3D2EHgNscSVUXjR8gAqjlKBWhXHI="
									"cue export . # package x1":                                 "x36khY3kg6boStFbIlotOrfzuU/IYoZmujbpk+U2STU="
									"cue export .:one":                                          "ChJlf3IpRVejEhDOOHidjvOeB6KMdehfCofXYZU89pU="
									"cue export data.yaml":                                      "7mfa6UkYVcHpq6/4uvZaCwR1/L4OsBurpwCB5TmFyb0="
									"cue export yaml: some.yaml.data":                           "wjx8ut5IaxWcchOzY9eReaeIbDWWqFv0bPfoq1VZyPg="
									"cue export .:one .:two .:three":                            "j9z7llYhjCIwuK2YP+ZXHH7tn+XUHsrtDBWcj51e/I4="
									"cue export package + package file + data + packageless":    "RdHwqo3S0B33cCGeFDJeHtCRSmK8nw3p1b9Vx3NXoU0="
									"package file + data":                                       "aLkDLhF2Cssmy4bN0vYieVBADvQ9dPjT8Ftnq9wopQs="
									"cue export package + 2x package file + data + packageless": "t3b+UKJ7eawT7tDn4h5W76Htry3iQnSON/aDuWnKhZ4="
									"data file inputs":                                          "KP0UdIBg/OBJEUXNAx6R9LZcFfXIhKKcppbbATPrt+Y="
									"data file inputs failure":                                  "HhRugO0nydVJaIZ35MUc0VQ/KhStFUMdAu5HTnOZhJk="
									"constraint file validating data":                           "ZvEuzgR/6l/oGr5+eT/e6lIInNrrNnzpIaKTYm5i60o="
									"constraint file exported as data":                          "y94XBNpZ1i5CTmlZSAvJpZwZrhjnA9FU/EGQc86cqVs="
									"-l static single":                                          "3zXfRi31+ejuHtIXCio7Te1pOgTAXUsnAR7+G1gDkT4="
									"-l static multiple":                                        "a64QDn+sbxxn8IkLAePRLuNGEQTCZjhbSVB4A0PkCBg="
									"-l static multiple files":                                  "LeQqDkEswsF6GPRY2HhLQH6ML0blTPpMb5FjmQ5/jlg="
									"-l dynamic single":                                         "ptQ3i6R9Z1TUPUXahZWt6DJbJWB780o2zpEJvLMtJNY="
									"-l dynamic single with function":                           "SmXVPhoZ6N+IFDiJ2BO9tJwlOP7Vz1CEUCG/npiZRw0="
									"-l dynamic --with-context":                                 "nz4SGsm+UGwgpAchg+JogUfOFFwrSCwoDLp5bMvpI0M="
									"multi-doc merge":                                           "Wzh3JVPXrpNRzgsx2GpJbVLbTV4iuTmHTBOWwgaZaXU="
									"multi-doc list":                                            "i6r7WnDDUX/MJVKFM7e2SOZ0ZfcJN8+5xKOVHQcccWU="
								}
								upload: {
									"test cue package inputs prose":              "h7uID3c8x64zj9igERrSO8vdh9mBRpJ4gmtto7PhnQU="
									"test multiple cue package inputs prose":     "QWViKFIFkwOIvKlcKU/Us2AevUiHQtI56KFT6IpGlco="
									"test cue package + other input types prose": "lYOGEItJfVb35tyUvyiovWBU8rsE1aIJAMRsbiCzU00="
									"stdin data":                                 "7e0Eq2BycToYm4QG7a8LcSvFqjOwx/vteyjH+6x9Wwc="
								}
								multi_step: {
									hash:       "M1TUOJISDMVGU7F251SAMQ1FFQ6AJ8QQCT915UPR2US33NK63K0G===="
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
