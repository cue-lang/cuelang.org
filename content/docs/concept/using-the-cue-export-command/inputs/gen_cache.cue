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
									"cue export # package x1":                                   "WBw+Vm4r5kImI9CsbTeu2zyTKEF9Arl06ySRPhfkSPo="
									"! cue export # package x2":                                 "NCxvaxl7Wg5+TxE3MjG1I40QUw7NQfCQrxUbzADuG+Q="
									"cue export . # package x1":                                 "oLO+625UA92dmAnFoHf5CDq/kngsYsped874vxOkmLs="
									"cue export .:one":                                          "MSY+3nGg8ENj8AiJYMMK0dKe/58kntw/9arqN1YAdkM="
									"cue export data.yaml":                                      "ryMw02NWA1JUeIA4Pij7A74kNOX6Z+IOzRzGGtxesqk="
									"cue export yaml: some.yaml.data":                           "VkL9d46Km/k6/YJrvfu1CQKbjQPzme7IVFeWPzS+9ng="
									"cue export .:one .:two .:three":                            "YRIIdBpnHW0Ry1oFphnVMzKCRLET98MWvzo6SGgmKqM="
									"cue export package + package file + data + packageless":    "xoRBWRKpAbqzomJoiP0/tG6hLNBF3q1XTrDIcP2/Woc="
									"package file + data":                                       "2JGHr+gk5gZZ+MxLgF820Rc1WwTD3Yb5n6xuwee/IxE="
									"cue export package + 2x package file + data + packageless": "FCqVpd3ZlcaA2pqF0X/ZmZkdKGCxm9QjHld9fz4MX+w="
									"data file inputs":                                          "aenIb3umbwcJrDf0jcO8ah05IcoHODqbGYm8BNAoUXU="
									"data file inputs failure":                                  "OTtgzVDIFvZUk71/3Zpy+2bDP7CAt0Xa4Dl6tmo/7BU="
									"constraint file validating data":                           "PLHAQq170eTBC267cjCqSg4fyjhKYK/ScqRGV5LjcGs="
									"constraint file exported as data":                          "L1zNw8FOJdt2Rc+K2/9fjLk0w9/c5gcTimZsrdYGI1s="
									"-l static single":                                          "RNPYcXJYR4GgZ9ztNSvgJm/0qJopEiN9gGWPKnlifQM="
									"-l static multiple":                                        "vJRvTwWJJI2FXX4b9D51mLIfNSyukGiQOBMImOePuX8="
									"-l static multiple files":                                  "wSVo7y8miAAzFBxDRt0XX3hn4Gv4+S7imNpEG2p9fF0="
									"-l dynamic single":                                         "8odZ7F2XWfst9TMhK2rKHOfWfsRnwFuVPW/dmyyaUgk="
									"-l dynamic single with function":                           "vFWw3vzBMmMXDt+syIuqrDGEZWp8VNqH7Lmj+I0qzB4="
									"-l dynamic --with-context":                                 "8F8v2xml5IvG25l1IqWAFEZWdiKxqDxEJbZa3Bvd3PU="
									"multi-doc merge":                                           "lu2vcFqFU1YoTIidJdk2gu4eVdmG9J4XlQQn8n+lQvs="
									"multi-doc list":                                            "jUPCJrL1q4Mwm5tX38ZvSy+z236OeVedVTnjrP/hkzE="
								}
								upload: {
									"test cue package inputs prose":              "BezSpPPKC+zr8eBZwpW5OMMVcYSENYmHI9nMijepoZk="
									"test multiple cue package inputs prose":     "T/iTnLCLXQASYmIFs53lsQwgECXpdIAAyKiVcEZKwyI="
									"test cue package + other input types prose": "mtE7j5LoXzRaBZmsupKO6j1G9nqzJi0hBfRWtM/YQRE="
									"stdin data":                                 "8JBf8+vZixqriYR/kfQABz1wenIG19NZopN6aIN7818="
								}
								multi_step: {
									hash:       "4O57ND8UQ41MT1IPKGOGFR0QL5K6101LBPKF059RHTPV7LHDHKN0===="
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
