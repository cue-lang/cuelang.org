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
									"cue export # package x1":                                   "P5qmvPBVgdC27ifLz52YGtBC1iVZaWB4d50hafHd1L4="
									"! cue export # package x2":                                 "7C8YkZmn9Zv5mt0r+KvB2APBKR+VELTe3at77p0PwB4="
									"cue export . # package x1":                                 "sztDFj/bLT1LwXFhdy503wFPUbivXy/70r/bw7Ugk0s="
									"cue export .:one":                                          "eDXsXE9ILby6Rihcpg+k23PhfBK08duidTCZQhPK3UY="
									"cue export data.yaml":                                      "IaX7GCREmLPUdDb3risZj8bkKAXkUTUdzeP/7YmObio="
									"cue export yaml: some.yaml.data":                           "EIsyQCoODHI5pvVf17Nplewg3e14Q1XGT0Ex1cAk0FQ="
									"cue export .:one .:two .:three":                            "xBzAB0YjSz3nrTQiyjJ7frTrg2lYPFL+wZEhtYtxWKc="
									"cue export package + package file + data + packageless":    "yJJEHw8YyIWIzMEQSQyJRqVZ0zhaguFuDO20ZBzcKE0="
									"package file + data":                                       "YlNtGBs6u++NzdvB02kk4OoiAR7iXFBRHNscFJLQDo4="
									"cue export package + 2x package file + data + packageless": "OotANVkL32otxDSan1kk2AiQweb/JiNzcPQ9alucreM="
									"data file inputs":                                          "HCk7Q70ZnyVlaZGaheMrotfoyU82fflJrB+0urRtdME="
									"data file inputs failure":                                  "ByelWzQg5U4E0z1z7bLdrfu2DqB4okhRveQ5+ky6lxc="
									"constraint file validating data":                           "cyKhajMNVYspMs082skeMBKpNKGiz/VpxqiA0sfFRs0="
									"constraint file exported as data":                          "mvfxm+DFYFf8fBABqcEECcF65K92V3oI0/6xQcwud+U="
									"-l static single":                                          "B5j80KqL8KpwIEwi1NXEfEZ2NTxfKA+Nnokfiz42jSI="
									"-l static multiple":                                        "Fa15pf2Z9cVnwU6vBn+Y1W4AYcnkLQyveITjtcPbwGg="
									"-l static multiple files":                                  "7v/qODqj4gmGheotASWfn8IswWdlYtW9gdF/1LoP6S4="
									"-l dynamic single":                                         "ePme4iO2bSA3hqs2EhYGg2PiOgvAVGPgwYCFjAej9M0="
									"-l dynamic single with function":                           "flTEO1DBvH1tD5FscNBunwms9i9Fz/3YEi2t68gXU+U="
									"-l dynamic --with-context":                                 "uejbewNVnygB69PPN0hOB8JADbVZ5Hes98UwIjSgiJU="
									"multi-doc merge":                                           "Xov94+TcBirBvhn0pAFM19UGdONQzthb+HGie2I1ksU="
									"multi-doc list":                                            "+XcudEC4gJocR2Q8TZwS2U29wemflD2BkuTi0BLr6wQ="
								}
								upload: {
									"test cue package inputs prose":              "9uFOaCZ/jt5iNGKOWL5xlkHZId4tLNumq40FeCQV3ik="
									"test multiple cue package inputs prose":     "OQ6Tn/4VD+MktUE0UpNxPGgO8im0ktc0KFV9dsQP+d4="
									"test cue package + other input types prose": "nRQvzPeBM0S9SI+AiJQgxgCe4Rsef+14qPU4CnGrRRw="
									"stdin data":                                 "4SnZ1rKkGYEv9pgnGxOy+69W1ArF/rhsxHLWy0p5zcA="
								}
								multi_step: {
									hash:       "R6KLOLN4EM31LEA5IP0CAE1OGLRFD0L8M7EV263HIR61N1V9ARKG===="
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
