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
									"cue export # package x1":                                   "8nJFOOSwLWRkNXnc+QPOjBfKE5mObMBbm1d89iIq0gU="
									"! cue export # package x2":                                 "lKNVLJreHTS/rMpLMjpedxduRkMNd4R4M40bwOpLaqY="
									"cue export . # package x1":                                 "wCZzR67nMvBwT0aisc1v+RJ0Dh8mMFJXJSTVdesQHiM="
									"cue export .:one":                                          "cM0AnzVZBqaLd4SaGZ/U4Ltw0u+ETHL2Vp54UeXmUOo="
									"cue export data.yaml":                                      "lGY53FIuAHH2SpXm4keYU/drokgd0H9mm5JbfTG6rSc="
									"cue export yaml: some.yaml.data":                           "EHbe7URSFeLnWlXjCher9jbTa6DU4eQGA4Wzzabb+iA="
									"cue export .:one .:two .:three":                            "Tg8uxDJUTPgw7NWRetIffZas3MwSQL+XWq6Br2qnTtM="
									"cue export package + package file + data + packageless":    "KER4+Yi2S7x0o6tqyGmigt7VpzrZtYMZ7K//7nWS6G8="
									"package file + data":                                       "KD1B+25gT8HTsmVnfc1HxOlFxON6a6MLEVKCWXsQUjU="
									"cue export package + 2x package file + data + packageless": "14DaI/qQkVFhL2VHtbm1weW786r9w9NidR9fIKHjPC0="
									"data file inputs":                                          "V7W9szTaFGq8psWcqvHhY/xuJjU2KrOQKIJMA0uPzJs="
									"data file inputs failure":                                  "eg+UIEsxFxPHalozBGCzb0f6ZVuT44Ba54V/+zXjzxU="
									"constraint file validating data":                           "ogo17e/9AjSe7//bTYjapcj2uHeJpkYeqgarx6+v5MY="
									"constraint file exported as data":                          "8KqQoPDGK9KAcVhaBeW3b2v6zMEnKo6NEPRo/eC5kfw="
									"-l static single":                                          "45T1/nXIzOkwP3aUae8EBwAYKL2aCI27aembb2oNGyk="
									"-l static multiple":                                        "ZUNY1lSYtQUU/nJhbO8hm004cfx7hCv78EcuXIVa3Q8="
									"-l static multiple files":                                  "Bh0xHIPNWq9B2kI48achuD45HOxgyTxGMCmPBJE3A+g="
									"-l dynamic single":                                         "poh/tT96I+/DOSH9p0t1F6/Jgj3VDRp5DOeMMc3wGT0="
									"-l dynamic single with function":                           "H8Lpf3NCFxt51fJD+5zgLa0/GRuuBapKLhJpU8wamOk="
									"-l dynamic --with-context":                                 "VnFjjmuJPFfOUtR21IYfBTQzG4/O5Iiro4o43KPLjyM="
									"multi-doc merge":                                           "DGgia5TEngDwR4mrMyWoUqsZnLRAFSb++ZNZ9fCx1U4="
									"multi-doc list":                                            "7V5q8NiKZmvr/hMzY4lJzznJJv3G2Cx99cEvYfeeE9g="
								}
								upload: {
									"test cue package inputs prose":              "je14mIdG5VPW0iYg/bOXPNZ92MnHbFTcbXPG2ZHErh0="
									"test multiple cue package inputs prose":     "UGL11p+gWS8Wn6iwtqTA46rGUwFArrDZV3AXKygafLA="
									"test cue package + other input types prose": "NFpniPcEe3BY89ffj+xKy7XoZhh9cuFkfOM64wVWlvk="
									"stdin data":                                 "cWbyLd6rSh5HWYeyYgONDTUSIZfJ3Gi/X7bP1ujvaaI="
								}
								multi_step: {
									hash:       "7EDLORSMJRBC8B1N3NQ671T92V660BOU31LLE472PQQ3A2352F8G===="
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
