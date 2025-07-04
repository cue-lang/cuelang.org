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
									"cue export # package x1":                                   "ywZoIN1OS+uTtYfZLVv7IoDsHdklWpMyN5SeHFnanHk="
									"! cue export # package x2":                                 "JvZ/hwjwaB396vcKve4k6dxEKoDIvBskVTJRmyuqhBY="
									"cue export . # package x1":                                 "I24gJ3sa/WcId1cqkTYTWUuXI0F00oan5R2cVeIyB5Q="
									"cue export .:one":                                          "4iUf+96oIbba1Gp03xg6GDgEzA/CbeXKrTrEbhGur0w="
									"cue export data.yaml":                                      "4cyLYH3i9dXhklQ3uRNguqAj+6T9ILmiTbeGjI3HQL8="
									"cue export yaml: some.yaml.data":                           "tZxIPqzGPk1vxRvt37F5Qmq847JPBCeENWvCm3YweiU="
									"cue export .:one .:two .:three":                            "7pIcOQ0EeguZNM1r6t3tHagiP1DJ3h0nZlXzyz6lYG4="
									"cue export package + package file + data + packageless":    "coW2w9yyo24ByWGq1qKHBOcsWNy/6Kn1V9x1+NcY+pM="
									"package file + data":                                       "5RFI5zUaQMG8oK3hWm1W6jgsuOK3TDIf7TlvC2VsVOM="
									"cue export package + 2x package file + data + packageless": "zLvPH9y8hF7jjT3a15gCiGrnb3ZM9kxRMHsyEZEX6NE="
									"data file inputs":                                          "+iSR3fjjiy7JG4wApG8OupgeIOIacAVcvaOl6DpaWHo="
									"data file inputs failure":                                  "Px8Dao+u4jmo3vu0tnKY1lkf3ORVfaXQ7n8aqo3zZgI="
									"constraint file validating data":                           "47t1cJ9ghIrDIHPcWPtLEHH63lp/nNv3JbHip8tbbV8="
									"constraint file exported as data":                          "Wk4A1BM+uY/PHX1keleu/fvXjkB88Ov939GmC18mMmM="
									"-l static single":                                          "p5L8tbvWPSW4MDf/JzJNh+gDV62yPJpbgA0YIU/ibQ8="
									"-l static multiple":                                        "lGG1yY5nbbaV0dZnOkbDu7gJwcISixiLbds9pkPwz6Q="
									"-l static multiple files":                                  "mebyOZ9DHxaRoKJRQ4Tp11TJiiEZPrPioaIIn5h1Rgs="
									"-l dynamic single":                                         "ODKOlUWuWcT3E50zmbwNxcllIO2rNR9bgvWpw7kFw0E="
									"-l dynamic single with function":                           "nw8XE5t7xpNXDnzP2+FdbCqXyXxp6uyVxeUl8/IAyG8="
									"-l dynamic --with-context":                                 "OmKTbDY/+YR5E0ll0bXzJ5Iyk0qL9UCgavOELpYXe1M="
									"multi-doc merge":                                           "+OPflV8reW5a04NR9IPYxlNP0ORLe7j8cLTwS6daFp0="
									"multi-doc list":                                            "z2JDfbf63CmMEkYT+mPLBLv5HYaaPLWl5ABMJ92IWDM="
								}
								upload: {
									"test cue package inputs prose":              "W1Ph6iffSgwfwZfZDwXQfAXztyVNgyRM3QCXO/5MadQ="
									"test multiple cue package inputs prose":     "duRsDjvC1OaVPWbZIXk0r5bo5jJHIFN3eDpSiwu6QKc="
									"test cue package + other input types prose": "6HktQ9Z5lLp4Iyn+kjTfUbCEH+Qw3LvkUhVuSGDg0tc="
									"stdin data":                                 "IXwdscR1kfbSacj8rYInO1O9tSs6/3SfIvVjfdBjkyk="
								}
								multi_step: {
									hash:       "UEEPCLSUDJ3EPROTHJ3IR4O9DUQ6HBOLO07JRMOTSM8UNR7VMQ0G===="
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
