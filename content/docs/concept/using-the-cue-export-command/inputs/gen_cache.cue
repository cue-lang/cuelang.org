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
									"cue export # package x1":                                   "EfGMI8LC4oqSF3NXlYYkkengDP1/YvMMr6xGWOP1qN4="
									"! cue export # package x2":                                 "NU2koHvvyK0LWRuKpxU5qa2nv8JAX8fRxnD4oHxrz4s="
									"cue export . # package x1":                                 "VO4sLBe7I46vpj+SlzqGENTG/LMjLaxXGxoiCcxJrt0="
									"cue export .:one":                                          "sOCX2FDKUzCumXPc+Jzfy/sWhJtW6GXmS0fsxydyyEE="
									"cue export data.yaml":                                      "B44VkzM9zASY5R1AeWANW1IHXZmsDjwrL8v7zZ6b6ew="
									"cue export yaml: some.yaml.data":                           "EcRP7+40eMAEGLIFGlBXc0MpK5800Me9E7PBffjyHXE="
									"cue export .:one .:two .:three":                            "iPH+OOFsPgRKQF20sAS8FX+Y0dKAAEPzs7CLaGAng30="
									"cue export package + package file + data + packageless":    "QUrcm+XQosOaDISlTKxPOzj1xizAN/4jSUqqVRPoXno="
									"package file + data":                                       "84517hGTvl+MdQtA+sBbTTe5BPLdDHvnj/GyBfKsOS8="
									"cue export package + 2x package file + data + packageless": "WxxKNbDvrUXzZtBZW9/GKsKMG6wS6UDGHI8PZwVj8J4="
									"data file inputs":                                          "7olTyOTN5lOCYyGdI1+GKCPmOjc7MhZGTuHL8V4Zy3A="
									"data file inputs failure":                                  "mSRc8AHQE2SUdGvHf30dnUNVGJE8qjk5/jqSJbgn77U="
									"constraint file validating data":                           "xvy6IXscKl7k5jiofgATTIY957s9r8DhjQi1Z0obzKs="
									"constraint file exported as data":                          "k3G9+nJDq3+HVQmqe45kGQrteS/GEXqaZ8DRDA64R40="
									"-l static single":                                          "ljNg+ALWKqFupALkauPmOcS+GMDRhVxpD+AzCxbe4BM="
									"-l static multiple":                                        "sy1cU5sK3TpM7Eqv4AWnurIMYOw8HiubBLR0ABJlqYc="
									"-l static multiple files":                                  "ovYBatv4/FQmSwLAf+XSlchc2SubTnwQO/RvcE4P5pQ="
									"-l dynamic single":                                         "xY/fTtM9Nv7ry8JWHNoGXf29bHGLfrvGpDyMS1xjnj0="
									"-l dynamic single with function":                           "DQRv5sLkmwCO27RiGQX1O5UMHJPfHBuATvXF1mcBHaM="
									"-l dynamic --with-context":                                 "1wb/uOQ/1IM7BnQYrvNwGx0MwFmmfHTTbWT0ngQX3nk="
									"multi-doc merge":                                           "Oj/a4i9+IdX41IIQgWRAlqXVza1aowkFQ0pmeezWZOk="
									"multi-doc list":                                            "enMexbmyPd8Mjx0ivKVPPtKKcsbrEdUZsHBpWBudmSU="
								}
								upload: {
									"test cue package inputs prose":              "6o1dMf3qeE2dvSeUn58AjbGL0i/C6QO62oafFokhcww="
									"test multiple cue package inputs prose":     "ppuQ5e0qH3yutoiFnvSWXNHnBuot4RX1avq6cc7NAU4="
									"test cue package + other input types prose": "TfKK8Gt5hUH8GyfUBdAHSG9wwghbidt/XxypbIAkR9g="
									"stdin data":                                 "HR7Fv4Ro8FLijYli30YB4opGHgVVRJr2JwIJfjWXXg0="
								}
								multi_step: {
									hash:       "TJGPU8FQT5D54MHP1DGQG7EQ0I4KF96MOKRS0UM6AIF5CAK0N4QG===="
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
