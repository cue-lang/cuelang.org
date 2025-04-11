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
									"cue export # package x1":                                   "WyChLTgZJG3ETzljQoyFiPj0FECmd02EQVYsCHvcCw4="
									"! cue export # package x2":                                 "iWr0rfLxPBeXvuPH7HChbn52kp8MfQ0lS86tIdkZKJc="
									"cue export . # package x1":                                 "WpDS/cItSovZ19mmozmS230dBHDrmWdQBdPx8nC9CA0="
									"cue export .:one":                                          "RhE/WloERkx5obwglzo2Ty5MngALBLsAfVeUOjdsYhQ="
									"cue export data.yaml":                                      "uY/NqxfW0//PJtrRHy1Qpdrwlzwc2Ai9ODRsP/MKTj0="
									"cue export yaml: some.yaml.data":                           "7SR2weEjUw9jk6P4mW2xXgz72TIPRhJv4i+RJlT5ESo="
									"cue export .:one .:two .:three":                            "BIXwekuf3ie4k2PDkvHjxbFwWEZ7qw9Yf6BZs6MSB2Y="
									"cue export package + package file + data + packageless":    "mB7S5fnuqHMacGrzjKBYzPBYCud/SVvLP8QsAZWwyG0="
									"package file + data":                                       "YRD/f2hagQ7wMv0OXgBg+nQoJFc5melu4yvHKBV6Wlo="
									"cue export package + 2x package file + data + packageless": "mvz9Oeaioi7Py4gMuXmwO2GF12GKoQE1AM9usi4/nMc="
									"data file inputs":                                          "eUlsokbu/gW62BtHOjOXSUPQqNuK5yEO6vYRDntg+uQ="
									"data file inputs failure":                                  "ScE2kgwrHafamOq0q/pXx3MUrMYMha6MwfumdxaoOPA="
									"constraint file validating data":                           "11Stww9ipixMV9GdiN8YusprHnpkIybIte64fRKOkMQ="
									"constraint file exported as data":                          "hs+byYKTMugL46EP8geszYfgCh1/vz4/VStOz7CyYFk="
									"-l static single":                                          "ZOylxJy5iL70tki634L9mZuP3ubzpKsFoAU9+y3deAU="
									"-l static multiple":                                        "Aij82E206tbKdZsMRUmp1wCw/Pp1YLw4aojWYGeZ/Rg="
									"-l static multiple files":                                  "WgAI3uw0Jp5tpZNMkkXn9xzXj/QNENJXdDoBqonzVPA="
									"-l dynamic single":                                         "Ixv37SQertLEfp5uTZjkcMoO1RG16R/rsX+1e2yUjFM="
									"-l dynamic single with function":                           "XBtj2SEvFWDwZUHBItdaIGpjS+IhCIT5G3FaRhiWvVY="
									"-l dynamic --with-context":                                 "XJjPEXGUKUwfa2Er1qgjGdbGydtSyNef0U1rZTmnPlY="
									"multi-doc merge":                                           "XAevAdhUqxI1FVD6oPt0bcBjCozNeytoZfq0nAIpW7w="
									"multi-doc list":                                            "z3T+JtJJvRZHguIC9EfNMsmRs4dGgRViBDKcM1uUBiw="
								}
								upload: {
									"test cue package inputs prose":              "JKayCpYaL2Vk/7R9H5uXelgx38RdsmRBQnpbEHvyuac="
									"test multiple cue package inputs prose":     "z1kEZKDKhXdPUyVls5vcdKiEnkvu27V0N4Hq/morGUc="
									"test cue package + other input types prose": "VWSbtHijhe0Jy1jCE9OKK9c5dOVY58/wM11J4vvx4DA="
									"stdin data":                                 "sSQoXQWTse6vkVsZqgpMe9NkWPeq6XW/QgN7ikb3dvY="
								}
								multi_step: {
									hash:       "ENVEJRBG6NU70IU0NBHQT38TB1FTE3FL5E21I6895SK1M8J849OG===="
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
