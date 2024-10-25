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
									"cue export # package x1":                                   "aRFtQ8rJHTM/ybSBg9W/DixVtgTQlF0Ca53SQ6FFyL8="
									"! cue export # package x2":                                 "J3vbkpbHDzNTrvJ/tdmJ2EauMNCjvzoWhACJLkHix7E="
									"cue export . # package x1":                                 "Ol1EiusIK2HU4zNj9bt+2c3T+9c4Okrcd9bxqJf/CuE="
									"cue export .:one":                                          "aGUYYofet31Nuufiup+6YbieZW8m68EDyRGD9umnfMI="
									"cue export data.yaml":                                      "NiK/ofarOvaNHRNlXvr4RD9CTRHyvQUHDDsusPZ9n+g="
									"cue export yaml: some.yaml.data":                           "A43xordqsPlB7L4qjy2poa85w1f1wvcjjNusg/tj1k8="
									"cue export .:one .:two .:three":                            "yqBheifIb9xSnE7/TPnnoBpY3Z7H2ZNRtihafP/hCoQ="
									"cue export package + package file + data + packageless":    "dY4A3y9j83VUFdOxF7IrprGqNqsM8T5TEFKM8FJGW5g="
									"package file + data":                                       "su5H9Q18qoJNdGQY5GXmLG3LtHyDmQqtcAHrIPtAcYA="
									"cue export package + 2x package file + data + packageless": "cmQ3cUZlm5oZzCG9JUoo9VnxGgi8a9HWz2h1YUpay1k="
									"data file inputs":                                          "6NO8jE9Z2/4TWnAraiarhCxtk4JWD3FaS40XEaYfFMQ="
									"data file inputs failure":                                  "wQ/hgp6elEEO8QjyqmayX2/p4lREJ4WxIOFs/Rdp77Q="
									"constraint file validating data":                           "FiVvUSa4nkgdLHbKZTnRs1+Ip+wGuZDX/Kzb1ddDl+E="
									"constraint file exported as data":                          "JIlx/aPj/bPC+1S6sFu2/wz/eQxd1l5RydK6VTYY7/k="
									"-l static single":                                          "9arbQralEyyHq/q8TLBchQOCEs0MeVa00+yrjOZLSj0="
									"-l static multiple":                                        "aFa/lV52lkoek8WeM8R5Ydnj+9L4OlYSDzCqwbZ0JBE="
									"-l static multiple files":                                  "Io55OYlTrmQM3mhlHiuLu22mL0MiIlTX8Jye5Hz1uWw="
									"-l dynamic single":                                         "tlpsLG/4fRg3EUsbEJKos1r+vlAYesgktAq4XtMQuBg="
									"-l dynamic single with function":                           "13Y1i7JGfhj5llxIUorsLqhUR7ceyNCYyrO/R78eEFM="
									"-l dynamic --with-context":                                 "PZPIy29hHVe0s6F1T3cD05gM4bmSjNSbn9ODG3Q+kCI="
									"multi-doc merge":                                           "GpH33pYQLc1qIMQJGkIZTY6NqOTzu4/xyxG2AVzUkeg="
									"multi-doc list":                                            "vLNQJCW3aLwLkSUEBqGI3cnL/tmWOmmRC4ybTT+dBr0="
								}
								upload: {
									"test cue package inputs prose":              "rOGHI9/RGTKp/WB6kCjfxw4Alk2rBeeBAgb1+nFH+I4="
									"test multiple cue package inputs prose":     "BZwJZ7DAC+4dB5DlGRU8sW5xqShz/KjkSFBnXn8Ubgc="
									"test cue package + other input types prose": "OkKZuK5VszHogxZHbv8gSMVCXrFCGqed2mhDhAix6FI="
									"stdin data":                                 "fyK9EoVqPlJ8MwBGj/4fTHrRStkM0vLq6wQthh4opSo="
								}
								multi_step: {
									hash:       "CN6T7F0CFI6EOUQJ12ESRQJGSLAV7F83H08H52J41Q96KKSD5RQG===="
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
