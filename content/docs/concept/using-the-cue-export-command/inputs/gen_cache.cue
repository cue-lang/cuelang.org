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
									"cue export # package x1":                                   "6kiQvoOmMiBr0Z2gLQ7cV4oBobPje4dwhWsaQKv5yVs="
									"! cue export # package x2":                                 "4MQnq47CXFvLFAJ504zQ2oFO5Al1KOO+A3n5UOzbB7U="
									"cue export . # package x1":                                 "2IHkEfXgpbkUbYtC+dX3h/v6DrYWrrQhff1dMp9ksHI="
									"cue export .:one":                                          "Afbk9d2FNdPlIIX7EpMzceuEuX0b6Bl0WE7Zb10TFhI="
									"cue export data.yaml":                                      "qtqJyrhBY7+/qXFSE/cynsu37C+cbUMRwYI4R+utQ/I="
									"cue export yaml: some.yaml.data":                           "L71LhcjlUR+SbWMLlKM6ceEOZIo13sSn+bv7juZ+o4A="
									"cue export .:one .:two .:three":                            "trmfGm9RNzepqPCwC8HNIkuRBLzIQtuUoGsbY6GA1+4="
									"cue export package + package file + data + packageless":    "z7tpHM/lg+NU3w4DO+ikzrVNgI7xyUI/QbQC7/7AshI="
									"package file + data":                                       "SJErWqdEDKBLCnt99z15JhyDH09lTuA6CMAKfr4pw5k="
									"cue export package + 2x package file + data + packageless": "dZHdr0vvPSgTV8S6hrViEsUvSSPAS0+//Q6yXSEPYqA="
									"data file inputs":                                          "YIqXwd7ys0a1k6A/yzWKCN+H9EuI5SgpxunCgimN3tg="
									"data file inputs failure":                                  "7gssgvkR8XXiBjRLHVXJS499P6gijcrHw+Kjy0LwBOY="
									"constraint file validating data":                           "wu1WKtBhaAElaN3VtllhmWAXK7sUXo8jRUZOZVtYs2o="
									"constraint file exported as data":                          "C7jrPw0pjyXIEoUHd4/mEgE/MDv/8d1rUPs3no2Z4I8="
									"-l static single":                                          "EqcoD5Px/9/BfHe25iBCEAyTKtZ+AeWnThG1LZmsNH4="
									"-l static multiple":                                        "N3JlzzddM67feFWsVhO+rvbPF20/8uzmA4NaNMw0x+Q="
									"-l static multiple files":                                  "d5P1QE96T/WApDGzRIsgTbFRkf0zCkWoHtF0LD+QViI="
									"-l dynamic single":                                         "leE2CX+hVnz20D+vU40x+mdJnrQ7YJm55+/noUOO3zw="
									"-l dynamic single with function":                           "rpLBmGSdHghRQS0okptPoeeN/MbqjUklJLcpRhJOPwk="
									"-l dynamic --with-context":                                 "cmDCKo+CUtwusTjDNH32rznmgUWhvZ6mgIY2ceWnm+w="
									"multi-doc merge":                                           "tiXRGAEbr1HQSBu4iuSZz29beBr0jw+LTQJlWhj81nI="
									"multi-doc list":                                            "lKUDF4+kwVrAhFOiTgkBoPvBSRsRLQ7sua0nLEN7Ygk="
								}
								upload: {
									"test cue package inputs prose":              "DXnLJp2tKuQ9G1aSyIKKO0+zcfL1Vescg82Gi1ZqRIQ="
									"test multiple cue package inputs prose":     "I+ukmo/Dt35WaNZbzEjHdKK7d/qJUzP32jx0+w3ri+8="
									"test cue package + other input types prose": "KRW3iI8T8ZuCFAhfovhupcBKUU5uxvIgLIq7Y2QC+Qc="
									"stdin data":                                 "hRdwqwhGJgwySULBdzaeLAfXPu/eHCK65Y8/buTmNrc="
								}
								multi_step: {
									hash:       "LK0JICKQ0CTCH455F970QHBDPDOUIJ81PJR527117PM2U20TEPVG===="
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
