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
									"cue export # package x1":                                   "hftrM9ta7nGC7+K0wgujgQYmdNxVWqyt8JyQlsQsEaU="
									"! cue export # package x2":                                 "FtOGJuHnQ9TLuWTRiLC2Bu2CGvAR/HLBnGmWFn4D0E0="
									"cue export . # package x1":                                 "goYhbpn8xbqzwFz1dZBRRyiClNQmLWwQyZFMk4BJGO4="
									"cue export .:one":                                          "D+tf+RTjqOx3JS7JAgsXCRnElelb2Zo5EsEo0kHWFKE="
									"cue export data.yaml":                                      "V8S/Lb+8p5Vle2h6fFJuhoo7T+ItinHS2LYJ56/117w="
									"cue export yaml: some.yaml.data":                           "GEFIGFLzHyCQS1HpxBM0eATnbbeWnEdDMXc7A3fBPmM="
									"cue export .:one .:two .:three":                            "ivGX27249qsOU5F8Xs2XE9zgwQcYRB2xCQFVWhco2E4="
									"cue export package + package file + data + packageless":    "xP4+s+VWYkKPueL4YEwxc6fJfiKyd6SAJr3JHAlqn/U="
									"package file + data":                                       "3VRtFlvpErFCZ+VYsi4ZijG9mejSDRDoXrtK4kyBSMA="
									"cue export package + 2x package file + data + packageless": "xiGxIyuUCihZoKJuP8/rg9OmcgN53MbQ6xxetaPUdIM="
									"data file inputs":                                          "s6YhREXD0kBK+gZNVttjwWrOKUGaxqwKCRHUb9LXXRE="
									"data file inputs failure":                                  "1nZdKfMGXiVdaaGlNMCH1j2ZdBQwIzW1WGu0IeutBUQ="
									"constraint file validating data":                           "DygdAk/CSyW12qvdN659PY2/ijotj8lYFnYSxxL+Xmk="
									"constraint file exported as data":                          "roBU1fHUTFAJa34o+BhRFYo4rYrp2qeGmzyp4J1Ddfs="
									"-l static single":                                          "iHUOEl9nau5SSrafePiZyFnExmSZMp6/alUcY2YJzZw="
									"-l static multiple":                                        "rkMauY94pfOD3LxMzya8Q8xBopfmgZU3uxMgQ8aFbC4="
									"-l static multiple files":                                  "ySFGPZwCBWfUu+5xE0FFdqlb0eFxf6qaR7bg0MZP8EE="
									"-l dynamic single":                                         "x6eW9MR6Qjl8M9u0NuoNofLHbcrpMk6sUXCEbdee4BQ="
									"-l dynamic single with function":                           "KxZaIx1tszojX+6e/x4TXqL77QlKuoN1MSDWddyBvls="
									"-l dynamic --with-context":                                 "370Fgzt/muNO+YRoCRY8o6V3QgO5UqJdgyr6lLrgANA="
									"multi-doc merge":                                           "anLJN5NKRgawyxp09pxli0tBivIhfvX6s5moKs+xTMg="
									"multi-doc list":                                            "nxaEO3aQiQNToCl4bIa+JX+9UK3nbI4aVIMv4ZSqaL4="
								}
								upload: {
									"test cue package inputs prose":              "+MYfyQCmfrcSf5tHsGzYzk7slZlgHrsO+ZO+WZwlnt4="
									"test multiple cue package inputs prose":     "zd8nviq6TqYuhcQ9pCr37L2h5qup3Be4H9mjuVHaAT8="
									"test cue package + other input types prose": "VRmAMTBEqLQJLrVmkn1VMfdjGAEa07GSV5mMKG2RtBQ="
									"stdin data":                                 "hJjSHWkeN4HDqR8Vts20ZOQj0ZN8Pyu5oGSvk5CpLeI="
								}
								multi_step: {
									hash:       "EANLOO6AN0FL0SSTOKSDO3PP7RSEMBAAA82C3G988M05JR843L2G===="
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
