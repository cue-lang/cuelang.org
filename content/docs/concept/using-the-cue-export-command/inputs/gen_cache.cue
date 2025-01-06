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
									"cue export # package x1":                                   "O7ynEB0GY1sdXxQw8zgvWbv99wMDaXOA5yo2D2q2wu4="
									"! cue export # package x2":                                 "KwhRx/DD+7Jur6/aMbBWBdwv+CGVdYipUCPcQ6QlaxM="
									"cue export . # package x1":                                 "nxOhHskNEi6B3pgeZpFLWq7VOxXMgBAVUo7wAfNMomE="
									"cue export .:one":                                          "DHghFmRLLFNIH8JmL0aho4hDvf7bddNnD+0MN78laIY="
									"cue export data.yaml":                                      "0f0dPAu7gATouK1PQQQsCJaB5rCuvMjHIT/k92yEQ9w="
									"cue export yaml: some.yaml.data":                           "8kK3+gArcbCCqPBhtSLycaJIu+xQ99SimbnkxNyqxTU="
									"cue export .:one .:two .:three":                            "+C+CrnaHuqZh1lmCulKzqf2xSHcMfZ1vx77Bl62AgK0="
									"cue export package + package file + data + packageless":    "Cvht8np2daGJJa+DKt4g30bhU19rBnokd5ZvEcwJlcI="
									"package file + data":                                       "iIe17MsraJamTJu1SfD8aOb4h590o922xomJfun7BnM="
									"cue export package + 2x package file + data + packageless": "nlK1AHvv/LznoNbBR5J9fT6z1ygJ71OHdVSmqRluVnc="
									"data file inputs":                                          "KH22aqbxqE7Ttgc6KUG5P8+iJzgDsfkJzUX++Nj1+ok="
									"data file inputs failure":                                  "e1S6WcSVX8f7yV+nV6LZNDORauk0U2Oahl7UC9sROFM="
									"constraint file validating data":                           "z/ON+a5TFYoMCMMNTHZEQF4XzDxk7lh5AvKHr1VjA4A="
									"constraint file exported as data":                          "n049p6UENvl05Mr4z+xf+c+YFoPwsbMB8c1nbPFiRhw="
									"-l static single":                                          "csqH4WejwOGPEnbFhnH+EmdFQ6dn4YnBlikwdwlczbg="
									"-l static multiple":                                        "HzbljqWSNu9CMOD1bN3uuxlhN9LtS0yufqHalnNQcoM="
									"-l static multiple files":                                  "4s5T5q5TJSG8DEL1wz36tLlWTs1XxPPsrMD4skghTEw="
									"-l dynamic single":                                         "QXsiOujAANzNckp8Ij2vyg0frWQurFagpFIJqwOphZE="
									"-l dynamic single with function":                           "YbtojDkSqq48Udt5N5ObU7qaEhDkEhYlqrPuCw8U7+g="
									"-l dynamic --with-context":                                 "HspPaJ8puVdfTICUcLQ1IkQJ2TcmzfluIM2FvUGDzKE="
									"multi-doc merge":                                           "pHQo13BrR2lVxTJv+tWu7d5PcL/e3W+H+o0A2qkvYmw="
									"multi-doc list":                                            "k+YcZM0Qc1xdZjK4BWkuOiTcz5Z6oi4WpxwmeO52YFY="
								}
								upload: {
									"test cue package inputs prose":              "rOMv9ttpsUcLoR5dP8nGWGtlTJ4cLansp6moUQVt7Zw="
									"test multiple cue package inputs prose":     "XtoR3r/vOB2XpJa+1YB3xmKBu7VG9Vg2xWns+8Kldf8="
									"test cue package + other input types prose": "Y3M7dC9eUzDoFmGWRLNqMNwFNOX8YwTpSEYhRpBlxDs="
									"stdin data":                                 "NOQ7ZAJO9HBCTELNVVD88ZqP1HtDH8YI494/5pp++Pg="
								}
								multi_step: {
									hash:       "94S7S3FQQB0C2TLBNLTHUNC2LKFMQUE2JLBNK217G7BQF9212M10===="
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
