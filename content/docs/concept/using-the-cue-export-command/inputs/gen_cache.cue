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
									"cue export # package x1":                                   "YOzF6z9HOeDAXZjxHXAL+ZYo2eXgTR/3dzPqWRvjRIw="
									"! cue export # package x2":                                 "juyuCCzR/nIKZzP1hlULpytfsRLk+86csjUoQwSDyQE="
									"cue export . # package x1":                                 "Y0LxDTBm+xUTOWLp/Qnd3xvXhFlERtnaMhLjdwUew0o="
									"cue export .:one":                                          "j3RkreuFfmyFOqgJjQ9b9UphzOYfh3RF8Srvfpj0jQw="
									"cue export data.yaml":                                      "2qmE7zOt8ezjnSMUb8q3xwN0phLgRkdI5hyGDEKGx3Y="
									"cue export yaml: some.yaml.data":                           "gEJJdiav/4sy+SfwXAnWRoXkeYFMJTPb/by1VVtUtKY="
									"cue export .:one .:two .:three":                            "+azYx9TS4M9ONAeWevIHZaYoyxPfElDA6BZeVsrnzhY="
									"cue export package + package file + data + packageless":    "iZ4fnByeWCoTSVZ5TRWgS35MerrHizvBtnt2T8nLr00="
									"package file + data":                                       "uv2xk7TKWmqnjxr18lwrwv+zeLHY9EWi25d5OFTJkmM="
									"cue export package + 2x package file + data + packageless": "I4ep1uugAwtj1GkncwH/ZmsB8eSybUuciRjHKpmE4ZU="
									"data file inputs":                                          "Adkqo5Bk2Vgk6gIY7YkT/AfKlTfP41okbjyGGMipO1k="
									"data file inputs failure":                                  "F1nztVdElAIanUQ7yQvLkgMYuf0n/yCIES7UIbaGIcQ="
									"constraint file validating data":                           "+ku9ZcFZDzJGJRaBi8j5+v97f2LdjmFDYJlTIY54BwA="
									"constraint file exported as data":                          "tFXaeAE5dGsz+IuGH2jVRcbxAvBzu075MFzcM+GyHiU="
									"-l static single":                                          "vVmWIadGmNtEXRk4Z10ddaTVxTjaNPuWwCkZUV7gpts="
									"-l static multiple":                                        "uXAo4z9+jkxbwDSTsmwIEtk1D2XRBIl9jhpCIaDiwKg="
									"-l static multiple files":                                  "/Tag3mjtuVYZPkR8mKIN1erOjMR538i7HIwWYy78Dms="
									"-l dynamic single":                                         "INI7xCG5wx5JnkriIktnZZIZozW8mJLbBull4t3LuQI="
									"-l dynamic single with function":                           "6jRIfgijgLmgV7fvaXTWB8U+2AkNLK/KzEQEWBMUpBo="
									"-l dynamic --with-context":                                 "Fc22qQHNKKfbre/sToturD6OdDkxXpGoIiFFlxXw7Sg="
									"multi-doc merge":                                           "7EM4eRsaGvN2IZ5hTYVMfhd4LnAYzFwa9Q0sftXC4B8="
									"multi-doc list":                                            "uDLutzLf5K9r3zbvVFWMqLARGNkNr0NNdWl0iI4qT78="
								}
								upload: {
									"test cue package inputs prose":              "9fkXyacItpaVv/7CYfFiesZfuWY9BVjA8uM61HEP4eY="
									"test multiple cue package inputs prose":     "wm96Pj8dw+/oxwjfH9+H0juZBpGGorGsSruM+wG6sOE="
									"test cue package + other input types prose": "fdhe3orUnlax2wS/WPxNN0KoPevdwKOCNvLxMtaisVE="
									"stdin data":                                 "jIgboiPIilDeKaqdog6fAUBBcXkAUhvdDeXUj+ye4JA="
								}
								multi_step: {
									hash:       "OCKVFGF8567A193ROM95TGPLQP30KA3FPKUPHRPU311RFL6LLCJG===="
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
