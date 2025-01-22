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
									"cue export # package x1":                                   "KI5hADGwZ3o0xu35DEcVNkYOjiaSRgPgWmlqvq0vt54="
									"! cue export # package x2":                                 "aUIi1GctdWyC7PVRXhkJCTaTR+YtCpF0UISuRf5fyVc="
									"cue export . # package x1":                                 "HEOcYwRTeKuREH8qb1TxTjbk4nTpTTZ40LO2BMCyPBU="
									"cue export .:one":                                          "jr4Tl84ORQE7eUSoyyzNhMGqVbjxzSu1ApJR2kIyMcQ="
									"cue export data.yaml":                                      "Djc+qKe9dVvF/Fc6UUIq6o8ix4k7+CR+7jub+9Y3XeM="
									"cue export yaml: some.yaml.data":                           "yUrf5rRgVPaUSH06u2fjhVjf2L23er3itf91CAB9MAI="
									"cue export .:one .:two .:three":                            "mG8+pZjGx1mRXW3xfb/5Y61FCDUl1W6nKLKTdoHaeAU="
									"cue export package + package file + data + packageless":    "a8gyCAnsXkuq+T7OFFRnrf47/4B11aQXfcZsZXgJW3Q="
									"package file + data":                                       "/1Pr7LVqCtLVGGIHlXCGONUvMxpLHNgTz+K+ZqzVwwA="
									"cue export package + 2x package file + data + packageless": "i2fIifCQDWbVtTFojjkS7VdjjPWvjNQRl6X6drH+UpE="
									"data file inputs":                                          "nqmI/nqDuWRH/N6ccl9ya26cCWHiJqOK1+N5ZzyRNJk="
									"data file inputs failure":                                  "sgLLtj8/kHtgQF/P47pyZR+naSp9BiDnCk85hCkVFC0="
									"constraint file validating data":                           "bdGuX+KGzqmj/Kv63iyRwjeK9uiIWq9mp2ucG3yp2Gc="
									"constraint file exported as data":                          "hX0J/FVT4Q4U3CLzt9USI7J2/+4NfreZXZIPLoTvFdo="
									"-l static single":                                          "JBokfGscNa924KQ5s58YbVPHBq1Dkqg1Ofn3tip/qWo="
									"-l static multiple":                                        "Hfhj4aOS0/cOL0C1KGtkwvI0F+PSXov78RGCXi1zN+Y="
									"-l static multiple files":                                  "1rdUEjgAS34NNQNk9qir12eDSo4X7c+zYbqgAXJ1Yf0="
									"-l dynamic single":                                         "W3k93Iv78F0nUBw4mCblp1GzO6O628IjG/x2RvM2aUk="
									"-l dynamic single with function":                           "jYaFRnrzeqbE0VAQpihmx2GDEt2kxp3rNzHXCl8E0z0="
									"-l dynamic --with-context":                                 "N1Cu8cIcgV1+SbNA9Vfup3eEmqM4eUaqxdi5TORSu2g="
									"multi-doc merge":                                           "QVbA3WR3mPDh9hCW6ojSthEV3s2FIT1Dhfnkj52QEbE="
									"multi-doc list":                                            "cj8B5mesnc+MpSvPJ1YjoYJtBe11bD4nTx+J4BBqJjE="
								}
								upload: {
									"test cue package inputs prose":              "20p+WtD8OYKX+XjNs/iw975Wv+Bs0YzXgrHYvGkNZZk="
									"test multiple cue package inputs prose":     "ePRVr7Z/Tnfh6uemy9q7Jdwuh63b9SrniEWyFAQ9GPc="
									"test cue package + other input types prose": "jA2CAB1PTdL4uT0cEJt3t9r8VaUdP8ef1EZr5+P/JDY="
									"stdin data":                                 "RVYsUwO11yn+Vuk88pR0UqRKopYj+u/mW2FTbKsKvOM="
								}
								multi_step: {
									hash:       "ECVEARS1VSSG6C51V0BT1I4PN2BKGT17M7KHHLNLBC8FEHF1VR0G===="
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
