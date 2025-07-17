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
									"cue export # package x1":                                   "5rDdOAZ2LR0Ar8vLOW+j4vtDkluJ+6NCoGjpJMrVX2o="
									"! cue export # package x2":                                 "aVG4RYbo/5kLAeZl7iUdd4K7+ahP+FTXoNZP93fvh5Y="
									"cue export . # package x1":                                 "nokyli66CQpliAyjfgl2JUAkCTJ2rPIlME/YchJ/Vis="
									"cue export .:one":                                          "/G0LvxYgoMfmHB+gsDw7TkZ0iBc+kMfHWs9q8Xp7G/4="
									"cue export data.yaml":                                      "dBAvDY3aLx5eeQOCqS4tbCFk4UXs+h0QpQvENcyPDPE="
									"cue export yaml: some.yaml.data":                           "v5cVtAJRBUbbFK5HpYINf8wrAdgmiG8jSyBuqEqoALI="
									"cue export .:one .:two .:three":                            "i3peK41Wc8CnpR1hBJkxRPCmV1DfEuMQLXTPOOFoygE="
									"cue export package + package file + data + packageless":    "mPvuxya4gigTx8miYjJPUVZpaO8zX+ySuIZrh70IYLw="
									"package file + data":                                       "M+m3O2ncfciUxs0Vs8uw7PoTZmqw21r7InHEWa6/nk0="
									"cue export package + 2x package file + data + packageless": "mWl6VxKCOfaOLvqqC36yB8ap7tRSgDd0aWo6RyP5UnA="
									"data file inputs":                                          "B++ec75OVaGs7CVieToGYUFA5lUCUr2jsVQ6FpYh/zg="
									"data file inputs failure":                                  "NcDh+U5fEtk9QIaBH4X95nitNMjBMktcXA3Nq9vVeiw="
									"constraint file validating data":                           "Ybr2Zh0fDElbEr8VhIIX6HWtgzdV0f2jDal1Xw+F++Y="
									"constraint file exported as data":                          "02DelXXp45oTlknZpI4K8lSWgKjJFjLSCyQ/NT8EbCQ="
									"-l static single":                                          "MAIu+HOYkXD7lltFiy3vfRkMYXE0vJ+qQXU6PzExynA="
									"-l static multiple":                                        "dO1CMhqEG5yci9RmRMriOm1ZOrtv5DW3mlr0+i69zpI="
									"-l static multiple files":                                  "CBXLKUbjziu35HE0UfTZurZEfcvIKlthoJIVks6sJ/U="
									"-l dynamic single":                                         "Qtck1zQ/hjxOWolEsKu1s7lKw9mo+sB62M62BEkoXj0="
									"-l dynamic single with function":                           "U2xdYV5UApuUshD/1cBSAkPKIjzND9BxGGVdfZXGMos="
									"-l dynamic --with-context":                                 "xZ6lFCemNjuDwuviYdch4zf8BBoQJZPm92vSjEJhX5M="
									"multi-doc merge":                                           "sFWwlZ7VgBKLnfhM0uKncKIc85uHAPeOpibWZK9ZJQE="
									"multi-doc list":                                            "sh6Z9jRZCWciyE9FZOcsP2eMwPbavL/gdJwdb8G78M8="
								}
								upload: {
									"test cue package inputs prose":              "eRAhafOgmD8MxBD653F0S9EuxHOZG3goP4MBWUgw1TQ="
									"test multiple cue package inputs prose":     "LcSRDHzBQY7ABpRbWwMeeZk5YfnjSE0YGv+N30qHXUM="
									"test cue package + other input types prose": "cGOLvsnrkY7jFRI8XZbX8CTkAyI5nk/xKA1b+/c1/7c="
									"stdin data":                                 "oGB2b+iZuDbbAHRpBEtWysz1FtrcEOFZS3fvzWz5Qsc="
								}
								multi_step: {
									hash:       "90OLID3BAJEJ6TN7ARIHGPAR0LAQFHU75E1B0SQDSU4PQLV1IT6G===="
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
