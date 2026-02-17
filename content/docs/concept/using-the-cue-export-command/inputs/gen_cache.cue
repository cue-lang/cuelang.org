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
									"cue export # package x1":                                   "vTcpZIJqY+cVFmEZ84muZ0PaOJqxm8fPmKfJIejdPow="
									"! cue export # package x2":                                 "Mmp2819j7GvVO3kvGkUwLdRBkkJuuoNdX+PGvEydTBU="
									"cue export . # package x1":                                 "G2b9ng5nTBUYdPqRY4Wl/OitSu+PgBSQQUG9XsaIwdo="
									"cue export .:one":                                          "V3DrX8HzG53Wo4F7NJ6//dkFLBDozfHTTFfUup62Q2k="
									"cue export data.yaml":                                      "qSL3D2ZbTAJRPQrxJBUd24Nr13BlJjcqn1cL6B4bpYI="
									"cue export yaml: some.yaml.data":                           "9bFj5ONsruGFAnc1Lo5bo3/ZLJSt/LY+PRdZ+KfD3SI="
									"cue export .:one .:two .:three":                            "HBbR02B652LKHy0PcAN7ohrJWkuGIo8R6JkGrb8ePNI="
									"cue export package + package file + data + packageless":    "9drlFc3I68qu95EbBb0ZFHGLwOLEC+WWRsJ9kewZf0Y="
									"package file + data":                                       "VOwajuA89X12hqAjxjK51A+UK13SdoQNAxwS1LdN7L4="
									"cue export package + 2x package file + data + packageless": "B30r2LqIL+TpFB2gBogUZs4+NaxvPvQkd7zn2vZenQU="
									"data file inputs":                                          "qhhUFu22XHKulvix7ANZxEEbcJBLBu/pXp+MVTg19v4="
									"data file inputs failure":                                  "SUbKviWRJU3VMDnnrDL5zzUzfHlQgG+WhBD2sddOomA="
									"constraint file validating data":                           "VD5p8t57cMqAPzbdaqjhL1YlKxW9U+AlUFn8YUR0Wxw="
									"constraint file exported as data":                          "p/fn7ffh9FPuFdVy2e5a2POTwyJlDJwnzsNikg0xx30="
									"-l static single":                                          "7psgGOfNvumLkkMxwI3R2AZf+E6L8Vw+pQjLfZ7KpF0="
									"-l static multiple":                                        "KR3pUDm2V7mTB1OLj64kfRBi3un0wmASW+X2VR8CD5A="
									"-l static multiple files":                                  "RSpgWKleKXbtq/oI7nhwyQkC0nORXMt5p15pnza4zvo="
									"-l dynamic single":                                         "4DwYn2RpAPi5JBh0UGVoO/1yb9mRVmiy+AiQUl61v/I="
									"-l dynamic single with function":                           "XMN0z2DdqpTieuzKmUGbQ00B5B0wz0mug8y0BltroLs="
									"-l dynamic --with-context":                                 "ykFDfQAv8Ag+QRgMX5XZ8cszaWhfetuT2SdVpUStMBI="
									"multi-doc merge":                                           "rw6RD95SyZzKfjzXr2Vp5hwanTN/CiHXxg3sV1Idrms="
									"multi-doc list":                                            "nEXH1YTgL70813XItSG4ExeyuTBQfmMXMwlJ4ivMR/U="
								}
								upload: {
									"test cue package inputs prose":              "T+HIUZblS8Oamqvo8/PNNp48pPBTGsWMNex/mpcJLGs="
									"test multiple cue package inputs prose":     "LRpm2ZTZBhwvJiNog5RCAxPCEkVMjKTTJtoWx/05q1M="
									"test cue package + other input types prose": "q/VukzD0N+7JMBzX03pWcPwbWViFTXAHbO19ZDL94Bg="
									"stdin data":                                 "dL9/S++RT1Dc5hyOSjjM5S/jfPbqNoNmh6QUuSgt0sM="
								}
								multi_step: {
									hash:       "762JDHUURAG0FUU1KC3B8CKQAV9DCHGMVLN0OB6PNR4G24LGGP4G===="
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
