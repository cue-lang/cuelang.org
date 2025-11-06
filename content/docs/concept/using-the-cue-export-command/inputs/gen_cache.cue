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
									"cue export # package x1":                                   "Y2bUDHX6X9HxZGJZii6U+Ockqh7nL0q0dIHoVafYe88="
									"! cue export # package x2":                                 "OlG/T5c0bIDeXwf2RyGbFTkQoarMWucjbkfCqWM5CdI="
									"cue export . # package x1":                                 "FB3tyIWGADYfoNYm8iZlU1u6Vqahjt3MlGSdSefcxpM="
									"cue export .:one":                                          "xCQq3PEjF1SJMHzb3ezA2uxphL/AJmunYRC/OgEK9QU="
									"cue export data.yaml":                                      "9WkBVu2UMzDGnHojVrFRqwQqvALLAEDL1A/PEa5sx9A="
									"cue export yaml: some.yaml.data":                           "Yqp5SLVXpwm21REoxAo/0KhwUuLPUUUSptASAVbplgI="
									"cue export .:one .:two .:three":                            "nIPFqWLUWK5X18tE5nIbO4r+DkmhlgseGdIVhcIIbwk="
									"cue export package + package file + data + packageless":    "LNVVUZ4RvBSDuvMNGPwPwM0kPQnSBgp00NxbJpr+1fU="
									"package file + data":                                       "5YipMqokieTOty8sdmyiW/6NWR1Q77KJt2bhyxS6/Uk="
									"cue export package + 2x package file + data + packageless": "0UhDdWmvImGBDOTPmHG+ugDuTo6X9kXOtL4ggG5D/xU="
									"data file inputs":                                          "Zp9ryOJMLnfVcrvPPUulK6UgN04DcQFYLDWt7iNo24w="
									"data file inputs failure":                                  "eZE1wYLuRI/OMv1nsTOaVPp/tC/dLO6mprLNAXOhvdw="
									"constraint file validating data":                           "JweemiJ92nJtWueltDdy20AGGXRM31L0ClOiuKTv5FU="
									"constraint file exported as data":                          "SWyOVEQ71qwK9KEO8n0M9C2K/Bivi7M8bz/VbUMUMlE="
									"-l static single":                                          "GUzZQuiDwgWuOtrxjbRqx9Jxr+siwse/tdoCZQGNP60="
									"-l static multiple":                                        "1q8gwd5B2DcPH9t0Qgj/4SmOZnd1OB+WwVw8BL3jhnQ="
									"-l static multiple files":                                  "qxaSpPeQ01VyT2E+OJm+5UuDhakMttsR/YF3VcbUTCs="
									"-l dynamic single":                                         "Wh7Sg7cWcehHja1OhQSw3Q10ZswbC0TNMbUEMRxJ30g="
									"-l dynamic single with function":                           "i1MqwyNSNmhIvLA+xw8xRoUwbQuK62A0XDGc1pVtrek="
									"-l dynamic --with-context":                                 "RspGz2Z+wy9PK6bbv8mwHqQMT6vQk/Vr45keyOaUOHA="
									"multi-doc merge":                                           "JN6RktmWu9hbOsn5JFEdcAeoIk/kGhiUFGrLOqKDHgc="
									"multi-doc list":                                            "s4orrw2tyofbD12hu0oNjQrpHlDbtx3TECm4LNwCwmc="
								}
								upload: {
									"test cue package inputs prose":              "e2EEeIy8MEyiw6nE1kNgVYDjb4FJyfqBKqQwab3sc/E="
									"test multiple cue package inputs prose":     "S3apMBF0Dyjum4ATXwb21lU+uF9xlPzEz8oIuGBjF7E="
									"test cue package + other input types prose": "HYYqC097f+Cag9E+yW+oPkUpgaRlaqj60eJK8rKaoQs="
									"stdin data":                                 "3N0ELgj1kUAQZG3nwAZxPC1KUevvehG/p0r3uvwArr8="
								}
								multi_step: {
									hash:       "2FJ83CPS9P5LL28IE0U9RHGMI15QDPU07MODJAFII537QM0MDMSG===="
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
