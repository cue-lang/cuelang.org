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
									"cue export # package x1":                                   "7jtIdH4VvFyJoJph63gt2gxOG1EiyGF9flnDUBqN2xE="
									"! cue export # package x2":                                 "04VQ5Sglt/3Zq1KM2xhhV71y3lQ8/3z9JG5zHRQsnf4="
									"cue export . # package x1":                                 "pGBawZSuDk/LLgdhJoght/yP2LqfE/xb5lzAfa8IMvA="
									"cue export .:one":                                          "B5ZZ88iZGoE4FRRMsR7afXFswa1fr9gqnPBVnNpse4U="
									"cue export data.yaml":                                      "oLRyjB474xxgI/9q3Y+m20df6SiX+N5zgzus9o6oIyU="
									"cue export yaml: some.yaml.data":                           "635hpDwO7gRFxdob/G5FQRxGvWWC+LB6e9aERj8Ui04="
									"cue export .:one .:two .:three":                            "EqVZX7SXG6zAOJEM9kpC4wWRTTJV5cf/vODN3jY5lHc="
									"cue export package + package file + data + packageless":    "I2IPTi145/Prd4HquXLg36iUJ6zUvEOf2Y/HWKeJAc4="
									"package file + data":                                       "V2CFZWXrvlkrxsJKnuCNJ22M+n9JKbiV6Xh/e1YTw6c="
									"cue export package + 2x package file + data + packageless": "NzzO5P34Ixmt1JUZ4UtAD9DRr6z/CzP5gxREpcDQl+g="
									"data file inputs":                                          "ipaU4ln4kbFMdA2Lv19SERTsjvgoRQG0uEs3u9+k67Q="
									"data file inputs failure":                                  "rJ4BNY0cdnVzUaSdlFECWsq30uHflll990yBVoKe4WA="
									"constraint file validating data":                           "WdtvkaXbdVLsY94OoEFjRs9tanL63HwiO1985C7UdDQ="
									"constraint file exported as data":                          "+KxVJgLZaPe706coTWji688cS28Vm61yQWZbr/p9zA8="
									"-l static single":                                          "vsynRBHdcrUMg5HsNneCTEFbmlu10p95eIz0SAARQjk="
									"-l static multiple":                                        "fEmUrI75lRmkCnWOkx7yEHRqUc4rqXUGtXNaKBXM02g="
									"-l static multiple files":                                  "YUSn5KF4COcu+n9+IkcZU/OU/SMgIbLm57Eb4K7ATf8="
									"-l dynamic single":                                         "MAhV7UXfUDJbJZ27GJzTW0ZWkYiQWTBHRNSaiTWJB/k="
									"-l dynamic single with function":                           "FL+xVRPsi2LHaf1TD4l4SBsmGXeJmzK/s8lQ1lJjRTY="
									"-l dynamic --with-context":                                 "Qad7YL/qXjQJuBCIeknxN51uVHisbu/TUZVywrg8Vqs="
									"multi-doc merge":                                           "6RK/xHI2Ft49g3hL7Snt9/s/6iP+nEbvDyCcsRxWNdo="
									"multi-doc list":                                            "pGLIM0RX3/VFWTsFBRGhTKOj9qjQbqJ/fByfc4qExrY="
								}
								upload: {
									"test cue package inputs prose":              "ZsGYHBovDNmK/uF17dAEgyJNLGhZvWlPxcOFB3Z+Ol8="
									"test multiple cue package inputs prose":     "2kj9BIJ68iR3maGWo7zeaPjkvZ8htB12Lw+qM6qr+D8="
									"test cue package + other input types prose": "ELsOywgTFl1NheT34UcMB5+a3pMmyBJW5Nl1TSHxAWM="
									"stdin data":                                 "e6rFrShB6Yrf+nBYx4HRKKRKIIpmnJVM44RQwwZ4lIg="
								}
								multi_step: {
									hash:       "H7CDALN3757FPO7ANU15KP7FT76CG1UFKEFDUFJ6QC7AIG0RABQ0===="
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
