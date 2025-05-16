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
									"cue export # package x1":                                   "2CBmYbu7JoUaDEu/z87WU/M3cRgf4h0b/4CGtvdmYVw="
									"! cue export # package x2":                                 "b7YTca1NAEuMswR2p/Q1FJf9I5dX0hDdv5UtNVdPDOY="
									"cue export . # package x1":                                 "zrZxV082uQdHyu8AifJwTySTVmmQGWDYO+17r2fZI8w="
									"cue export .:one":                                          "DMrPkzgsSsLbP3v5QnRyLnjbpQLuJwiyibG0MDg8s5E="
									"cue export data.yaml":                                      "j53EkdecBWgwvxfFCm8wbKgAVevAJFtMaByDoSg3BIk="
									"cue export yaml: some.yaml.data":                           "+wvhXx94o+V2Vz5ZaQzuvKU0NA5EWEJMzgUAoAS6Mew="
									"cue export .:one .:two .:three":                            "nv1sEIbnTzBBa3rf6yDHjmxqQ/hsJxdwQ2qRyw2c/R0="
									"cue export package + package file + data + packageless":    "KhIXY//XIEGmuQp/vvHQfG7BxYgBteWbcaBV15C3CWM="
									"package file + data":                                       "UiEWoDPFGWYyX/4cM/LrdwGynHssENttm3MRp2scaIc="
									"cue export package + 2x package file + data + packageless": "9lGDDxxHyPwNoyrDFPo8HUzhW3ag+S90iWHSmNFfIpE="
									"data file inputs":                                          "GTAz0A+vvo/38MayI13oaQk4SJvmvWAZ56Fcd+dAXNI="
									"data file inputs failure":                                  "MZmLq/iI+Yrg0iz/rSvfEtvXrEu5REBgKrRw+fvDUlQ="
									"constraint file validating data":                           "P0MLS6tYoxioWYmiIyq5euJo57jwR/hnNHInqpGNMd4="
									"constraint file exported as data":                          "thCNcXZfB+MvdzrVtDTQpufy3OmqMkCfSRaKGlcBF6g="
									"-l static single":                                          "g4JvfgS9U8FIqa7FEGPQ9dtlsHueDYB/BriEUowBSIc="
									"-l static multiple":                                        "IboilDcSVX1aFYM7+Sc+T6dmdbYG5sV3znkJWqCfGqQ="
									"-l static multiple files":                                  "6uP/XlUWFKTrIjy81I5ibHr+Juqg/3HXQAEo+iZvuzE="
									"-l dynamic single":                                         "84ZhSHuIjUbJXYJKa/eGayAflhJmrnUVwZcI7Im6hC4="
									"-l dynamic single with function":                           "tAgqqpMFu8OQ1eUFQdfaaJ1p8irzyNxSJ2b2FvGjCJI="
									"-l dynamic --with-context":                                 "WcxTp4aAfHiJ/UEiGBkDDCSwvPTeMM19Jc9Camv6Zrs="
									"multi-doc merge":                                           "jR55kMN6+PuN3BiBxDr/gil8K2C3cWFLyGaHkY756kA="
									"multi-doc list":                                            "LAEqeuVW1+SulbNa8DGmyRgFYbX2kIledhP8kOwX3Io="
								}
								upload: {
									"test cue package inputs prose":              "EPL9uowOB9cp9NMqkP7aN40ORG/SHg0C+UOHx9ivQ2Q="
									"test multiple cue package inputs prose":     "RaVoVWMci87gtMi0/R0T3DR6f8zXWulya/tV9bnARd0="
									"test cue package + other input types prose": "5lmTE2qUDqlvD6BduyfMeVste/M8v8JG+y2bbwllkio="
									"stdin data":                                 "+1Pud8jJJkEiZ7OKxJqTq4I6O/U0M4RGvSXJHR9b6Jk="
								}
								multi_step: {
									hash:       "C5G099FS1FLH2O36L9MPTC8D3MQ20BM1FDCVT98GK98BV1C09VD0===="
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
