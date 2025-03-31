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
									"cue export # package x1":                                   "MooqEay3BVRCRSISIQLsi5vilKZeuV0VhXG14e2cd8w="
									"! cue export # package x2":                                 "594ffKsMHWrtdMLAGS/t/5511WErLnXFp0/38ewG9y4="
									"cue export . # package x1":                                 "hdG3PSdFhI8pi50nxz2ZLmhD9ZdTjM/13ZLjVXtSXKc="
									"cue export .:one":                                          "cUBrUvocnuN9IACBBbdNKzT4WWJmS+fRg5aiW/1n7L8="
									"cue export data.yaml":                                      "bFcK1oA+31Lc4YJroGBfeYtnGKb8QE+uWRwOl5oHtTM="
									"cue export yaml: some.yaml.data":                           "4Scp2tbeqhRKt+YpSgcf7aIoun5GHTzIQWJ/dhTl/Hs="
									"cue export .:one .:two .:three":                            "JmMbesJgIXsyRYRbSEkbAovJUIgoG6SkO4mfRX/7utM="
									"cue export package + package file + data + packageless":    "KPIORAGpmkcyB88AZKTkNWnCkhtQqh5Qnw1FLgfY/CA="
									"package file + data":                                       "9f7LiCEe+UJnsvhJmMfkrMAl5dm3yDpOiQHWN/o/0lA="
									"cue export package + 2x package file + data + packageless": "b1mfKRL9OEyP5D7vxZzGHgoBrT/mLPW5bwYsJoSkodQ="
									"data file inputs":                                          "vqGpm+6pYzbXTp4EBSgmtyXaJ4j8ecyF2ArlIc2wHio="
									"data file inputs failure":                                  "5AjpJXQJ8/hYlZW/3mjHJ1MoJCT8pXdVkFJ9vRisK6w="
									"constraint file validating data":                           "qAxuZgt+SaF23yy7p66TIjbtmMpFcZY07AJr2wp8TCE="
									"constraint file exported as data":                          "0tY0cax1cKB29nNb+rd1aa85Ow6Reh5Dmk3+qBRpV6Q="
									"-l static single":                                          "+FcsLl/LXwbxU0ndqirgZ9ztlTOLM2u+/68zCyZMrPI="
									"-l static multiple":                                        "AdjUprOk+rG0p/AEmsajUlK4XBcrf7YnWTNdcXCEzGY="
									"-l static multiple files":                                  "OnNvGsK6e4+ibgXU8lQTDGYLOLKdCr5umtgtQGSTTis="
									"-l dynamic single":                                         "2O4gIFWKCgEmEpWycqa1G/My/MOtE6CyN874aXeOST0="
									"-l dynamic single with function":                           "rQBZkgYKelME8IQciu5M8C/VrKoZR4H6KdYnRULnna0="
									"-l dynamic --with-context":                                 "ZaKPcF02AIhbExuqzr9Bq/RyNU2u9euFboiZS+TR8ZA="
									"multi-doc merge":                                           "BeqQegnJCLhchhydZigLEFtTI2Ky8I6iYK/1uyyY7G0="
									"multi-doc list":                                            "lj5ABB82LJmIZyUfmh46FmI5QS0pafGf1XKWktFXVgU="
								}
								upload: {
									"test cue package inputs prose":              "jYYUPDTDpmAkd2QKt5Qt0a08E7Khx+JVoBJcLVCnURE="
									"test multiple cue package inputs prose":     "mM5t07IbNRUyf0PGX7ovJ5fHEpDpvatyww0kjAOYHnE="
									"test cue package + other input types prose": "xHQv3nfdSz3psuTPnksHWTl4vQjHxBnZPmfh909eOVw="
									"stdin data":                                 "cLZruOFfGLi+lAPfoFWRkvKxear/h0RPJsV5VomDJJg="
								}
								multi_step: {
									hash:       "BOIA4V9B4GNUDJN8TA4ILBU9Q1RGK5ERRA1U53PA0SACSR1K3A5G===="
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
