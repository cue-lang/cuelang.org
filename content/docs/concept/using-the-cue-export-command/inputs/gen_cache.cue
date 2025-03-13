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
									"cue export # package x1":                                   "7WZuazGwtzZMU09KRul5L+eW0GQ2DY8ZhhTC87TOiDg="
									"! cue export # package x2":                                 "Gc8EIewrjDNX7nX0Y97kT5frzTkiyBSuiuCBXMiozC4="
									"cue export . # package x1":                                 "Y4NevJ2SU+S2UNacLEWBboEkJWnmezgXG6eWr9eqNM4="
									"cue export .:one":                                          "DQagT1PVQwJ5/eWQEh6Jtjr8yQzEbqqBWR5M183qe7o="
									"cue export data.yaml":                                      "+BgyNaswt2gkpYuvs88wztVmIiYGoFA5irMqDXUHPcQ="
									"cue export yaml: some.yaml.data":                           "Yk+s0l5psjmtTSVut/0hqiuMVT0EJ6CmZMfYEbLTfgo="
									"cue export .:one .:two .:three":                            "weqVUZVsOHlMSPpsS+wX2kGRg02F/aWCgPaEFXHDVuc="
									"cue export package + package file + data + packageless":    "H2ygtn9glhgGg9lEwUokOtSZI9LfMCcsitEVen2scmI="
									"package file + data":                                       "5MDDvy8bSIaS37UFcob/wECjVm0QZjSTGVEflfIT1i8="
									"cue export package + 2x package file + data + packageless": "b7XqNRx+k5K0hpqDm5uL3XYwzrdlG1kARh2okMuaV0o="
									"data file inputs":                                          "XjofF0ylYuqpV0uIpvtcJIYdsgEy5J5CUhal/4C/2s8="
									"data file inputs failure":                                  "sA35j63tyWF9rE4MCoHb046yGAce1O6V/+k5oZ5JFXo="
									"constraint file validating data":                           "X3oru/Me9Q9iVsKVNni8ggCo1cqJFVicqn2toypihOU="
									"constraint file exported as data":                          "tO7m+m+vQz7JZY1VO4K1BPmPHZ1WrPtq1ZdbVZQ0mr4="
									"-l static single":                                          "qrwFWwrTkstTdAnzxTFbLIsfTs8JZG5ff1Rky9BcgmI="
									"-l static multiple":                                        "CIKzT0lQ5XfFNTW1HU+qAmrsZLWTqbHXkK+E+5nv+Io="
									"-l static multiple files":                                  "Hj/K0wynKvEqdi343LBwYhyiJKFhNpZmUafO8eQNX6Q="
									"-l dynamic single":                                         "pjYuL0gl3X48n6uRfWwgBIdwP2DT+GWsutaGiyk3Yio="
									"-l dynamic single with function":                           "LzZnNm65RDKlyrBjlVbWu8HYWf2qXbAL6UTfy1HD2Wo="
									"-l dynamic --with-context":                                 "kHwbpZsnmXENmSigKvqpuFdMfZFP/adELMoXuiMGchc="
									"multi-doc merge":                                           "GSTBRrFEDVXqbq3BC2GSjdMYJADMPJ+BtDo09JTknt8="
									"multi-doc list":                                            "9vcMhiVSVmaxYMwveNc7b6af5hGvaOVwiOl/390Mk4U="
								}
								upload: {
									"test cue package inputs prose":              "f78aDorB0+GM/xyk3V0ZhChRQA/SocAY6k6r43U70og="
									"test multiple cue package inputs prose":     "DG1Dn6dHrR+zCVeUsenjbuvGfAyKuxIbOq7m5f6EaJk="
									"test cue package + other input types prose": "SY5X/M86a419vqvP7BMpaPylzzgrqZv2LgbF4BP9YqA="
									"stdin data":                                 "Iz77M5F8qXVvAAMOQF9FPLgP6M3Wyta8H/DxvK4gdFU="
								}
								multi_step: {
									hash:       "SLFUUQ0QI8EDG4I0E42M32LL1E1MPS8D78S42M3Q0LS3N7F82L30===="
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
