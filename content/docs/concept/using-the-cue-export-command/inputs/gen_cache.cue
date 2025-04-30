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
									"cue export # package x1":                                   "7olSXF1FBApoxjw06s4xo+lDAIiJHndsUvaOKKYA66o="
									"! cue export # package x2":                                 "jYbIiVXxn2eyGbAaXomheyTS+FALxbn5IrkA7H0VdaU="
									"cue export . # package x1":                                 "uNDTJFklHATYWe8IwlXzlKd3CL+faFtj13XrDRUuJEA="
									"cue export .:one":                                          "gzVOzMBz0oCvlfV8blSNtpIhYsEhfa12sDV3zdpmrPU="
									"cue export data.yaml":                                      "/NCp3fE8c6ZX/P0OAmuQ/hhgNDd8Gh/dDpnJsdXELWE="
									"cue export yaml: some.yaml.data":                           "PcIXxVoN2VVPUzi3BAitnfK518LoZLW1a5w14zSN9uE="
									"cue export .:one .:two .:three":                            "GM33Q2JY3hXtdiuYejAoVx5lFAZfW+R4ZLHEcCfDeso="
									"cue export package + package file + data + packageless":    "/u0hZF64IPHbjgeb98JHL1S3VV6925ylwmpTXSEngck="
									"package file + data":                                       "WR3SM+9kEx2el7abQiMATXcCkt6KW6MvsXTOXnI4wR8="
									"cue export package + 2x package file + data + packageless": "MeMpOay+ypJG6IF0i03o+AfzCdkGmVkjwEffaoUlWSA="
									"data file inputs":                                          "SStW434hScl+OFqoLUB5Zn2PJ6wcTMNxl7e7KTOzeFU="
									"data file inputs failure":                                  "S88R+JHm0PbK5mzzeqBKW1QAEboqH4ARezqP4mLhpGs="
									"constraint file validating data":                           "cDQflJxV6clHNxDXyBl5kxNQ1Zlia3qFP8SioZEjin8="
									"constraint file exported as data":                          "9KD2TjK84XslGPwQZQAe4x6+60LDcUN3FZXkOq2AB1g="
									"-l static single":                                          "yBaC1GogHHyHLZn2HOhTesN6XEIqhJWtxpVDB9piJec="
									"-l static multiple":                                        "cbQPJtuAv0NKY16Ba6tiOm5nuL5QywDnENidGLZn8O0="
									"-l static multiple files":                                  "bXzONLF1RYsPMnXmW3LngzZK1Y6g9oxyTEx1Qtxwulg="
									"-l dynamic single":                                         "PxXBuYbrivnYB78SrYjNyd5k57asXDOa/F6azTYiKO8="
									"-l dynamic single with function":                           "fPhOqxiEGMjl5TZw4XLuoM3FQq1/ZwR5rP6ODy/tNo0="
									"-l dynamic --with-context":                                 "Q5Mo1MAWyj7EXp01jztU0vJVV7kyukiJRENPofohjFQ="
									"multi-doc merge":                                           "RahajgH1881k1gemm1ccfeEy5gTZH+FZ9wGq2s3CT0Y="
									"multi-doc list":                                            "jzFTXWZvcKRhLHzuMTB4kvpNosjAeR/QzXcOpp38AqQ="
								}
								upload: {
									"test cue package inputs prose":              "802Voe7fy2tDMcPFpbxXXr6lJeoc1cKPfYLfhebJ/oM="
									"test multiple cue package inputs prose":     "4BgDUpW57qNQDN9SCdYFW/GhuvVQWP8JtRR0cbxFZlY="
									"test cue package + other input types prose": "PLBd0e4O71zBMi0hcY6qSHyXPjOf+uqK3bWtGaUNc3Y="
									"stdin data":                                 "g0YXmcTC/Pfo8xwT7RKmK5lsh61RVxgZb/Go8OE0c9w="
								}
								multi_step: {
									hash:       "TUL1B643LO8TPBQ9G6JNS7J6Q558EDI6ED5N2G1BFJOBLEPNB0U0===="
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
