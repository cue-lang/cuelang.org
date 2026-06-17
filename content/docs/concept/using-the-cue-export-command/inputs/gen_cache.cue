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
									"cue export # package x1":                                   "XIAtCCtCNED9P0LL3CA26e9k3Hl+9h+/tD2f3XabAp8="
									"! cue export # package x2":                                 "I7a0+UdhLXO5Mdjp5SWI302oWlUtdOTWc8b2TK1Khsc="
									"cue export . # package x1":                                 "SQMNIGIJWEaQK72LKMatcaD+bYc9r19HHnR9RMPBdUc="
									"cue export .:one":                                          "QmhKYNur954ED6JWw0WH3O9SXs9RUbLsAbEPT4mxJz4="
									"cue export data.yaml":                                      "XycSYbd1p3Iy4LD9MuRDypnG4fFKTNTvpcdWGNKpiAo="
									"cue export yaml: some.yaml.data":                           "aGoLXAntojqH5qNyaW0jwfY3nRqtTkhNgIM9c8CoveQ="
									"cue export .:one .:two .:three":                            "ErC1PhqSv4VQw6JOLwzbUCoyeJbqmINoGQczf8eWCRk="
									"cue export package + package file + data + packageless":    "QCsgCa+K96iGu/cjGToIfsJsf2Cmw8AFWw8+/lQ355w="
									"package file + data":                                       "39YTpd4yzW9hNazweBvObOloiRamq8MCCCIjWXQPeX0="
									"cue export package + 2x package file + data + packageless": "BSWon95BkdFFz6221daNK0ya3lo1XnUu0GQLDU6bnxQ="
									"data file inputs":                                          "WDRUfD2YaZtbduh0HNbD55bSRpoAH8TfbjyUD7pRNrs="
									"data file inputs failure":                                  "UAtAp1ETKWxkD5egD+H2ztd2eWXlFfo1YJsQ0d0YBAM="
									"constraint file validating data":                           "/lOP+vJJS3NQy9l0ZHHJ3L2nTA9XQdkujXXJbJlqE/Y="
									"constraint file exported as data":                          "ALNJbmqM5jelQoQwof9sLnKkeSbbu+Uq91w9ShtOfhM="
									"-l static single":                                          "Bp3nJX6eXPy9StB9OtQRmFRhyuO14r3yrbz73NetJO8="
									"-l static multiple":                                        "zhAyfeU1im7N1Unlfp9Ipr9rM2lX1LOeFtx+8OH8bMo="
									"-l static multiple files":                                  "yVKoQ/T5HTSzA9eS9Ng2ou28708o/4H7lrtQhzMBkIs="
									"-l dynamic single":                                         "bLZXuelFL8HJtuKY7I5gF7qCbxdr6LkRooXDTz09Ut0="
									"-l dynamic single with function":                           "MBn1ESvbxDiWAdmlZCqYi80hWxaDYIXQGj2HyY59DVE="
									"-l dynamic --with-context":                                 "4JlIWbw6+JC+zhjKuPKFgOQEQOL3/wU8VCI0MHjpRsc="
									"multi-doc merge":                                           "QProYuMbO6ZzdaEaPrI668x2DEJmaNzZZmnUMHTw95Q="
									"multi-doc list":                                            "okExGwxw/oNVIcE0P9H8/GQLFoZcoT93vV43DjguGjI="
								}
								upload: {
									"test cue package inputs prose":              "ieGGGkqpxSrbMtuGzHixUeoIJV3g68My/kOzTauCUNE="
									"test multiple cue package inputs prose":     "H2GH09I2f5m94PP0fw1Y1SUlhFpTLRwGda1gyzV6LtU="
									"test cue package + other input types prose": "JWMtzgbzO+rfRJd/+/dmGbjcWKBGcLT5Lgd0iJ5rCvY="
									"stdin data":                                 "zeTAFav6/y1S65zaQ29OAr/RhuzAI2weGgoKMmI7948="
								}
								multi_step: {
									hash:       "NOUDICG6JLJ8NPI62VKN5JTDT2327PRJ4HR1TAFN9PIOMJO27LN0===="
									scriptHash: "8M2BR6AKAE9FNP3DHB8JD628IAOH3AD1CBOP6HPP0SP6CV7DTNF0===="
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
