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
									"cue export # package x1":                                   "GHolYXhn/buxGPWjYVLjMKc6xcG4TuM2Ms5oUPZEl0A="
									"! cue export # package x2":                                 "x1swN/oGvPGl+dijR1nVgUeFBNX+zKnJlGjBMVr5LY4="
									"cue export . # package x1":                                 "KJ2GV1TT9QNukRFcm14DBeI4K4COuPT61GGcQFoLiDE="
									"cue export .:one":                                          "lh6ImpFhKLYsqkE1r+vXsXxbjlCqdw0zUx6cWJjm3HQ="
									"cue export data.yaml":                                      "su+kLp/J8VkhSgRwDazRdK2/SMZUba9EKLMZiv7qIJg="
									"cue export yaml: some.yaml.data":                           "8Sb9LFfeEJzRuiV0UIiXpxcjAsiAofRLGBgOuuhgUW8="
									"cue export .:one .:two .:three":                            "XKe/s1fb6WryMHK9ScJ/g8MzGnWQnCc+7z5RbDNpI+E="
									"cue export package + package file + data + packageless":    "8nWwvHn0hla/OJa+5rDMnc5TTj7dhwZDnU7M6zhc6mM="
									"package file + data":                                       "n0EvFFzWwWxW9yu/0WaHtm3h8LptG7po9wwO2S1XMmw="
									"cue export package + 2x package file + data + packageless": "/ng58nceHGhT71fwnu7dsVD3laqcgo3ScJnwm3Iz/kQ="
									"data file inputs":                                          "BQVa93uYR8OyKd5B+R7hen6uGRq1akJBxqBlBRnmOfg="
									"data file inputs failure":                                  "Stsd0+m4ZKmp/naaRQz0ln9ADU29yzVEZ2xhfIwrYBc="
									"constraint file validating data":                           "LEa8xHUC9VYDr6QhLD8SVTFa9ATFyVYGT/ha9wyI5AI="
									"constraint file exported as data":                          "thWlfY50JC0MmVs3is9MGRFUlTn2VKuXKlnO8WdsVKw="
									"-l static single":                                          "7CFcPQ2EEy8fAkEBejjwgb00SS9m35CyZJK56JVTIiY="
									"-l static multiple":                                        "FOrRMTcVRg4a7Mo+11kXese0uyb8X5mfA2uH60TSd1k="
									"-l static multiple files":                                  "CVp0TUrrvz+Wg8DCIF2b189P3Oz11GC28OUU+qqlFDw="
									"-l dynamic single":                                         "Y72bh1H6TRq20kEYLgpfbNQ8ZPvxorAEM0kVyDb6988="
									"-l dynamic single with function":                           "jpUlnSBJYxeGf6HgQGU8FDbMqnSGfjQgU1IaveBRm/w="
									"-l dynamic --with-context":                                 "JDEfQrOfwwDSulQXgrnSskoHk306AJAYqCszf2FQ4vs="
									"multi-doc merge":                                           "vTdaD0hwCJ0h9QuuF6dCUvXim+Egnu+HN+THeWtB3zk="
									"multi-doc list":                                            "TVa+4K6hs2qZySNInCoq+0UberjTtjPwQiIS2Q2X+GQ="
								}
								upload: {
									"test cue package inputs prose":              "r9u/7voPhMsalBj6y/iHybs1WHBM1XqHmBaiklKvJUY="
									"test multiple cue package inputs prose":     "bJ8xl3iyvhR4KAAdjERchKtev5wHpuss08mCrKUcfg4="
									"test cue package + other input types prose": "qTh21eUKZ5rDedeWBB3+q3RaOgiBUdg6GkOUw0WPbn8="
									"stdin data":                                 "hQjyNAUDSHuszosl+LysUGCHStlLvzCXvkCtjj4SGuk="
								}
								multi_step: {
									hash:       "UFFEHR3EMRPVP7H0516R4J7373RKKVHHLSOPKI72C1B2DKO64QOG===="
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
