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
									"cue export # package x1":                                   "in1Ftkx91zBHx1nC0Pg3BN2avO3rPFfWBqPBvHeJqto="
									"! cue export # package x2":                                 "t5Sah0Q6cBJ4KjNbUyjoKnNxElpLaRp9PtS+Z4I5rBk="
									"cue export . # package x1":                                 "M8IMmZgiwA9x7nMLFWJ0pDyhOSNl+k/846XQPP94x7E="
									"cue export .:one":                                          "jbqyljbOYLtiEUhPI5ykP09Wn/Ilc7DzJutIVK9m+jo="
									"cue export data.yaml":                                      "jLfSZ6WbP95QfYnbPqZpuAK5aTCP+Ovdyc62cJK/Ku4="
									"cue export yaml: some.yaml.data":                           "JfGFFIfHrlh18ML7VQ8dtU3vruYPYq2v10258citV6I="
									"cue export .:one .:two .:three":                            "1vJncU5M0J19L5jawpQDFANb5zE6PEf9/4wuVCAu8Ug="
									"cue export package + package file + data + packageless":    "51zN0D1MH+EdmpQGomEn90RjdlUMp57jY6TSXz/CC+8="
									"package file + data":                                       "BXUXejRkE8T5I+E0Wg3R75DeePRXO4+9tAK6fpLv+eY="
									"cue export package + 2x package file + data + packageless": "A3dpV6/HEYhJyGcaItwjG0NxXZlfiYpsC52gw1JIf2w="
									"data file inputs":                                          "l4GqUxqTb2MMC/iTp1xhvXgs3VTTZJziTWW0yLyC594="
									"data file inputs failure":                                  "0BumLlNXPI+DlLI3AugodXullkNswGA6Y5Q9Yo50LOA="
									"constraint file validating data":                           "tqfhNUO3jAcgDavupOZy0rQ3YoRSOuTC/4TvNqgtaKQ="
									"constraint file exported as data":                          "+HEnBR2TzPoCNqFQet0VDSupwyVZwYO7ZHVAAzRF+CA="
									"-l static single":                                          "1mt4iYp9w319cGbf5dAd+Te2PDS9NiOx9WYCG+8UrPM="
									"-l static multiple":                                        "HjPPe1DnRa4+kn6pmrhSDiMBQ8J7BVT+SObsg0rzdQg="
									"-l static multiple files":                                  "41sKbIecHxRo3wuLT6jjYiUvj052b+bTynVvuQPtz3A="
									"-l dynamic single":                                         "FHjhXXg1IL5/q6ChXAiMtNciaTdmZtHbgW5sbY3gfko="
									"-l dynamic single with function":                           "EtdqgFOjIVJxh60uHFkXmizQZlVpGhMfQBidbxNZXXQ="
									"-l dynamic --with-context":                                 "mUpxnt3V3iIY5o455reOVSfAlOtdMJnhO9kP/1yecsY="
									"multi-doc merge":                                           "IaPfJjluNxF3vMRLC18C7qRIxq4Ts7Hrloh8AmyEtgw="
									"multi-doc list":                                            "XNsaBb7ViKTLK7iR856pU5Db+fBwUAcWQ5/tn5i2jrw="
								}
								upload: {
									"test cue package inputs prose":              "S+RQ4Y21Fvk2zGaMeXsA9zk6jw/xxfQf55tJ6XZWu4w="
									"test multiple cue package inputs prose":     "Ge5gdgDqFMSk5TH4pa3fg6z9fZrt/SvTiUauFt0Pxo0="
									"test cue package + other input types prose": "RzAVBBhw8yo0r7Lq40tzFRKHS4C1hP0/ubd0E/qtf30="
									"stdin data":                                 "olgQLC+TmJNAu2CwiVDW2Mq6x2KQAaoSJBGIHQ2zNQQ="
								}
								multi_step: {
									hash:       "FSB4J74J5IJQDB08HSFGT87I164HDSK4GULU7G5DTQJ7TPVD6V70===="
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
