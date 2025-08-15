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
									"cue export # package x1":                                   "I9zeRIMRqfeUWuQqCJYUOcolz4TfhcQdSYYaAI4UiSQ="
									"! cue export # package x2":                                 "7ivYvvAnT5oq63oWxOzKDteHixc7YgY+u5H/SLd5evA="
									"cue export . # package x1":                                 "7waMInaVB36naJsByAaF3LWkTA9HYUQOP+fL+UEhwC4="
									"cue export .:one":                                          "raXUgM7Ot59hdc7t8QIVTQstyevZd3CyHL4qZeQqZRg="
									"cue export data.yaml":                                      "DDgOeXXB4zJL/KmxQwNiDFwUQnev1vstmxgoBGw/aZQ="
									"cue export yaml: some.yaml.data":                           "3mZknlHfMRGGashGUljp9ugGzIjYXLwF1GZivnqhNp0="
									"cue export .:one .:two .:three":                            "vg6Ua9drYhnBFCsDMoyIHIXg3ZO/0HvpNaarVQ+r09I="
									"cue export package + package file + data + packageless":    "/3uN7QpuCQ4jys+pPnONsbAnQRnoDHpTrtXHpQcMEL8="
									"package file + data":                                       "2iXlxjbvVORYLDArKqXz/BJM3JjAfQyd0VruuDxFgyQ="
									"cue export package + 2x package file + data + packageless": "V0EuUtwvpD5RuqIonLovqvYwv5sAlxu8qLW/c3ShCRg="
									"data file inputs":                                          "1ZvRW7SKf7ye2vlKgBb1PAsZ22mTR/JlFQjWhw9B1bY="
									"data file inputs failure":                                  "Fb8UWox014NU0XO03Qcb4N6tAc87J92IfEKeaEG4eus="
									"constraint file validating data":                           "fxm7bkgC+tBAwmFnHSkSggHobB7hHl7CnFTeoO4a4SU="
									"constraint file exported as data":                          "EAGT1OXpYDAovuqU8FgFxJ2Aqhpqs7DSy0qcHfQlhvg="
									"-l static single":                                          "kciUV7RWXdaYHCBx9ptxT5tm2KY2ppRJFAVRWy88/90="
									"-l static multiple":                                        "qeoqPqM01dBATg1grCJRQofU+a02/f5DxJLhtsaW0lI="
									"-l static multiple files":                                  "vKxNPwSwIsHq9Prz6D5usuEaOYPCTwZ39G93bEEkDvE="
									"-l dynamic single":                                         "na2LYowVtLN2EwEHRoUJM9rvVrwXUmszhiDs/ql/9LU="
									"-l dynamic single with function":                           "uL3sPbQmIzuxCzVq1WhlpYcg+oDp9TB0TU8Z0Ggv8z0="
									"-l dynamic --with-context":                                 "kKTET9SGAKo5H8ZP9UaaFwB+CKSdPPMvoQ+Gsykz9sU="
									"multi-doc merge":                                           "L6gqe3MQCI0PQyJYosufoIEWnDzfHL8hyekAiCAxxQk="
									"multi-doc list":                                            "hzYf8jUUhWa/EBfpBs/2J2s0DryotR04x0fP8XAHpjE="
								}
								upload: {
									"test cue package inputs prose":              "OZYok5U5gXl/EXOmf+1FyDsusIMHtg/mNvDeNlTKHDM="
									"test multiple cue package inputs prose":     "KVzQVB3uL/6XddlW5L7uuHqq0WoFCrRaz21A2gW86xM="
									"test cue package + other input types prose": "whGMcXZEtO4FCIGE8vZItFB3tXG2MauDy53nwbV7y2U="
									"stdin data":                                 "CH0SUrlhkS5DGCxGA9AN8qxeGpi/KQidvyNERsVhr28="
								}
								multi_step: {
									hash:       "A6U994NJCV2G23VEORAQO0BPFM2F1DUI0IDUTFIKF4SP45GHR0J0===="
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
