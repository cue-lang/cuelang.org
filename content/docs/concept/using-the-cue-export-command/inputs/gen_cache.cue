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
									"cue export # package x1":                                   "Yv5PvJRpGPw1WoZDgHDxoMPHcxS1EUu6z/dqy9NSKAY="
									"! cue export # package x2":                                 "MhrSVrt6o8rLVS/YCrlzTpBdO56zhgSRRmsCweu5x80="
									"cue export . # package x1":                                 "LTULw+VWT30zf/xxxODBSw1QuPABXOHQs+nbxRQ8YhA="
									"cue export .:one":                                          "kL0H5kt/JJBbeV0zKBfzPGUPN29shPeHqG/Obe3fLzE="
									"cue export data.yaml":                                      "GmnvHiA+CK84aWzjALhLfe5Ceh0Vh24GjwltjXjPdk0="
									"cue export yaml: some.yaml.data":                           "iKD5mppCZMoJ1BXOlgZ3YqEyIkp8PFiMobU5Ab2P+5E="
									"cue export .:one .:two .:three":                            "wPVBkofWFVtsWcSrQlzRjBuI53owhG/QdHc2Yh2XzDQ="
									"cue export package + package file + data + packageless":    "41QrkVp+v0lWBIsPqTCIi5fXHeg64lZJQ8uzvHHcmLI="
									"package file + data":                                       "PFEKh5QJCm8zTbJjzUki8M6NryulY/9+i240sxP3AW8="
									"cue export package + 2x package file + data + packageless": "hU6B9cy7OgfOWBjWakdTT1VUjgnP94lsIJVRv/jE5NM="
									"data file inputs":                                          "7Q/4ehqlKrHgrC4jmggN2M6MdjJu5IrOwIPcS7ErOa0="
									"data file inputs failure":                                  "HDeP/qM859q2JN7Ld6MRVDIWuiimURH0PIb8MO14BI0="
									"constraint file validating data":                           "CWsOdWMZXiUT4rH1T4JvBGEXzQQgGyOjkE8Lc5w052U="
									"constraint file exported as data":                          "rBbmrLpP425ZMdmhyVSsi7hkYQJrmYmqhTpqtBpbSCY="
									"-l static single":                                          "tR/3P7j6QLBfjh+wd982GisvbdLiNa/3o1KXs2xrOQ4="
									"-l static multiple":                                        "nPFmGrloVWtQohMVf4bf0ZimiKlsAolBfKwkEZDsEOA="
									"-l static multiple files":                                  "w51QjW//+z9gFOdzIZlYAKORGGCUwlyTVqjddYfbm10="
									"-l dynamic single":                                         "7RWsX7JUPWkKnFnmIQCJzkxZzCO/0ULSovCi8T1ShKE="
									"-l dynamic single with function":                           "jICE7NEjyFuyisOHfpXIgzYI/bqZzUEdCYaf1wcq9rM="
									"-l dynamic --with-context":                                 "kDkYc/zyPns6cPdAnZd/h0v7rJApkYGwsdamaoVOoM8="
									"multi-doc merge":                                           "VIEB+JDUFxFf9ZxZP7dGRG62IDki7iKwrIr0Xz8eyRk="
									"multi-doc list":                                            "48mr8ZrOx3tg+5Ij33LQJt/T0yLnnNxwUFHcQcQCK0Q="
								}
								upload: {
									"test cue package inputs prose":              "55UAgS0rUwD7gJ6+uzl5obPKCJ68K9MAZ8t3xhn9/eY="
									"test multiple cue package inputs prose":     "vPQXKv9piYdI1oZclVc8IgGxN1IkNF18r8aS1H63VA8="
									"test cue package + other input types prose": "1y41Qy8mePW6R6H5hd/8CobJ+JDD70Qt42aM/7cFcr0="
									"stdin data":                                 "+aA69UJHDvQo7MFdIc4rac6M1+rcuQkgi/Pq9kBwfN4="
								}
								multi_step: {
									hash:       "CB1Q1559P1C4J6LQLVSN2UI27NN33AHDCF9JQ9JP6HH83HFB2MN0===="
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
