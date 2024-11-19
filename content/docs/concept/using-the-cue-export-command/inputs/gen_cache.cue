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
									"cue export # package x1":                                   "Ho+mk2G3Gs2H4XsojIcOvusTi8Rd+ZTLK9YS7aLdKQg="
									"! cue export # package x2":                                 "eJFQg0lMWsSjtroJciOUZF5TAf3CN8wztlgdewdX/YI="
									"cue export . # package x1":                                 "4KqRAf2UfbwM8HmgGsAPoKwgguUrNUWmBT3mHHBmu2g="
									"cue export .:one":                                          "OMe4olLrnOTOu/wsXCA/IoiuQ/a9t25aoaWNhACTo3Y="
									"cue export data.yaml":                                      "GrIA3FeVa2OPidhbrhiF/rXZlHALbmhOcdvOmxOTgrQ="
									"cue export yaml: some.yaml.data":                           "PKllF72TmmRnD1TnK7SFiL92FUhihU70VupgQwkoS0M="
									"cue export .:one .:two .:three":                            "jDxhfeHDPoc6yBskz10PGSupU+6zOS0Qx98SaHVOEuw="
									"cue export package + package file + data + packageless":    "BgrWGcRXvN+auyNRpNx7Qubq78e/iH09x61dNmv9oOw="
									"package file + data":                                       "Oih3Qe3MWJFTuECVeKC3zq7hQ+c+ou+8c18v8OrOT3E="
									"cue export package + 2x package file + data + packageless": "w+H+COv/Wy7RxVvSl9yg7TsP2v35WZUgu5qDNd+AN+k="
									"data file inputs":                                          "KrgCmugr1SaWW9AkVBupIztgc80pMsVJIEu2vhxexbo="
									"data file inputs failure":                                  "SDhUVRtOGLjFgmuRzEXXaSH+D6V7IoIcmxJaXoB4J60="
									"constraint file validating data":                           "UoJ07ea46rc5pmdn5l8qLlVVB9oh8T2smVxGy++u2Vk="
									"constraint file exported as data":                          "9oFkvGi0Zo9SaE56E2l5oMpohgYr6cCPCj9zSdn6qlg="
									"-l static single":                                          "UgeC70v/H0oZN0Y8CJPwAiP2X1mF+fHjUYNc7qq8Gcw="
									"-l static multiple":                                        "FdCyiRpxHDbshkUFr/yKqtoEzZ2VNOEUWuiZzUy9PDY="
									"-l static multiple files":                                  "7n5gPzlLiAdhCSpX0AFyjBX+8zcnvFQRG7chGS4vCco="
									"-l dynamic single":                                         "nZJ1zlVi82WX1jfh38YW+iISYUDWEzWD7C4QzwO8jAs="
									"-l dynamic single with function":                           "cuOdJ2mSpBk3Lm0R6FVts0YcHs08wlr+87ebZ15hrk8="
									"-l dynamic --with-context":                                 "qiflowrXAmBLUY1cbtVujDsTJIpJxc/eY8RgYGTIC4g="
									"multi-doc merge":                                           "pQjC71k3oeibef2+xnj2hUq2rapubTT/62mZa4Kjlo4="
									"multi-doc list":                                            "6koLf6LWVcAOr3mqh1xCTgKY+j4idj1B6bIptAKmugQ="
								}
								upload: {
									"test cue package inputs prose":              "xjYbc+OwAA+w6y/XIQ49DgdTIa2E4iAGAJL48ZhZyUY="
									"test multiple cue package inputs prose":     "4nqF84TtciCU0X0GG0M31Z4UozWaByHIQcVdlyBaVaA="
									"test cue package + other input types prose": "nGLY+Jg5FtIq0kOwiqFDpLr13iohBt1O4ICgHW1CnjQ="
									"stdin data":                                 "aHifxhMohsQMAeYuUndAY7zkZHrE5qgoxXzEPwExm68="
								}
								multi_step: {
									hash:       "8LQKOV8JHP8MQ3GV5GDFMOH9D05OJGLO964PKEGC7J8644S8GDAG===="
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
