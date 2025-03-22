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
									"cue export # package x1":                                   "om9dIkcucG5NZSZSzllS3A1vrNxfW1PVP4Xv8t0kvGw="
									"! cue export # package x2":                                 "pVL88uXRoFbSOJoh3X5p5NBqc7zvz2yFo95kKZv9MgU="
									"cue export . # package x1":                                 "mgnSHOr3g9Hedt6ttdwemfvKVkji70wUEpVltJRrUF0="
									"cue export .:one":                                          "cK/CBg9E+dMwQWzXAAJac2ZFhrMZaY6I6QTF1KNXPPI="
									"cue export data.yaml":                                      "6kUF+BvtV63CUX+OS0s9QiJOv1UbNlMDvqIHleTA8xM="
									"cue export yaml: some.yaml.data":                           "RhiJyOnrk1D81pBwDOhVJAf9dn50FxJWcGhbYQ2xrYo="
									"cue export .:one .:two .:three":                            "7E8qDICOvgPo6JJ6aAaxUs0SkSukyYvyVPl0tJiMKhE="
									"cue export package + package file + data + packageless":    "P7VPmgPRmRiIhck1LhtpwXPZ59xd2UBDbLCrKSeZTUQ="
									"package file + data":                                       "0TGO4K/YzUr1Omnx0GDFXZt1xknnelo1PC6TkgPfIRk="
									"cue export package + 2x package file + data + packageless": "POjRhz3ArVJ9j6Svx/5R/b6NXQnNXGy+76p9QiwIy0c="
									"data file inputs":                                          "b+aW08fdg/0taa16r6rbe8y4XGGE60E9ATVwts5dz0A="
									"data file inputs failure":                                  "Ox0HIka5HMiDSfOnVVnPJmlHq5AF5nK/Ed30OjC7l30="
									"constraint file validating data":                           "HKTr//lWX8Curi42On92vbJmR4Qk0pejqDJm5uQ9td8="
									"constraint file exported as data":                          "nchQAkYMSqW0NnLW841mWnrAPlWIedOQVzogwiJ0PdQ="
									"-l static single":                                          "oiASqul/84Mf1KhP4HTNWVqKgsLn0+BIBDydmXQGYc4="
									"-l static multiple":                                        "iI1vJRb2MjP3gwDs1wiPwnj9AOkAbNk4pXHA4KOP3jg="
									"-l static multiple files":                                  "7KVat7QxkERAS9f6lKgL+rsMWtJqq0d134qsTcTIwiM="
									"-l dynamic single":                                         "WVjaxbfXX8nioS00a77I4MuGl9Y6NEwdTl5i8sje2cE="
									"-l dynamic single with function":                           "pvabtnEgvZmCrRHCepEzYwxUeuFf0rsR5erPZaKe0Yg="
									"-l dynamic --with-context":                                 "9BVwtXFxgBy15zDVZVj08KSMNA5SRpSABXqefkT2ZdE="
									"multi-doc merge":                                           "0Y96y9d5vmi/536hKGhFv9DHOUkBGmL7aGrcPzN2/FY="
									"multi-doc list":                                            "Oiz2DyAIWTiApboHUDUKHh19s0Oe4hbD516LJcT2A3o="
								}
								upload: {
									"test cue package inputs prose":              "Ow6dnbhKG/WqbrMH3XHao2DrNwWic7wB+3VajWyeoLM="
									"test multiple cue package inputs prose":     "XCRVHnBY811TOVKe5mD6m7SaZJ65OGDOdns3Cj79ptQ="
									"test cue package + other input types prose": "auIhqklwg0DNi2voDGo7POH/vjZd6YgE9/wPHRYwsq8="
									"stdin data":                                 "lFMN0pAET/vZVUuy5t+74HtMSzSldgxhPPkINvvlxlA="
								}
								multi_step: {
									hash:       "14315SFDMGE6AGV58GVQTP95L5LMN55GT8MQEB2VUSAFPBSSMLQG===="
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
