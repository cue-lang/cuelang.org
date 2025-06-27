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
									"cue export # package x1":                                   "6bIbIgytP1vjJNy/JRu1EAoB+pLWF5hDYnZ5a7RGras="
									"! cue export # package x2":                                 "WXpPvUzcuWeMmYEMIOdand4m67471gKlZWujYh+Yb5Q="
									"cue export . # package x1":                                 "G1AGDFpK79u5XU9wZJo2F3+5VxQ1EU4G2L13TrSy7UQ="
									"cue export .:one":                                          "n98CoJobTpYJbD6Q0pLvbRyuzhlbmmLrHH6DRz+Nkqw="
									"cue export data.yaml":                                      "v0O9gY1kCbNnKp8polaSbah0ip6BH/bDMU/K8tdNl/s="
									"cue export yaml: some.yaml.data":                           "wo97buGWYiIX+rtLqwwIYV5ai/HtihWrXO82A5pW5vc="
									"cue export .:one .:two .:three":                            "gNq4TinuvKqmYfT1qbYa/s0eaWdigbppQ/2tQnwmHX0="
									"cue export package + package file + data + packageless":    "HpCcbdUlHYOwOghKDDNdlu5i6wqE80bbqF498Qp1QGU="
									"package file + data":                                       "82RJA95ls8d1pmhfJmXnxq/g2ElcFo6HQNV1UEXOOa8="
									"cue export package + 2x package file + data + packageless": "B7vY6XbiWgA0zFHsOrI5mNU/GGd4R0p1bNBQovCXpb0="
									"data file inputs":                                          "mgyu+Kc82c8wF86HYIpP7l4nruN/QQpnkBZvPwwnIpk="
									"data file inputs failure":                                  "eR32xkipM12VUBCW2wMPyftadACTEmJiFb+L1QmY7hA="
									"constraint file validating data":                           "1f9v8dKB5rAy2KZe8y3ZK/Ed1OkHOIAMXF0ypPQ2LE8="
									"constraint file exported as data":                          "jiVFY9wFDNgc3zY2511dL/R8IU4+4euA10omPpzXD5o="
									"-l static single":                                          "TUOkiifNftYnHyNabtJcAibQAb1MFdWJ47AgpIIiOUM="
									"-l static multiple":                                        "yy+mliW2zbl4fmAhc5izlEuf0hL7FPHER7IzKtQxsYs="
									"-l static multiple files":                                  "lR1rGw2NhpGxScRdkjxvIsLfFcuYWENLi4cpKEWU0Kc="
									"-l dynamic single":                                         "mR5mr0M2o3D0USwkZnXh6MOCUa/zMSlYrTBb3I1saaE="
									"-l dynamic single with function":                           "CIgzCeU/A0P7hbco63zzn8Ums5YYziylllQdb33RSgw="
									"-l dynamic --with-context":                                 "tl0hIu2+o3WE4sPK8EyE5dKFakDCuro9xPrWG35lEcs="
									"multi-doc merge":                                           "AAA9RYS2UbWpYZhcDuXUiNjI0nQar5BHwXNKqlBlxVc="
									"multi-doc list":                                            "GgmH/k1oVXd+8xlV9QZHsngKCMKlSOl1m1AbLfAnHwI="
								}
								upload: {
									"test cue package inputs prose":              "L7Wnho0ugj871gE8NBkHzQadh9/RItxRcDLUs1bqiXw="
									"test multiple cue package inputs prose":     "PATCkAEEJMkx2vgWmbPBQ961mJLw3kv9kDZ06kNtxFg="
									"test cue package + other input types prose": "W3q1HrMWekAcGAMcAh0xk3T2gfjJ8YSozgHwMvunt1g="
									"stdin data":                                 "D0Bl/PpTHePLO/KdWfO5rN4ZSNYf3ucWVZvciYDO/cw="
								}
								multi_step: {
									hash:       "O91B16HKBQO1RKU0FJ7T4FQG8OH89HF0P71HQAIE2SLLM9CN9EA0===="
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
