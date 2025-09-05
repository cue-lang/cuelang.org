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
									"cue export # package x1":                                   "VswIoe+t4kdsV+4dnV5lyJXtJrhTVFbF7t+DNaHyeFY="
									"! cue export # package x2":                                 "LI1CY3cOvjII7s/8lcJM3E4ZAaVOxGIwbqeJgY1CINE="
									"cue export . # package x1":                                 "OQp+OC9f9wO/nCfwA7u/nVRaJV5Fi6QXRFA7GlH/QI8="
									"cue export .:one":                                          "7z5IsoV0sLhMmm1LgcKkG99xLmSeQMgNFlf7EL6AbTY="
									"cue export data.yaml":                                      "V1IudpyJ3ROBJMp7vtdvSHgrn4uYUZARFtMhKeBNvu8="
									"cue export yaml: some.yaml.data":                           "4BA8K/bnRHinS0+Vfh/Pi50hAIIM/zR9H0quYJ6pzbc="
									"cue export .:one .:two .:three":                            "f32/zgH6X6uE2Y+jELxINZgCY6vAuxrmPWx48yokAUw="
									"cue export package + package file + data + packageless":    "9AsxfydjPyBfRqZIB6VzzQHVaO0zYiaKD6sxjoK4u0M="
									"package file + data":                                       "mBEjI1s3gd81G1XlYTk+9/r5V1IAeu6frah6Vq3MK2c="
									"cue export package + 2x package file + data + packageless": "PvhhWIRba/PTmyg9nB0jn4ZPS+4ZsYYk2HdAl/JobCE="
									"data file inputs":                                          "020NkMu5MzVuLOqz+YbryYqbrhGZXbcR4ezjOW6Ltss="
									"data file inputs failure":                                  "hvBN22wKbVuyQR5pHnLdiMHz+tCN9Y+58CDjbgFyR6A="
									"constraint file validating data":                           "WE3USkjYu3SQBzRh4N61FON7snncQMlX4f83KJXZNDU="
									"constraint file exported as data":                          "JpNsFxPHBviF7LxzcAU4TmF02JA9UwvptAVx9kFGRIM="
									"-l static single":                                          "l4C3BvhbXpxiIbaw2XNQzBj8gMBiTSoBME5AzwAi8VA="
									"-l static multiple":                                        "zQzPCOKiNXY7FgIiTMWQpl2mfIrvxN3KmAFQ7SZYwgc="
									"-l static multiple files":                                  "qNOnHv09a1Oq/e7CtEb4v30R3/636s1zzSiyR80hdqQ="
									"-l dynamic single":                                         "SQ0swkMcyNWe6V7XpQlyF9YhxXlvkohBbA46eQpqQp4="
									"-l dynamic single with function":                           "ICkqx5jn9Xx42vnhaFG9MOApkO+GxdPH3PtefPPYAVE="
									"-l dynamic --with-context":                                 "uI574MPvxY6CyaJaNozP4D2ZDBzNeSF8M3LFMw8q47s="
									"multi-doc merge":                                           "QypfN7woOPhDagwNm1F2lKbUrQohwFJ2O+929dL64fw="
									"multi-doc list":                                            "9YmvvfR8oaY6AFMDTl4Fsgff51dAvf9INleUISuMZMg="
								}
								upload: {
									"test cue package inputs prose":              "jWvx8HfxkrNQUZQgMBZyiacKbHxsRjtAE6L8Kr53YKw="
									"test multiple cue package inputs prose":     "246h1wfhHxZvxBsPGcfPfw11GU2iiZg4gVJqg6AHC50="
									"test cue package + other input types prose": "v+GzJ7Ze42tzXpyyqBlqD9NmUY4Nz92XCt+xKs7zxE4="
									"stdin data":                                 "/kQrl/rN0OECxHHLeepTSqiYEwq3rOOHjSDhatUKHV8="
								}
								multi_step: {
									hash:       "35KSLJSVOPF3NR70MP4CMP125UIK95RSAA74DVJPAHPS458CUIP0===="
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
