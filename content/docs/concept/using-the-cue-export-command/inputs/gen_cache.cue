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
									"cue export # package x1":                                   "hskk0czSsgy8N2UypdnEbMe35+Hkm3NnR4X7e1Q3U3g="
									"! cue export # package x2":                                 "uvhTer9RxpUXQzNf/Cds8QuzWyczOB1CbTaMVnYjs7k="
									"cue export . # package x1":                                 "RqXqBWJKGBeXIYFfNQWNeTpg/c4IsW6dhmMDQddkbVk="
									"cue export .:one":                                          "yM1U3Cr9G8Z/NCTZypUYo7oJqtl9QIEYVGhsJe+E59E="
									"cue export data.yaml":                                      "cQmjkpQjkmCfLP7jl9qTQoqKiDV2A/GtxFSmLprd2ew="
									"cue export yaml: some.yaml.data":                           "kYyxifIZpS6hs4HH151QusKyxa8LGDlGVK4RwzWQueU="
									"cue export .:one .:two .:three":                            "FgYByXNUQ29dzhg9XBZjYKcVbAPoSAIKMSO72O5dBdE="
									"cue export package + package file + data + packageless":    "EweyR+zefdrKPoxvnvJ/p9zw5BDOTWgypO3eSdPIi3c="
									"package file + data":                                       "nleep7KfAEomxmZ23v7qHk3KhK4frv+UoadM3fp0NVc="
									"cue export package + 2x package file + data + packageless": "046yFyXoTbGGilLXRQoFSvg5CzjyTqaFJK5o51ZTuqU="
									"data file inputs":                                          "J9eLah11F90nKswEJuUYOceMJwxDa8Cz7SwVK8bIj0s="
									"data file inputs failure":                                  "fVDBIUYQ1cfZBAWX5nNtzx7Q1OJQkGo4gBy4zc7dOpQ="
									"constraint file validating data":                           "dFYaf3pwgS1TlTkdga3vXn0K9l12ljM7cxFVqRBZvoQ="
									"constraint file exported as data":                          "IqW5z9x0/XxiaoT/6d8aGxcSN5WXdbo0iV6AtQtQfyE="
									"-l static single":                                          "VF0G+Ws92iMhJ7tnmp9FgybzWcn795p2LgbfTHePMkE="
									"-l static multiple":                                        "xwO8HhSFxFQ1eC5HOt00HW7ql6wNuHasme/jTs5PKoM="
									"-l static multiple files":                                  "A73gzpHqgajilJ4iea3l0d4TKDdSSA6WTRSDr0xzpVg="
									"-l dynamic single":                                         "yn/ThKQBIeK4vRIDmzWTc/4sIOpF+AFFkUCBhcN2Rvo="
									"-l dynamic single with function":                           "RAVjENhVK0MkVVazTo+c38uT1qLIT+q4DnE5S9qBlFI="
									"-l dynamic --with-context":                                 "sebXl/SiiDlw5RJgbaYe0zx1r6t+lLzaaw/gNpTboLg="
									"multi-doc merge":                                           "biTbbLvubbk+gkCao+HxACkvEeLU3g8dVS20vaAXcRY="
									"multi-doc list":                                            "TcUjyIzvlOZzC3tORY95pMSNumed8glsN/N6vozB0W4="
								}
								upload: {
									"test cue package inputs prose":              "XadhiudvGllpeif/OSU+qDOQFIFitWQgiJdwRbVM9Fo="
									"test multiple cue package inputs prose":     "VUI5DZsWBMl4VGpLDfu5eDCSq+GKeilcF89pdEfXwkw="
									"test cue package + other input types prose": "uwjqMrKeCCpqeROPHt8RD5eyHJ2iXW3l5s2b2FvpCus="
									"stdin data":                                 "5c434Oh3lM0d1OiA2tX0BTn9FRHVRtyOPdydmDEaiN0="
								}
								multi_step: {
									hash:       "EU1MEACF43MHEPRTKMVACNFTRG9H9S6EKHIMSEL91RF7OP5O9A2G===="
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
