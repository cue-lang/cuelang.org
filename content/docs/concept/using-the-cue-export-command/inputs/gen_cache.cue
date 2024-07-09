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
									"cue export # package x1":                                   "cMRKCTXds9/7GvbFevxPqxE7hH0cvu+BSs15OZHAl3g="
									"! cue export # package x2":                                 "vGgKTHhnXVn3tmYNkGQyaybxJwjpElZh+Hu7CY0kO1o="
									"cue export .:one":                                          "1MeKMl8Js2++it7Go0fFMTv1Ke0GZkxxAvwle/IsjBw="
									"cue export data.yaml":                                      "hulBp07/dr3qA8b5IaWYCOOtMOTLtUuLXV+taU76KP0="
									"cue export yaml: some.yaml.data":                           "r3i1mO/ISfJ3SxQ6Mj9R8T4aOP5GrnDgob6x4cU8MIU="
									"cue export .:one .:two .:three":                            "NL/3NeFccQHUOhqKTgqysyu0SOucDM97ZnErDOOY9n0="
									"cue export package + package file + data + packageless":    "cTpkkRoBzBXkCbXJprw5JyYVac7ZL2Ag/A0Tp7N1E8I="
									"package file + data":                                       "S/DLl4Dgydzui6fML94jVSV+vOo4GEC7UrLIRfM9brA="
									"cue export package + 2x package file + data + packageless": "QDrTHLEuB0Z0YQbqwgzCpZQt5DSQs6veo54XS87NZ6E="
									"data file inputs":                                          "JfCtDq1okf7kjkdzgGvauOtewDAzR6zLfwoHFC0c6uw="
									"data file inputs failure":                                  "7tN7lh2mXZmwOadRlsAAqMMd9F0N8ngKSHzBTW2IfaI="
									"constraint file validating data":                           "hIdhKQKJ7b0OL/nNq+nYtPlbRDtVjHqgVyggvJ2EEEM="
									"constraint file exported as data":                          "dl86DUj0UdMS3GLm5PluREHFmM4hVPnDEXArIZkNky8="
									"-l static single":                                          "TSdIF0DIBBabD/BeYkPB1DY4GbXBBVGlfALtmOT7Xt0="
									"-l static multiple":                                        "2EfnMAmfofVCtkFpsXJZko7NTG4Jwx3tJpBzHkGdGg8="
									"-l static multiple files":                                  "Sm8y2wcJ7RBNqccEizJ8I/jRzHHAnnuKKULoo3kZHs4="
									"-l dynamic single":                                         "ypbMCxYWGsldet/2W0O0HJv01pc8ctvBuELyGAP/NxY="
									"-l dynamic single with function":                           "OfOREtMN9R4tQmEtvCOmNDbT8OhChPatf5nqqGkECrc="
									"-l dynamic --with-context":                                 "jbc/CYGV/sVRPtnBe62ZQuOQb+76moU71WgRIZN/8z8="
									"multi-doc merge":                                           "FQn2U8lURg6bsWrHhIEqCoPrZdQx3ciPdA8z+JLP/J4="
									"multi-doc list":                                            "NZvblYJPZUbk5uiJCJhsU6knJLQgpIxdqgxDy5NNcJ4="
								}
								upload: {
									"test cue package inputs prose":              "9qwLjGb8kKFGtwfFpvZ9ee5e0zqKJWgg9Rm856ly6Mk="
									"test multiple cue package inputs prose":     "CoCS0M+J2RZj+dCGd33nlZo0AsiEF3grtpJ1bY+Msyc="
									"test cue package + other input types prose": "qCV3WhSGPt+aULqFlD5gZfCjfwMDFNYvrEkkjX6qAmU="
									"stdin data":                                 "RRwFujfB79LehZuiHrhIAAc38aiZHjyN67XKfFvgPig="
								}
								multi_step: {
									hash:       "MB5R85T7CCHQ5ESATAABOJEFNQQJTB01NCEDMK4J4GUQ1UT9LDMG===="
									scriptHash: "TEH5SA1CE9GSFQAUSDJNJFK9VIHQRFJD8JCU1TIP2S51SJ2MI0M0===="
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
										cmd:      "cue export .:A .:B pacakgeB.cue"
										exitCode: 1
										output: """
												could not find file /home/runner/pacakgeB.cue: stat: stat /home/runner/pacakgeB.cue: no such file or directory

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
												# package* input with a <u style='text-decoration-style: dotted;'>constraint file</u> and one or more other input types)."
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
												# positional parameters."
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
