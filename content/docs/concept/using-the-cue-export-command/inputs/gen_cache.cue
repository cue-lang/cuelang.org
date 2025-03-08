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
									"cue export # package x1":                                   "FvPRACzHxZT6NRVm7yJT/gFvtVsMTo6ejI93y7F+g08="
									"! cue export # package x2":                                 "4xYKvIBvfJLBAShbyRwX3snoZJH/xZPT/OomHT8eYKM="
									"cue export . # package x1":                                 "fS3bd+TInatoStEXEU45cJ3d6KjFo5ZKSxsNpw7+T3A="
									"cue export .:one":                                          "khnpVfD13R/WAjFVMX8pDMC8UzYsbnL48RwaeqxwT1o="
									"cue export data.yaml":                                      "UENuSzKYptyOAhNPB0GpnTxFeHJzsUL6tGuNrQ3Ai/I="
									"cue export yaml: some.yaml.data":                           "FCDgyMSFprcwOpncWHbu59BefUE3kC/bMT60mE+YSt4="
									"cue export .:one .:two .:three":                            "n8sGw2Zw5YYZ6bicv1kktO0mAricaG16JKjoTnDJqIc="
									"cue export package + package file + data + packageless":    "BL35JLeCfDhgt1JW2vHRy6yOX66oh4HBDgI7py15YUY="
									"package file + data":                                       "NWAdWqshfQ7BRtND3vPguRnu3kfsm7icDoSLpYV6XTk="
									"cue export package + 2x package file + data + packageless": "3SX5/SoxIBlaZncvwt6yOiTkEpkwbt+zmFnH5Y6yFRg="
									"data file inputs":                                          "bvzxoWs0TMwDu9tKfzH7SdGCJiNg1su1AQZrJAlZJUE="
									"data file inputs failure":                                  "9HCAFQY06+D7zpMl4q5182dhxXbKxmyt95NcTwLIF48="
									"constraint file validating data":                           "hME0uVhI8/vbxNr5ItGw0ER3mHAzgx95aSrLe/GgE4c="
									"constraint file exported as data":                          "BApyP5d6eeFx8ZjxL0M2jTIcsuymY4kPzoaaa0fJtB4="
									"-l static single":                                          "2CD8fejSFCo54+pSWNqHtnOfexCQXNM5OmbrjzRMqq4="
									"-l static multiple":                                        "x7Pahl069z+dZE6ffqSpY8VRaYhtajZAVHqzc9WB2jI="
									"-l static multiple files":                                  "I8EKyHTigqILH+q5XY50fbLDFRtU5/9nMqO4DYOH8vA="
									"-l dynamic single":                                         "gy+WPgAo4EPqR79g4Y1k/C2Rlbq99EpwuQP7EyHf7YM="
									"-l dynamic single with function":                           "4ZfHJ01x/tZzNsALxxNhpL2LWIzHKBTPy2GPlOQvHZk="
									"-l dynamic --with-context":                                 "wP44zES3HLV/dkwzgeq8gBDfivLMg8QrOvLgVIKT0OU="
									"multi-doc merge":                                           "UonPNoJKrb3OItQbJ4Hhw323RJoH+XnwsIctKT+mqR8="
									"multi-doc list":                                            "FAC3CBfZkRmgq52Xc6mm1zmafTikvDKoyzZ3JnHkGWo="
								}
								upload: {
									"test cue package inputs prose":              "WRX3HTKhAhHzZPfFgta/ImkrET5whYYLHEFNGlN3v1Q="
									"test multiple cue package inputs prose":     "5Eo//nNOkBSR92Phdsy0NvFoNOWbPiytPogEJILCTdI="
									"test cue package + other input types prose": "v2GlA7beX2pjWk1q9UwQK+2JkPIhY9l1UsSUBjes9l4="
									"stdin data":                                 "xAG+q9Ph2oS5HDnJZ+C09viIoEsKygeRyck1kURzI5E="
								}
								multi_step: {
									hash:       "GTJD1H0EOJ7HD65HF4NKUPNGILSA45KAQOJ0AERU5V1MDRLROS1G===="
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
