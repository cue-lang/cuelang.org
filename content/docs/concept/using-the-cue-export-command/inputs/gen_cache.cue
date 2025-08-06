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
									"cue export # package x1":                                   "ktgS9jBryxes4C7x6FYPKqZlpOdc5SZEZKg8vh4DdUY="
									"! cue export # package x2":                                 "FHV20xJ/KqpDoAYA3bI+3+tWMP+hRSwx4V6sCJZjPY0="
									"cue export . # package x1":                                 "0SOSXUB7Twqhly8srKru+4p6vFxauifGrr6xXcDnHVY="
									"cue export .:one":                                          "09gudE/h1vzTI4oUiI6fghEcHj2HQzQwzTZe9xzmReY="
									"cue export data.yaml":                                      "+UIjslfFIECOKfj3xIk3+ob6d9VXpGMAJ217sV5Cq5A="
									"cue export yaml: some.yaml.data":                           "adBe+oesVGUJEoT5Vy2AqxIOPp3Bvz61kJbU2BYLK9I="
									"cue export .:one .:two .:three":                            "r2VxQhqSBx22RuACcSQrlamAWE634pMIl7F/hdYAz7M="
									"cue export package + package file + data + packageless":    "/ym0RJo1jruaejTMQq2v6/DxotWDJmGZ73kyuKX4CBM="
									"package file + data":                                       "vF51V41jio/PFk01EJ2YqIi2TdeZukLakxaSW/H5zlM="
									"cue export package + 2x package file + data + packageless": "7nERIUVkqDGFwpCHEIy7R+ZaVUpOi17/ztQ8MqS+2P8="
									"data file inputs":                                          "bTt4owLipx/bl02r80P880/Ma0U7pd8wJZT44QNwI4w="
									"data file inputs failure":                                  "cuKtnuDzXn0TfwV1r+UZ1clfDfFhpImDPfVIbCcwQvo="
									"constraint file validating data":                           "l33u8cnuN+yVoMB2+rvVs3B0CuEjyPC/eKH4rpV/2Lo="
									"constraint file exported as data":                          "MaTFRurfIjb6cNScuYmiAWLd5+HBbh3CwSQtMEiHxlY="
									"-l static single":                                          "DfG4tLiOcHamDsZfhr9P9ztkRyBu600jUIZgYyrgOEw="
									"-l static multiple":                                        "jxrz6qIbrHz73VXcnvQJ9e1cxZwD00B7CYQPdyYTSNM="
									"-l static multiple files":                                  "4SmR2wS+XPdpnLd9jaCWmT7+ncoIXBDwczielFeT1i4="
									"-l dynamic single":                                         "DCvsfn+gvVtPYtLOqdD1lSRYpOSVNgRtGOe0NxohcDY="
									"-l dynamic single with function":                           "Dve5CngUoyZQEqQZvChBbzda8aVx+Mw0DmjYqYUMi7k="
									"-l dynamic --with-context":                                 "fTza7zkw689j56W30CRc/vTZfRlFFjUqO48SiQ0Uc7A="
									"multi-doc merge":                                           "h9c8Ps7LEhkpbDEoY7gZaC+IMV27VvijuC9nWezAWFA="
									"multi-doc list":                                            "zoFllz1bcZqEklm6j+t4O9RaYWdRv3GsWiRTCTuKthc="
								}
								upload: {
									"test cue package inputs prose":              "Hv99AYgDKCMi1DxyCO0KtC1IRI2ZPiN0C9VIYcUPw+4="
									"test multiple cue package inputs prose":     "8wZfJclaR+YbnuNaBw2GnsZVgi1waSs7sf3h5eFoQLI="
									"test cue package + other input types prose": "f72Z324P0Z3PZiqwBNR0sDzqHTGNTes2C+fb+AlXq5Q="
									"stdin data":                                 "wn4E+EgTNjoVoQ++voAxvGq00E4XwAI585UkYYORZ8I="
								}
								multi_step: {
									hash:       "ND3S800B8RQNKEU1HUDGKNVJ1KU42NI3RQL0QV06H372GILCC80G===="
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
