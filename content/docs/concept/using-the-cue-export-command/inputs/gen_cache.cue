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
									"cue export # package x1":                                   "oNdxpe/2Ris4jbE1UpLrlFdl1Tch4EwAwwSrL9KmnFc="
									"! cue export # package x2":                                 "HmRrm0ePP9vJ6mdBvPPiEVsHwDmYXlKffTVqfhBTtA0="
									"cue export . # package x1":                                 "wXvGKfMZqA2+XvDNPogXLrpuPaV9wp98dQzTR+GtuuI="
									"cue export .:one":                                          "HUbbDnL7cCDYBrIRMhaLz3z+4AQhTOVkP7X4GiOPkp0="
									"cue export data.yaml":                                      "RhkPOTm0DqQtK1735V5YhdZMz7GvJWSBEwsGLD0DW+U="
									"cue export yaml: some.yaml.data":                           "cI5gXESscteCM2DniMjogHv2U70axKI+DOk2r1vN26g="
									"cue export .:one .:two .:three":                            "t9JRdUzjm64K8NjAT+ovBS1uQ6sFYA631Kt83uCOvjM="
									"cue export package + package file + data + packageless":    "8yFxuTGHAR2thNtBaNymlX88OE0pd4S8meKgciDcWqk="
									"package file + data":                                       "bUTqHMdnk8qsvUziK+5+1+nkXthjlR53/8K4sftyutY="
									"cue export package + 2x package file + data + packageless": "yZrIZnTR3Beazqe4ALdakfWyvFF1eonM06M4vHvjNjQ="
									"data file inputs":                                          "DbHPcm3b+ewZ4llZnX/mcGmWrQtRbSbfBAmP7Z62jAY="
									"data file inputs failure":                                  "K/Jk5WWfiQYVSexx307vV1m8E++wI3k/CgSl1LrV4Ho="
									"constraint file validating data":                           "vBl8Az0hBd2HQTwVg9nI+XdC4479TNJMzsGySvuIuXg="
									"constraint file exported as data":                          "3TSbHtdWrkEl8AAho1JRdJV82tySe6t3oc+Z4AiWK/Y="
									"-l static single":                                          "p+RwjHn1N88tuJjaQFNWceX+Gcz454SKt8SDXZCyZvg="
									"-l static multiple":                                        "aK7dYpJSFqlAYbzpkALOH70QvIU5Yby/IOKeTJPUu4Y="
									"-l static multiple files":                                  "v824+pnE777FLZ5VxFuDEtUnRliiS+b2ijVnzYuGuqU="
									"-l dynamic single":                                         "HBoxRB2rxJkI8HY8XX/JvY86TmQAh0b7xZiGS1FR8Es="
									"-l dynamic single with function":                           "M1HMSclXzFI7ZaeiKBaN5KR99GJ8AtmlbCSk3XwWMsI="
									"-l dynamic --with-context":                                 "kKBLMBeqTiUQwundQviSF93Odc6WTxUXQlIj2fON/5E="
									"multi-doc merge":                                           "gw8YGg5aDw0VtXOQybseoh6PxC3TKsIlL+Ecu79L2sA="
									"multi-doc list":                                            "DDbag+/jsShEtCUchvtTe4m0Igyc4ZLbJqmUWce6kAI="
								}
								upload: {
									"test cue package inputs prose":              "eMy2flGa8Z6+C8g3US2Qv0R1w980PDpWRgXgQSubFdg="
									"test multiple cue package inputs prose":     "I2soTp3ffyPbuoJZ+4fhJDX5ux55MbC4Odbl8rXtgRU="
									"test cue package + other input types prose": "tJ3jkrtByGSLNQGu1CDtUOEOWnaBcYk30L4b9JBWIlU="
									"stdin data":                                 "Lpcq5L9y+k1m9BDTUxdyi2Xfm9wN6SjdhGY7NNlnUzQ="
								}
								multi_step: {
									hash:       "VJ7UIM0T871V8GMN9IOJN6NTG56JAEL9D5SE1S4N4C1BGO2OM0A0===="
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
