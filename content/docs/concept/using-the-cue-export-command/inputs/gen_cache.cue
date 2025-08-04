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
									"cue export # package x1":                                   "968n41+6iSpl061icIrne4tA1IwFUbCAgQzUpqlcF3M="
									"! cue export # package x2":                                 "p4jN3we1O5I+UWYD1YnGynphs/2w+10+pjwoqb2WcMk="
									"cue export . # package x1":                                 "0l9Jz/uE0JkiLHpEvQG8fgvUyI32EMQr+R/Ma/GoW9s="
									"cue export .:one":                                          "jkmof46Ndc2goz/6A5QLEz+9nVq3DOF0+OA+pervCvY="
									"cue export data.yaml":                                      "MR3XwncVhJtXhAWciPREnLqrF/xKiWBTgXHF0gsTj40="
									"cue export yaml: some.yaml.data":                           "uI+kwSUuBNdFy5LnVUW4a9KpG7z2jCaALzmZx23uY/E="
									"cue export .:one .:two .:three":                            "jrGpacIuUozmWPzvfCCLFXQSj1uP6+mU1GXsygpQipE="
									"cue export package + package file + data + packageless":    "e9Un/fDeuOfxxqhJkAR6/CzDcIcxa149C+k22Olt4+0="
									"package file + data":                                       "oI14F5BYIpm0kYp4/7BmpxSlUiTBGKF0VvXal7IYlms="
									"cue export package + 2x package file + data + packageless": "0WaQXQKqElzo8IP0yerWo4Ua3vqQSMFNBnEupKLD1ak="
									"data file inputs":                                          "DNJXrFbObDeGAyLKOwinv0XxpErXWaM6rD4rIdVqY84="
									"data file inputs failure":                                  "oGqsi15MCI9O/ldyNDQRypTVdTPBY6pRgNiiSL8p4so="
									"constraint file validating data":                           "K/6qYcWGDoBJyv85SLjIswiUTRxyinjhI6NIXQyI9D4="
									"constraint file exported as data":                          "gd//QcrMtZkde4quumsVOB7dKB9aCK/oYjXr2LlIcME="
									"-l static single":                                          "LAUW6kblUClSYXqJ4G8vdltQ/i7uer0X8omDfYkHxzg="
									"-l static multiple":                                        "xyt3MpWKggDvv8kRUDFufUuPBx+Ci3g+lp87kIE1GpQ="
									"-l static multiple files":                                  "qZPaLEQ+uBwUN/Y9wSoU5EVvSHUOhPprugoTZiAVOTM="
									"-l dynamic single":                                         "wcVl8K4a3dHPRbas20dpwC4Mf9hnk2siNF1GVcFrnqA="
									"-l dynamic single with function":                           "ae6qeAZBiBBsAGCnYt9N3Bi+8u5Zd84/9u8jGHA10nk="
									"-l dynamic --with-context":                                 "1PiRIqcMgDEikCvi7cUwl7fUzq99YIlzeRPnF0riuNc="
									"multi-doc merge":                                           "m49Em2Y1o+FVr7XugGG3mNla7HCTvWOlnVD8VTu9Yyc="
									"multi-doc list":                                            "xwf483QujGEYp4moWjp53AF4CWSpoMTWpi2bN7FlXG0="
								}
								upload: {
									"test cue package inputs prose":              "dutzgCc5keQr78PcfOCm96jk5M/Y6b0fyhJ4AoccN1w="
									"test multiple cue package inputs prose":     "q9SFydbFJ0mQ/TRzXC6ddewGK3Qq+4W0yvMqj+x8R1c="
									"test cue package + other input types prose": "dEQc4b7PC7LogsdhjCszwgyJBMKGoOy4qcxTImdaNXg="
									"stdin data":                                 "qrQNnCFj8qFLw1Jt2zBJ7AUaKgJ+dlbK4NkHgtcJEiU="
								}
								multi_step: {
									hash:       "G5IQ7I59VNH7TETNPC6ONM1ET9HIMQCNGAG8C3QULFNSTOCPGA60===="
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
