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
									"cue export # package x1":                                   "I4bq633oyrCyyaUMEPkewqAayN5VqDjYEuz62Omu6zo="
									"! cue export # package x2":                                 "EWuVjTvs8J+kjOgelx6mykYB7omS55r+gvdN1yH19fg="
									"cue export . # package x1":                                 "BJlVBgPOfNEWhzcibWAz0lTR77y4tMzfEpv4ysRaKSw="
									"cue export .:one":                                          "Y1dP4yAcD/MsnkgIvaqUZGRrdEnzyiWAq/SjbYwPRRM="
									"cue export data.yaml":                                      "Yrz8F4XqQS/tGStC1c+lgvX2JmXjSNQs+E+/Ujk9uaQ="
									"cue export yaml: some.yaml.data":                           "glaF54/3KOT1aO5e/6Y8W/mxxmexH44LhGtj377NMSc="
									"cue export .:one .:two .:three":                            "ubbXHkon+y/dNUyMEM8xt8aC1bKiqFLeSu8VNHHFzQI="
									"cue export package + package file + data + packageless":    "RVrJJGP5k8IzHjJCzhpbxtVi9ehQM3Sa2Vkl4RPrwAM="
									"package file + data":                                       "qpG/7lts3ZZh9xAAeqZe1xJzKToAgBRSKbWomwdBDRc="
									"cue export package + 2x package file + data + packageless": "MHGdVm1qLt1djh7YysB9f5pV3WaYgoFnq9UwjD6+y4A="
									"data file inputs":                                          "b4p12nzQpMifJuRVrfJoU+11eNcu8mAs5pod3c/EhvI="
									"data file inputs failure":                                  "Gy0SIi1HtWzrcvk/7g9EBfVZT4h9E0dhSeD8cyn8DH0="
									"constraint file validating data":                           "p+aSuAW6YgVA6i4pjzexUtrl8l/yqCj8BdCzi978jDM="
									"constraint file exported as data":                          "NIqu4sjXez8X3Qne2FYlCEmuaxkFqTn+rHk1HH5NFGQ="
									"-l static single":                                          "OXMQws1lXAddTMoL82qd1oR9fT7vHqwmTNA6qJLT6qw="
									"-l static multiple":                                        "mVDS2OfNWyWg5o30BWWjD7PzcFHUlC+ghin8qhCz7t8="
									"-l static multiple files":                                  "7/vlI7iHYVjdFJn+j978LHD8x09BGciNuAAOyeFU2JQ="
									"-l dynamic single":                                         "yJWZk9lgO8gABxvdx+iu3KSwCt00Bp3dylR7PxyI7MA="
									"-l dynamic single with function":                           "ZmpQQZTXBc5Db16KfByIksixDdbqJqNIMrFGTOcmOdg="
									"-l dynamic --with-context":                                 "V13ELUadEQwkMrFUArv5ZFYJP8cG9Pxc6bvbsNYt93w="
									"multi-doc merge":                                           "ptWo9irOAo26QuLDf+MGmLGR4gEt5MYXweaiUporAXg="
									"multi-doc list":                                            "w5CpQu5WtCAN1XQwu0O1G507j173gcvPcHnPWVeqePs="
								}
								upload: {
									"test cue package inputs prose":              "oJYOoKaG/L976XQv9VPwaIwP2MAzT3Vd+Hngg2pKtzc="
									"test multiple cue package inputs prose":     "79XwjM0xZxr+fhdK3D0u6EtCQNrdPzSlGBUXudOk/L8="
									"test cue package + other input types prose": "8CAQcAhJAM4wzOjIRTli8jT9HZmU72MJqoN4jrcR3S4="
									"stdin data":                                 "aD9QXzAVQn8CWWF0su9H+ysYLQVSK4LiUyBd86oyHNA="
								}
								multi_step: {
									hash:       "5KADBOIRJ4JALA1H1RER8CV9E21PH55QAGFK4B2MST7OBLEQ307G===="
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
