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
									"cue export # package x1":                                   "hStRSWHsxJClyM//nw5d8XpMlV2+gvEHbvPQC8VNiT4="
									"! cue export # package x2":                                 "KbQR+tLdc3xpHq6HgND2gdlDe1CHCbIt+Wg8xEdATUk="
									"cue export . # package x1":                                 "8fg3DPXzbdtky/GrT9040BxjuG24JNPs0LmpmBgYWkg="
									"cue export .:one":                                          "789Rq5NUcMmiaS80bjXHBFuY0tNFjL/jZfLlArrLMNM="
									"cue export data.yaml":                                      "ktaxqKVkFb8r/O73N+HgZqUNz6Qf+dIK3ejjlc6YeEs="
									"cue export yaml: some.yaml.data":                           "otxutXPbIwq9w/c3kSswAS8TxVJFGDMOZzeR9tig9lg="
									"cue export .:one .:two .:three":                            "A3UOtgv1FuDH94w42OT9K37FL7B9R09EoQEn82gUV8I="
									"cue export package + package file + data + packageless":    "r2+tGpMaHAiaC6DijlLw6CT26CoYVvLKl9qERGG7phg="
									"package file + data":                                       "dzD3tBOlG4jXHj9ekb8SBJHfQp3wRlDcOYENWwjZJvk="
									"cue export package + 2x package file + data + packageless": "5T3WTK48uFC0BUCYZIQNpX38ms92XEriPJ5vw/br0Gk="
									"data file inputs":                                          "qQty6EjEzAK5AHVCcJVEd7eOK4cXfcCqIpUtC16/I/8="
									"data file inputs failure":                                  "1AmVfqkuKhsnLS1Dh0fHetQCaqIZI4QZ6Ld1oGeQCcY="
									"constraint file validating data":                           "gGCxqFywziT+NRfj2c0CeFDFCsFAqlq3+JIPlSR3v08="
									"constraint file exported as data":                          "hP3mOfaLL6L64cAikqYRp7Ayi6BK2rXOHHzgC5fS00s="
									"-l static single":                                          "8XCopYn1H2kS1i03RRePXOcl9rezQI5B955UK1JNtZs="
									"-l static multiple":                                        "6sBLJpApykcZBn8IezzLvINjNGkmiZa27P1hcoi0fUc="
									"-l static multiple files":                                  "8xxcgQY4dnCBaPNEO2tMH/eQpRUPUnfZzFi/xoypZM8="
									"-l dynamic single":                                         "/fDHI87LYcmqNNgL/JMoWVeOSyKJXszmPXK+B/Fd0cE="
									"-l dynamic single with function":                           "hXzTlTv9cMsISwJGS11vnCFKHcVf5cxN7RYWiX7g6Fo="
									"-l dynamic --with-context":                                 "gjgAtDHY4DKcGPkf7WBiKhIELBljl7GZHqhIgcxyncI="
									"multi-doc merge":                                           "knR4H3/KAujF6oQLsFFF3B1e0LhuaP0uC0B4Qn2mk6A="
									"multi-doc list":                                            "VEXXFR0FC2vT7D27M93ViP09038RW6+z2A3ISeXm80M="
								}
								upload: {
									"test cue package inputs prose":              "jzShuM1QPzaLgzxFZcHPX09RzsKPVACU1KABeaOWUsw="
									"test multiple cue package inputs prose":     "nXxExaGivtY6L05yfcezKhoMaFKyxkcF+IXFqIlr4Tk="
									"test cue package + other input types prose": "BV21ypDiRrU0K1ETXygKz21RoyMjSvnKWO4XAKQLbwQ="
									"stdin data":                                 "45w8UdXKtHK5NCKGs8HJuJlFZt7rPcklHWv1lm/NtrI="
								}
								multi_step: {
									hash:       "RARR7HI9D99V4C8CO3BH592GCDR6OF0S3JLFE93HFV1LM7NQ0E10===="
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
