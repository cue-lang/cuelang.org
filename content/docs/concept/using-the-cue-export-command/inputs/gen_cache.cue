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
									"cue export # package x1":                                   "5j1PYbuwzbtmQUQOD12mpUPksFdC1QUDcxisWAIB0ps="
									"! cue export # package x2":                                 "MZIQjh3RjjNMAVQ996XTp5OEzZnkTE3A+f12kbsfWEY="
									"cue export . # package x1":                                 "XLXHI/xq9JNVhme6zMRQiudwIR+s3WtPqwQHyCAbkZw="
									"cue export .:one":                                          "cnLSZmyO5Ql7npV66AkHdPxm6jlt4ZhXYk25RW4DdIA="
									"cue export data.yaml":                                      "SGhoK5nCqkDQzLbSujnj7aBZcMHUeqzDirwhb/gq2no="
									"cue export yaml: some.yaml.data":                           "gsubqgVMECBwaIJYGkWC6kt1TpIn686JsJWsq8Cxr6M="
									"cue export .:one .:two .:three":                            "HPQWiazYPy1VLN7tUjQxf62l3d2tbRw87zpj4I00Zvc="
									"cue export package + package file + data + packageless":    "aN3qkdmvQBvvm+ItnPoFQrsWNDH4DWWog0PBjngjXog="
									"package file + data":                                       "KizB1fG9BTtvIIYmwJuM4anSgqLpMjIS4fznxubkRu8="
									"cue export package + 2x package file + data + packageless": "6jUXkp+ONOdNqaJzaSt4uD8afAze33rPzV71mOZejkI="
									"data file inputs":                                          "NrTxfQ5duDnAJJrIjf/LCE75kBSBFflJbApz2yvqMsY="
									"data file inputs failure":                                  "LK5++7aFWpFN2fveXtPRj84SBsrGp+fdAVAySoCgdy4="
									"constraint file validating data":                           "ud7sFSi+wvu+5ojSVGw4rfQjR2VWkl+ReVoJfASAESU="
									"constraint file exported as data":                          "zVrTDtCm6rzKaUZa/E+nblYdZxqp5Z04sNy9zqKoMps="
									"-l static single":                                          "yMkInwiHZ2FIHsQ8AWZvN0WJCphbmMUkm6FROGGuFTY="
									"-l static multiple":                                        "cmIyP6OfmSrFYOaDfdOfzgj1olBP8IcQe+fbg5HAT6w="
									"-l static multiple files":                                  "EMtJJRgY6SMhtt3E96SCyrhQ/WMSlmWdp0JhncZGiQo="
									"-l dynamic single":                                         "bS/+VZBTI1Yibsrio5JxAjC1GQUalc0XMQARygdx9y0="
									"-l dynamic single with function":                           "HdkTA9K41SEGUg22DqD6yfVzD9su31agc4h5JMZ71pQ="
									"-l dynamic --with-context":                                 "9+Z96VnS2vwfDhF2bfZHMjAiciTHQ4h8cwwsapskOZM="
									"multi-doc merge":                                           "65mIQwBo89mtA1Yji6mmXH/Yli4agaoKntuEEX3zOTg="
									"multi-doc list":                                            "PcNYST1DWDDJPChoF7/YkME7JltsUFatGFT4Y+WTN7Q="
								}
								upload: {
									"test cue package inputs prose":              "l5Y8Ud/j2jQI29SSKoPq3Hee5rifMS3pyJl7eRdt72A="
									"test multiple cue package inputs prose":     "VLsfhvGXEa2G2YAXReqj4UiE74f92t87MZBYSv6CsZs="
									"test cue package + other input types prose": "kY/al3GeiAkOlWHuZTqpeXEabSoezLo3Fv/IQSa2UlE="
									"stdin data":                                 "sjho2qZvKJbhj4kSAAdWRF4fHKd+VUKhv+lHwI+IzIk="
								}
								multi_step: {
									hash:       "5FG4DD05S9ML59A1K30CC32OH0853GOTVGTSBKN3LE65SGGBFR80===="
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
												    "y": 2,
												    "x": "foo"
												}

												"""
									}, {
										doc:      ""
										cmd:      "cue export .:A data.yml"
										exitCode: 0
										output: """
												{
												    "y": 2,
												    "x": "foo"
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
												    "y": 2,
												    "x": "foo"
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
												    "y": 2,
												    "x": "foo"
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
												    "y": 2,
												    "x": "foo"
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
