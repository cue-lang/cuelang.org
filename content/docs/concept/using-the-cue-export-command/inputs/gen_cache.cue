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
									"cue export # package x1":                                   "EnF2sbR8uvrjzw/AZEtdwXQeEPX1cGN1V8nQdApfymw="
									"! cue export # package x2":                                 "DzYRLa1eYGfRMcStL43Hd54nRuI4e07cvmxjDQdqORg="
									"cue export . # package x1":                                 "e9A785YLi7M8SZBYcl8A/zAAsFfIes0RBVl9VhDu1ls="
									"cue export .:one":                                          "7bzdQwuu5WsPqbIaDEYlyfSMmqUjYu7JlYic3fsKZTA="
									"cue export data.yaml":                                      "o1mvt/5FJeOi7LJGO/xmpXOZCvOU3OJlLAjGF7FHLpA="
									"cue export yaml: some.yaml.data":                           "3l5F+hEjmjwh2okhfWqfe+uJa1hILCj96Gg5IdxEqUI="
									"cue export .:one .:two .:three":                            "FEWU3eKTuneo0WzOxMeoMbKpYY3ZcAcLuHGmF/uE3rs="
									"cue export package + package file + data + packageless":    "1yyj9wqIGSykO7zQXeU1rgNaZT3VvVQ2nf4IlgUlW8s="
									"package file + data":                                       "2CMzL/OoLCkgNPk1xC+LxRKmpfZokbk9E5UyMDo+wqQ="
									"cue export package + 2x package file + data + packageless": "h0yLGah0Rgxy2js1h+ohuOe9onFC0OWYdWRhaFA6+9c="
									"data file inputs":                                          "TSpHw8lViXh+o3zZeyPbRxn0wvvu+kbU4NjSjQk2NLg="
									"data file inputs failure":                                  "H4WUswY1BOaPSoRyhoOAhcBx3lXhK6ociDhwLcQiIFc="
									"constraint file validating data":                           "6b8jRKnnB8/iIQjBYGHOr/hPcX5iJ0HuuU+8p5FzEv4="
									"constraint file exported as data":                          "+7KEvQELHqyv9uuJy0Glm8rmaqNDlbAGaXeUXvFcQ6s="
									"-l static single":                                          "kAEfMH3ue8afqFQHbJGXiw/dMEeHL+OiTnHSMw2yVag="
									"-l static multiple":                                        "JRLSFKEi8fQjTXa/dRskbMqI70HPk4xKQ7JOLJFHd/Q="
									"-l static multiple files":                                  "NmQIOTUEL4f/wB2y2HyP3sddQ2PWFAJ8U3DKSPYSuJk="
									"-l dynamic single":                                         "G08/qfkbi4Lz9fcB+EbAMH7oLAHo0oGrWtuU0MhYk/M="
									"-l dynamic single with function":                           "LW3I8PVi+zY5XsZ9Oy/f0MA4M7iNISP2TlcbVxYeACk="
									"-l dynamic --with-context":                                 "UxegMlJZVgeKIavOyUxKI1tpAHuggP3fVVdUgq7QqUs="
									"multi-doc merge":                                           "K+lNpbQa7Q4pjFt2jln/ncUsmpwuIHWABAH13NXvkdk="
									"multi-doc list":                                            "M5/TAtGmKuE9vxFClPJwGxG8RPBt4ztvHPdYDuIuWvQ="
								}
								upload: {
									"test cue package inputs prose":              "AcEgGfkEmIiQD+dMfoBijxuY0kzY6AqlG8ISsreyly8="
									"test multiple cue package inputs prose":     "V7eMWQ2LDRaB5hoh+RIuGA8Tc1Murb/kUjrCr8cMZqI="
									"test cue package + other input types prose": "nDTfpHU4PUkhX9p3Gc2dmQb6AJnYUvYP3KjvjG9Wa/g="
									"stdin data":                                 "2pQ3FYS7Fn66/ISjDvR9uUrOuGwzmIDFVPXYrklRFLM="
								}
								multi_step: {
									hash:       "6TKK8S1K7A2ERV271OJ8SGBFTCL6GKG8JFFC7BAHIBELSPO1J1E0===="
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
