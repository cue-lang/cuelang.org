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
									"cue export # package x1":                                   "V/9O0NqBk9EXAyqYIRgPQXuNN1SxLl6mLM42GIIEwZ0="
									"! cue export # package x2":                                 "7ok4NThU9cuUoQkEdzdomvCTC+us9p87GA1uVxAf9QY="
									"cue export . # package x1":                                 "PORkLqNTc4bDcSubQcQ8gsa5fyPpk1kfa00XR4hZ90s="
									"cue export .:one":                                          "d6FPhW1SqxvDeZLB/KG95lGPafIYy+qCPyYQIOf+12s="
									"cue export data.yaml":                                      "JPDMMZlA7QWYaiisSVjPf6GeFb2XbKzl2iXcmp5gnq8="
									"cue export yaml: some.yaml.data":                           "AjC+oxbcoIYeIFVayhl+2hwoIIK+n4ad4ynL2TZlxE0="
									"cue export .:one .:two .:three":                            "4Qjp+Vs693lswPvx7eGRWyjh/wpeyIt7hIDYRYTXnYs="
									"cue export package + package file + data + packageless":    "OGcOKdmkrh0k4hsP/yaQVKpLoCzYjc/llggjDxhJBWg="
									"package file + data":                                       "JzdsqCQMal9O+qoAl33Aydr1/Rqk/sd9AxX9glDqlFM="
									"cue export package + 2x package file + data + packageless": "WXTnSsVyPQPefHu+B2glqGaeJtNlQkeQTVVKF41WWmA="
									"data file inputs":                                          "Ae58o+6mH0TZrm4sqHgwwkajyuzNf+s9LTzAp+fKwDc="
									"data file inputs failure":                                  "7oNRYWqguYr++mTm7ER1rHJAZZ43DXnq85lXqA69XJY="
									"constraint file validating data":                           "bMhdVclAHh9j14XLpVnlwpK+3atIVZa5ZmqqyNJuX+o="
									"constraint file exported as data":                          "5OjwVvLUCIxCoHIEWjpLRd2PTn2GKMd6PBqmPXn8OsQ="
									"-l static single":                                          "drP6ODGzrSNMos0M7TKGXrXWniZHTEmN26YUT03/zMw="
									"-l static multiple":                                        "gnp6bA7eueiWZA3eXqZwaeaffcXH2Cdg5Dkm5kIfAhk="
									"-l static multiple files":                                  "C/l3Itss9s08NByZBcjGhWA6X2SGPJTgUiG6o/+S9Ig="
									"-l dynamic single":                                         "XdHiwtmw6Pi2wGYYpoA/FL9l0LzMBlk6A79/k2rASKs="
									"-l dynamic single with function":                           "RM4iTmwSV1QFHsyUHu8FoGPeo2T7qW5aNYWrQtrs0DQ="
									"-l dynamic --with-context":                                 "l/Mpr/CHOX2SkSJFzR4lZO53gJE0M1XZs/Bsl6pDIVA="
									"multi-doc merge":                                           "P2HIHqETG+UhV7OrerwWePhIoW599ee2i6LhSn83XmU="
									"multi-doc list":                                            "tf0Kr3IZL0zlLKhdtvZk/FcB1+K1pIADgF+ZwI4KDcY="
								}
								upload: {
									"test cue package inputs prose":              "b4yc4oMEPUslPaTS2H1xsC/vJ7GEc9xj+rdKUX2Zw2g="
									"test multiple cue package inputs prose":     "G0HxukLBSr7qXrJr2+9f2YIW4hBx2JNhM76uwZ7nGJc="
									"test cue package + other input types prose": "/TZcS+CRavXtyXqnVmXya5aIGR+IKW84PdLNp26PiC0="
									"stdin data":                                 "422OhZX+AQ4mD4mIHuF5bCIZuDwEFi6YeqOfSbVcwgE="
								}
								multi_step: {
									hash:       "EA519JTFQ6HMA53VPUNH7GGGJ9T7TP2SS4VB041CHJ17KD9DNU30===="
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
