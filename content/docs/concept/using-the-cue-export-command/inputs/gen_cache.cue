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
									"cue export # package x1":                                   "nWSESY9uZLekKb6YeE4k0ndUrCp1+mXpj/8jYII7rsI="
									"! cue export # package x2":                                 "okyamq8nuG5ZNIkRCF58F92gdDpmSKu4PhZ3vpUixjo="
									"cue export . # package x1":                                 "skyIeZRlcEXyf+/6SVKES3ACJfC7sPNPBmATQ1ZJbW8="
									"cue export .:one":                                          "/DUn33OjXG37wAhfIUJOQTjjcPT10r13C3YWqIaW55o="
									"cue export data.yaml":                                      "v4xlALoTitXzgujjf7CHN23GF3rowXtmk2AHv+9w5Bw="
									"cue export yaml: some.yaml.data":                           "cBrWUovO6X0W0Lneik0I5hCkg/yc21tmr3bQw0e6e98="
									"cue export .:one .:two .:three":                            "quyYSyfNsqQsGLx7/Ytwr++VW0WB0feTOAU0fiZEGSQ="
									"cue export package + package file + data + packageless":    "G1uevw0tXX+yDv1c8y2LYwdOMA8cWSwy6LJcRN16WH8="
									"package file + data":                                       "+AP1oAH//JZp0v97oy4HtcxepqBQDINN+e/63aVZec0="
									"cue export package + 2x package file + data + packageless": "00PAyHRN+NbhjUa7+QJjqBFhzd6fIfkisOsf9eH/CCA="
									"data file inputs":                                          "WWix5M9CxNIwg6CpOoy7r1qehYigKjQu15HkpCIaDkc="
									"data file inputs failure":                                  "NhO7qp36Spoqz8FhQa725rq+Ko5CZlMogP/nwmaoxWw="
									"constraint file validating data":                           "klu4uo8p3WxkqRj3kTzjIA6j8OWEfj6FIa9t/iVQNlU="
									"constraint file exported as data":                          "kOROH5SCiHR5vyPQKvRpYAbZM58n01+KjBme979vQPA="
									"-l static single":                                          "WPifoHJw4v9EEPbsKsiV+ECVcno/zd/HEg8WPn5bqeI="
									"-l static multiple":                                        "ijNgkICtfR131kzuQUnE5JEgkSXXAOSHNeH2ABsaRpo="
									"-l static multiple files":                                  "8ff7HzsuTcqyGTjnliZzgbgzOVB7OGfInpzaa3hcvcs="
									"-l dynamic single":                                         "NHUR1HLLhDcZPDq4458eOrKZNC+6qqLmCv7p+6ssdCA="
									"-l dynamic single with function":                           "Vy//EFT62aB6nYbnAQS0AlL7dmwRrj1i7Es69SP66Tw="
									"-l dynamic --with-context":                                 "o+6d/Xzk3NJRi1+J115PZRvqag8NMMAkCu2u5MR71fQ="
									"multi-doc merge":                                           "5RfRvAYb2Cap82wtsSxCFx2BJJtCjyGeXdW3BRcA+qc="
									"multi-doc list":                                            "WvcAbhx8dmciY9Ta9024+A5b8sKf8eK+8i38omNUUHI="
								}
								upload: {
									"test cue package inputs prose":              "Syr/iKIus48l/4yfyx5wwH4IwoxxXdsPg5tPPsolL+g="
									"test multiple cue package inputs prose":     "oBj2oKPGxx7jmC8/HRT6tUbJ9lTOV/XOTDSbN1uiDkU="
									"test cue package + other input types prose": "iVi50Q6ZBizKs6bx18aTV8TeNxdz0YYP4ZTVYK2DhfA="
									"stdin data":                                 "PRZgBEHOnS/+O4PqCcy4jbisx4Edi4oEr8i8KBf6WYk="
								}
								multi_step: {
									hash:       "ARKT74S4TGTT04MOAGNKITJTCK6PO7ATL669TTLO5ETC8HH9T21G===="
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
