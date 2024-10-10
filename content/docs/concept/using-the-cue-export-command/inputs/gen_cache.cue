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
									"cue export # package x1":                                   "Hjt0LTE2tZBxcIbjDMhaJsEtRyRK0LgqZKetfJd5vsk="
									"! cue export # package x2":                                 "eoNI8ogSjsJXcr046A2qM/rG2ZJAaf5UjL8jA9QD7Zk="
									"cue export . # package x1":                                 "YCkp525fN+TJOhlFu29LAKD1oxbf+vp3flzBEcFaoq0="
									"cue export .:one":                                          "ktZienI/S37JyGqjaYo0MNJ/X6BjDopspsUEyEmBpbA="
									"cue export data.yaml":                                      "fVTi+rETHYUKfcZ9j1MsWGSaUWRpWdJzUuf6xF0qftE="
									"cue export yaml: some.yaml.data":                           "RLZItKurm6/gs+8J7KZGxV8e5uBu+GHPedNJTRYb2Jk="
									"cue export .:one .:two .:three":                            "iwhtyWtE6tAEz1K0X9Di1Vw4SBYy5zdtRrvVxhLwV9M="
									"cue export package + package file + data + packageless":    "9EMgzsCfRkSHvw9yN8pxJE1HRbmHMoq8OysIiMv6cVI="
									"package file + data":                                       "2ecntyQvJTHE80SAkAr7RyXItDcShz1J+LUinc2Wy5o="
									"cue export package + 2x package file + data + packageless": "eJTmQEtVsfu927A6xViAtJsz6+LD4KASA/1NTNcngD8="
									"data file inputs":                                          "gRaJkeBjoR7gvJrj90f8MZup5LUTLHz0qIRsNI/eLeA="
									"data file inputs failure":                                  "IMs7t5hya9n+Ood93xRRazw/gWTDLttTQqjgam2ZTyc="
									"constraint file validating data":                           "z9OwkKIEV+hqOnVWT1cd+u9hNYtTG7vydqUe52lGRJw="
									"constraint file exported as data":                          "FAcBeSTTkAboGMZcZ2eI6wwrnIPSzljwtZK2xyLbdeA="
									"-l static single":                                          "yPwJ8lY/KvnKIyLdg5QMJbILBYNWTr/UyMxkhSZSBSo="
									"-l static multiple":                                        "zrXdrzYgO6lX6peCDcQNwr6koD9NO/nRR47cFY0AmxE="
									"-l static multiple files":                                  "qSBGmOp9Dd2bJpTwNTGhoyHN7Rz2ddBgj1T3xfnrAeg="
									"-l dynamic single":                                         "3VE/Ai49ahJkn4hBao+K0/LG7L8kZ4alohjxOBy07rk="
									"-l dynamic single with function":                           "on55ZObmHHEo1ZWebQe3unUhqOveQU9Wnp/TcyADdaQ="
									"-l dynamic --with-context":                                 "i61/fgxPNd/3oBuAmeMZrw9zlurX2hPAedMOUyx7s2g="
									"multi-doc merge":                                           "xlJonhYdLOjYkHf2MDKpbQUh3KaWT+zAPDqgHSXEeQk="
									"multi-doc list":                                            "SKkaAkh7LQbTQXBRgb8MI+g0Vi1lthEFUM7jJr3hdvQ="
								}
								upload: {
									"test cue package inputs prose":              "BBxmArsAJdt2ZEV+hQNfzzTeMqTZCsTIbc/VnFNoJj8="
									"test multiple cue package inputs prose":     "qogWZJ0DVWdzveHJo0Ij5hvdA/Op2b/Z8LqgQNqFv4s="
									"test cue package + other input types prose": "5Ip7ZK2FHpSFFyOl5nubIT7bc4Jt5Ouu0+kbzLEVLlg="
									"stdin data":                                 "WBJjZfgBzHJRBADGi1A40X+Ehgr6y/6VCI8Du4d2AIg="
								}
								multi_step: {
									hash:       "O2SAFQ6J5038IEI1HBV25I8OSSMIM6TLMBVKNH05BTT8O4HU62SG===="
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
