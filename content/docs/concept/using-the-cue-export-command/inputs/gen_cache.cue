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
									"cue export # package x1":                                   "ZNEy6ZOamE+zG3BJw3BzFUytaoxOBHma4MC0zcl64mM="
									"! cue export # package x2":                                 "rcF8mBeWvbNPFUqVgxhEl0yE0ZdWAkF1xKEUlkZOLas="
									"cue export . # package x1":                                 "R5N+braNBxYFX0m0rKBBqibCvUpQvr51C7Q3jyiS0Os="
									"cue export .:one":                                          "kHCfDQ0/nhdn+8xFUARFgnsyPKnPiPf9ihN7Qykos+I="
									"cue export data.yaml":                                      "alAQpS+Z7lkjqsmfM2csmhwiGOl+FdyeABXLkPbIBxI="
									"cue export yaml: some.yaml.data":                           "U4O/b9AiTImt5MVwSNaedWOUVBu57S5cjzFiJNiCKjk="
									"cue export .:one .:two .:three":                            "Ps5qesSY8WdFzLhvltMiVuVItkTskeNWYEJYem8xb04="
									"cue export package + package file + data + packageless":    "3Xz2FiwKDN9aAmTMjEZ+5tuX8Ve1Yxf4rMiy24VwIDc="
									"package file + data":                                       "AXvkwQT2hLoDhxTK8Y+stmX1+hxbPoS0Er81MUzNtt4="
									"cue export package + 2x package file + data + packageless": "QNMitrNUbN6/b9pfPFXiKUskh2Tn4OD6nU+owv2QvBE="
									"data file inputs":                                          "pjmhEuhSbMsQxMhplgWlqRXEKamodoAGUZmQipIT6Iw="
									"data file inputs failure":                                  "ZeJDPdeKU1+1IbuWrI0Iz/A97u/UAbymxrJZMPXNNy0="
									"constraint file validating data":                           "3oaLMT1nutizc8t6rzAEHERGDKB0pIqeOeMNISoBuok="
									"constraint file exported as data":                          "JV+yq7hhUG6b++H7cy08JvIxiHSVwkw/HVjWhPI2sDA="
									"-l static single":                                          "/HRDzO7chXYgU3gytCx5/KenFWI/BLHbYzUxYQqhgUs="
									"-l static multiple":                                        "jPSBr3ma+B/o2qHsAU8sKBJQt/9GSckYqpDoqKVmy0Y="
									"-l static multiple files":                                  "tQxdOkPxtsllFoQcjaWOlXCoIp3dwBLsVOeM/MsFVnk="
									"-l dynamic single":                                         "osHAVZ7x0ADQVG7FkWMoA5t5SdLhoDng8MeqwuoKPGY="
									"-l dynamic single with function":                           "BqG+nsaP4N9WYZGfJV8ku7KvU0ff5aMzc3EUjqbN8OY="
									"-l dynamic --with-context":                                 "4nZORFuSI/3cPmmfeNFK/vKNML+ASfne9Cmr6Ndntec="
									"multi-doc merge":                                           "4NA1zQkQZqy3JIX+8f5Ftl3y4mwRz8Z9Eqgk88e9I2c="
									"multi-doc list":                                            "zhZOTvIXIkmp/stmcnR4YaWgXmrKk5t/OAi7J4xrt88="
								}
								upload: {
									"test cue package inputs prose":              "93smut/XoxT3KU2dSJFZAJfCYMS2OFETb3rw0cAXtkk="
									"test multiple cue package inputs prose":     "/ARKZwHEX2vyiKZdfO0a/FM6csglNy3kLedqHx73XXI="
									"test cue package + other input types prose": "k/QmfN5cf6hbAO7zsgI9q79aumhImNjo/iJCVDobAes="
									"stdin data":                                 "uccl717Mih0ubohYW5RuSTVWuwh+33cn2ndtXwLUg2Y="
								}
								multi_step: {
									hash:       "G39I1B8AFGS43UL8L32BSBANE60PLPJDRV9QNM8H6CC5VSO6VP40===="
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
