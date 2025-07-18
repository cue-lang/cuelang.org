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
									"cue export # package x1":                                   "uKJbZl8ix+EK3oHF3OG05lZXcZ+QOuJEhIZok0zkNtE="
									"! cue export # package x2":                                 "urpMXdpRFgTz2hQrG8ihAnSNtcmgS5+/6vLzAblCj6w="
									"cue export . # package x1":                                 "flgGQpgvMqQSo5rzryDyURm8Z1Y2ZAvYFf/0uhPJcpE="
									"cue export .:one":                                          "YvVs2caC8tt70bgSjHrWIMpm/up8XPD6OxHfq8fkdEQ="
									"cue export data.yaml":                                      "MDqk/XKHrPBrSASvIbfaXOr1zP0IS4XjsBx5+FbAkwY="
									"cue export yaml: some.yaml.data":                           "AC8k3kqgC0Nz2lNMml3fyOzQbtM1E44qKTR9VXlQrC0="
									"cue export .:one .:two .:three":                            "jy+1ngY81/dIph48rYlJx8M4zYPLKEG+bZ1P7zJcVWA="
									"cue export package + package file + data + packageless":    "NoF+gDSWx2Hoo8gxm4Ul3BMaFya9XmGG7WD0hn/mfe8="
									"package file + data":                                       "VJG0AkHGnEKVupft1Lfkdc3i2aMQuvXsTTk4m/5QAJQ="
									"cue export package + 2x package file + data + packageless": "H5+n6cjSBXiERs+hHF/RjXpfh5iktd22jOhwBEFnXP0="
									"data file inputs":                                          "lszajNOtKNSPKy8BmKLWGn1RBEeDJ+VlTjmV9+rEWzU="
									"data file inputs failure":                                  "bZkQ4aA7z2jgCSHTqdAh9tFzICPQCJuVdpitfDIVkuA="
									"constraint file validating data":                           "2HpHm/QQILL7eFG6Huj11i0rQvrGHUmKtF9yYXd/11U="
									"constraint file exported as data":                          "i/8PP4Mj7XBSwGRYXIuQmQ5dpi3bMVQEt0oNEMYz8NQ="
									"-l static single":                                          "14hOm9eTzLu6/sEd/li2ghNK+LxqIQUJeul/QDZeIZ0="
									"-l static multiple":                                        "hXU/co3xU2QzvZ5MIAFrOOuSUq2woBzcfWti+yLHL+U="
									"-l static multiple files":                                  "vSF3C7fB/NUsn4oznd+nz6nCc3L1Cwumr9LIiq5/10g="
									"-l dynamic single":                                         "47zYAI98Mx2XTpaMyu0jMpdpQrYq6cMsXlgs4NV0v1o="
									"-l dynamic single with function":                           "15t9ITTd3Ye8Z6ea4tU/PvcSjaXmDzvy7SY2dnqe3Rw="
									"-l dynamic --with-context":                                 "dop5LT72L6W9Om4oXxSdZ7rehQF9j8iWXHEFF0zscww="
									"multi-doc merge":                                           "VYSpKsHLiVt9e7gn8JYkboD109QvwEYxoi0hVxQDaVw="
									"multi-doc list":                                            "8t5RWilAtA/AOXJ69b0lomUdYl/EKDFRGK1H3QwpzDs="
								}
								upload: {
									"test cue package inputs prose":              "GAeAZNXCijogA6mstsYuF69+XKlRyXSNwH+XSN53DEE="
									"test multiple cue package inputs prose":     "ygLQx9k2V9J03ptCnnDW8z6SimJxxg0GoIHRju5M4jw="
									"test cue package + other input types prose": "cfLRcLIMDt2cYh9/RFl2wCbB5mRXA9tvw9SnRzRcVAU="
									"stdin data":                                 "S+jjfM2eaMiLLdhuca1lQno+IiDiAlgMlq7sv01q+50="
								}
								multi_step: {
									hash:       "SI8JMG3VGT57C4JASFU2CA8Q3SS746NELJDI5M3J8R5JSGFBHUBG===="
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
