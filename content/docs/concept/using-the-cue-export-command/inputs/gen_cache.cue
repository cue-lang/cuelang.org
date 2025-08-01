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
									"cue export # package x1":                                   "Xy9z7OJcqt6UhsrsMglgclzESY1TKMM33rQe0G59e1A="
									"! cue export # package x2":                                 "dqiep085w0lX0IEY9q3H4FyWJuHGTOvESSAJbHJN704="
									"cue export . # package x1":                                 "JuSwdxbSwdG1ZayZor9b5FdLEQ3QqGzf+bxcNWRSYXI="
									"cue export .:one":                                          "jb6AudRwnFXsO32LSeNzA5r8+XvQY4Mjm8ugygBbIEY="
									"cue export data.yaml":                                      "tfjY38BZWKGzA6+HQCEVJ9hWGjpKS6D2/f595OtgkCI="
									"cue export yaml: some.yaml.data":                           "SXD59mdXGIqBNF41RbV4Ex+CxKB+EOHy496LF/298WE="
									"cue export .:one .:two .:three":                            "ficGei9PaxzOsZ4tCCbzL3EUVqFwMQ9Eb+EOBEi09rA="
									"cue export package + package file + data + packageless":    "ogIxFggbfXLnZT7xdMWG3bGyVG86iONV80vLkbT/mJA="
									"package file + data":                                       "qJqpXRNAQuXezRiqK4z9f1wU3pH3nbn7V52CVepKUJk="
									"cue export package + 2x package file + data + packageless": "jjpgV7tjdXMcPGRHgDNy+U1+LLZ/QEWW5nHa82v6uIA="
									"data file inputs":                                          "Z3mqpz421EeS97KyusIDfU9UtdGYv6CTYyqmC2Ud9NY="
									"data file inputs failure":                                  "DFlbwwZ4eI+YTlS983/+dy3vFZsGwPGj2NROdGdWGT8="
									"constraint file validating data":                           "Vcl2RGpxRfELa1TeGF2Sz/LysVD2UmzJpDyEkyhkplg="
									"constraint file exported as data":                          "PuUkIznP1lugCIiqw32Gu9PwRqQx7j+pRslxeqDR5uA="
									"-l static single":                                          "tv5ebidcqE0+1o74xVyK+l+hF6Wr1hhlQt4M13kDTy4="
									"-l static multiple":                                        "FIUuEXrpb9mxfsMXnkdeGBmJVrzNojSfU/Wj/bkabUE="
									"-l static multiple files":                                  "ULgbFumZ//vHix/DLCuasYgy2d3pjPACYLVUEBlxtCU="
									"-l dynamic single":                                         "rx/Jx1a0Q9FuOXlWgEqoqQg3HlQYWdwPGMxfWneQKm0="
									"-l dynamic single with function":                           "Iyqh8X9WEagoPQ8AXGSPlkHUlMw1ap55O4cqRKHcdWc="
									"-l dynamic --with-context":                                 "Z1cvXqv+jXzFz1tX0amI1Uo7HqhKyZrfHzbG3ZkgPx8="
									"multi-doc merge":                                           "xIS/j6r4xvLEd5bGSNjT9oSWPIdGyAvbnSkEbGNDI8Y="
									"multi-doc list":                                            "e7b4VGOd8p7OFYl0rpmfFKfgmTiEwK70Y06uhzDPiFU="
								}
								upload: {
									"test cue package inputs prose":              "6XLnAyexU5F/bkfK/XkqqI7Ie9MwKG7dWGc3aAaxsgM="
									"test multiple cue package inputs prose":     "9eQ4JDCGPIsKW4psB+dNodQUzJVkUVrtyGcwIIBdy+Q="
									"test cue package + other input types prose": "RCMzIpVPN+W+nap/oDl7lEbZC9ObQizB5K2QClF6f/I="
									"stdin data":                                 "Sl8Qj9uBdMGDKyPTQBRDJPc1NudP7vMcehDbPL2ypYQ="
								}
								multi_step: {
									hash:       "5E5K54APSAJDNH3V69J2IDL4VFUHAJJ3Q33MNU37AH4MC78E8RCG===="
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
