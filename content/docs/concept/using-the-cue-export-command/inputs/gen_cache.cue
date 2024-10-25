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
									"cue export # package x1":                                   "qFNJAx38RnkUD6qDOnnIf9kySYb3KdkSVGAk7DgcUFA="
									"! cue export # package x2":                                 "fXu3FmlCgpSQmGJPb594kRqwibw44jQ94511SOJk1Kw="
									"cue export . # package x1":                                 "aBmUipuRzWNKkQB/15wqeTGxnpf4AbzSZNB0SjwNiy0="
									"cue export .:one":                                          "B8JxhkHRt7LIaA/WTEWf6b8W5RgoUvCC7TCx+M1GJno="
									"cue export data.yaml":                                      "lF5mOjkaF6X3qVby8MgtgfvdhE5CeaS7c2eRgU86D1c="
									"cue export yaml: some.yaml.data":                           "p06HRqGyLlrSamHFUakKGnjjBtJNDeICLcgSd6bdEOQ="
									"cue export .:one .:two .:three":                            "JJ0/9zoaxrzUosLMeaC9IIbxz/mukiZbfaxuMVWW4AA="
									"cue export package + package file + data + packageless":    "pvp6JnqCPUbblf3rWxtzCterdGeqC8tQLmbRpBUN0Ag="
									"package file + data":                                       "5V+twi8j3rq9SufmrikH+CCV8N1N2AmHOVQVFXEalQs="
									"cue export package + 2x package file + data + packageless": "ASTgETwDbp5uplxn+bJ1eQ0C8Gupu4520i0lNCtCFsQ="
									"data file inputs":                                          "IqVAWMkggr8nM62bU0qQyXkeptRquUG9s1z/x5/AAfE="
									"data file inputs failure":                                  "dWyt88T5skprxGt+JqhGD6jwc+/48pj5arAfrtezX3U="
									"constraint file validating data":                           "8GJSX2kem7qxmFG/RtDZqrzsjoUFVJvGr7095C9lza8="
									"constraint file exported as data":                          "UZqNNe4TK0pQCczg9cfaY8y0LTZpvJXsJXAsov9hu2A="
									"-l static single":                                          "BqG+GS0q+kScngkhqlvlL5769xHuUh9ezAMb8EVzeco="
									"-l static multiple":                                        "6SSGkYTxK7mr2qXaENruRnCp680hGhLmtPBr88IZ8PQ="
									"-l static multiple files":                                  "7vpBXBSNXQ1cuQ9q7CsjoU5Tzso3/v4cAdZ0tyrdW0I="
									"-l dynamic single":                                         "oFmt9+5bqy0OBd8ZMPXuXc+Ql/h0iDPMPS/Aczg0k8o="
									"-l dynamic single with function":                           "yR2GeHFNqz2SmMl3R7We55ux5Dlb2jn47kFunEwBATU="
									"-l dynamic --with-context":                                 "6hO/NRknA4Jr9o7bD+CGxEMIFhpvCgAyoVEYy3fa56M="
									"multi-doc merge":                                           "58oBelb4SfS9qaSxGCZEhDZ/TU+ZBVLV3vd2stnAuHk="
									"multi-doc list":                                            "Fv1YwZ43Qr1F8z0x5ZQ72YEfCv/f1MtpZmJaj3r6ryU="
								}
								upload: {
									"test cue package inputs prose":              "qPCDH0S9mOFfVct4FZRqm8H65D7ustWv0v3AM0aKAX8="
									"test multiple cue package inputs prose":     "ApTGP4eI76HGaG42y35i07GhIAzsJjIL+N0SXdiQxuA="
									"test cue package + other input types prose": "qVIggZw0QSv0ER3rJozvhab3XQmGyNBgDhYxt0TugUM="
									"stdin data":                                 "GrJcTuaP9Jiz8p+iPbOqiXR9LMDUVvPrvh1p43+wov0="
								}
								multi_step: {
									hash:       "SCJNJT91FFU354GDUD50R0A7V5QK7Q9319KSKPECFAK0JIK1JBLG===="
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
