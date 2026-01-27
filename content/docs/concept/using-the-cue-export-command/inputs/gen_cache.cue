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
									"cue export # package x1":                                   "VZj9TDNF7bzikWjq/9XrUfMzCHnQcOc/w7nf2inq6jk="
									"! cue export # package x2":                                 "uh0WQEVsiY9ogerB/yC9oWa4TtB+WcQgTRlG1bdSZyI="
									"cue export . # package x1":                                 "GqtffUVvAdtMVHyjEcHW3bOV/5aW/iPTm8+3pJp13hM="
									"cue export .:one":                                          "9sNlH9eJg4kB6TmsX9jbaqzsBRaqxRq1STaPcI7Frvc="
									"cue export data.yaml":                                      "X0Dz2j+/YmwK17M01eifl9jUUnbzc/4rhGnCPy8fjDw="
									"cue export yaml: some.yaml.data":                           "StAzW+yiEPr7AJXjM72lE0PQpR3McWXvxJI5Fty4DIM="
									"cue export .:one .:two .:three":                            "Zq2YG/3AmFfASc00Cgtt55ZGktISaOL+LhKb+v21WeM="
									"cue export package + package file + data + packageless":    "ECZHda5//h3iGKnCn/hpRIGFtzZ/ChOs/lLMwwSFiyE="
									"package file + data":                                       "YL+4vyEFkx+vIbQ1mGy6mcrUeqPEIcinIQhitWJe8z4="
									"cue export package + 2x package file + data + packageless": "DAIYw2yWBr00a0Z4ZLvDL0/9mAjbEnkykTCGVOJMDVg="
									"data file inputs":                                          "2vrckBqAyobBLDC+kI3kbz9r+/WCNfuRAmHk5yRQED0="
									"data file inputs failure":                                  "iRfkJVbmMlDmuw/G4xSVXP1iOqoRTpo1Ja85zl51s1s="
									"constraint file validating data":                           "sX6UeFgAsNFZbLP/6OJuSZ4m4zVajq67jobKhI1ZqnY="
									"constraint file exported as data":                          "AuHKf0fyDnR4gzjrYu14nEcVkJLL3AZ+hYZKatGRUHM="
									"-l static single":                                          "663U833COzdb4ZDazC/A3VPmLR7y+pQgz6yYgOXejjo="
									"-l static multiple":                                        "ROkwDVb/RECQxg2iLPo3kmsO8vhsp+iyljHBzIDznSs="
									"-l static multiple files":                                  "BAIbEVLuw/MgDuGdC5LsXrA4aoYBMyTKHYlzBRcD4+M="
									"-l dynamic single":                                         "wyXYR5pkxrMam/DK484w7TXCu2J/EGUQSHxbhVe87cU="
									"-l dynamic single with function":                           "TPNynSjqzt8FjjdhXarEL7e19lfZWimxjNBw5IHO644="
									"-l dynamic --with-context":                                 "4wdb5xfp454+kX/d2sw4BdUXPYoCgktdplyCkb7BF7k="
									"multi-doc merge":                                           "vJYEnS3V7+ymJtZEuRf7Lk4L2AfTbA/DOebaTK+sPK0="
									"multi-doc list":                                            "fG6xKdTIzSozE5KYeLfyuMA8rxY/NFp7RYo49b2woxc="
								}
								upload: {
									"test cue package inputs prose":              "1/XDOL9En6W34wq6GDlpGbdNLc0Uuaqv1454sZG3cFY="
									"test multiple cue package inputs prose":     "N0nZb3s+KxtHN9VzfrPK7LxhlbRY8RguYid29gKTEm4="
									"test cue package + other input types prose": "bg0/AMeMK/POWPkoqG3KYDGc/rDS8gpXhYFAHQixInk="
									"stdin data":                                 "yGvKRoN85x/vNh6KgudQ4RHDFHPkyuRYAPJc7RAoPew="
								}
								multi_step: {
									hash:       "SFUNH1M6LGAIR7T63E0SOJRG3PBU6NJVCS081M1L9HFS3TQ7L310===="
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
