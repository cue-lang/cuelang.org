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
									"cue export # package x1":                                   "gVllibDHz/F4rSwty/nXTqLwn94bGJ3OyRCtjJzTfYA="
									"! cue export # package x2":                                 "C71H36htAFFW1Lv14QWCeOyLwR1DmXGfZeh2Es8/l20="
									"cue export . # package x1":                                 "F+5pAf8WNOhJ/QGpoNtRVZmEdZZRyl6HWQSFlYEnino="
									"cue export .:one":                                          "pTY7VRZsPFxUQCBKRikcdQEx+bYOqdZOXmkWfgMh92M="
									"cue export data.yaml":                                      "Gqhzios9fM5Cq06r+15Uq6ZnqWUbbVvTpM53PgcEoBc="
									"cue export yaml: some.yaml.data":                           "d0IwXlVUqFynVdI5sMSxwvVxZDKcBOplKtI0+BQ1Gao="
									"cue export .:one .:two .:three":                            "h5a/FgoI1JmdDZE39Qs6QBYfiL9gDGvvEx1tTSknciA="
									"cue export package + package file + data + packageless":    "SmQP1s6JUc3tAzo+dzBAZF/YCJCRPwNLa3Cc8dJnE+Y="
									"package file + data":                                       "ALyA0wBad4kLiFD+Oh9RxM3p86A2Bnt33sVJImjXoVE="
									"cue export package + 2x package file + data + packageless": "PGZ7EwtwOemxgKelyU6XeFHr/9tb5D6RKEYwRtgtiCg="
									"data file inputs":                                          "y/DbvWRFrF9WjdAGSvrpL9MM1DxDT6ERnkFsrvXkF64="
									"data file inputs failure":                                  "Okd7KH0nxRvUOJZO9nSf6a2QXAaWsrW2MHEQxy7L5zI="
									"constraint file validating data":                           "KToAT4Z6xjBkj2iqFNIZqJOl1Nvpkg2r0eLaKu+SJik="
									"constraint file exported as data":                          "abJMGQQZ9n5f25ukvB34Yc8N9wodj885XseI+vornrg="
									"-l static single":                                          "F0+LKh2GcOEqLTe5qaOjcD9Wjo8XeQO29V+ne6BAovc="
									"-l static multiple":                                        "Q8lbGdeU6PD4Nb3lH2jTv/Qe8L+MIMDwwwCsae34twU="
									"-l static multiple files":                                  "smjGvG+GK83QJU9Iu/OT+SwlooP3OYi1Tj+jWhJvfyI="
									"-l dynamic single":                                         "LmQVKniY4aNG6xjaq4N14YCxVO6udAycylUlX5yo5KE="
									"-l dynamic single with function":                           "JKEEHzhF1Anuzi67k/oW4DIgFYJz3N218TqXVE+gY7w="
									"-l dynamic --with-context":                                 "Kk0EUp/b6CD2W2Nyt0EoQMmNGGWsQJnQI2mqeZRQxwk="
									"multi-doc merge":                                           "Dq0HICUyhUtq/Ex/ZlCd98zrp+2zWU9RQawFYuB4XNc="
									"multi-doc list":                                            "jsvf+3HkJBXdY0xLB593cefCbe951Bb0Jq/MZAad9h4="
								}
								upload: {
									"test cue package inputs prose":              "unsZbyJv5eoBIpZL6CNesM7gCeyy/JOIQ60ECqRyi9Q="
									"test multiple cue package inputs prose":     "hfGe46WJy64JZ6P14P8LxaUx3bJwXZ+BXyI5JIadGkE="
									"test cue package + other input types prose": "8DIUZBBH5jtLfauHpDI7ojacukEbQsrfIxxDYdeUQhI="
									"stdin data":                                 "MO/dbv6MyM165rhg0kX7ywUMTCVr5gemggzJegGJ3wc="
								}
								multi_step: {
									hash:       "A8SNBM5AF7L4P666ELS4531BIQJONTB5H5P2NM3M5PT9AMGJ6P10===="
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
