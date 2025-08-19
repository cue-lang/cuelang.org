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
									"cue export # package x1":                                   "HJsdB+QTADWiyucAVTc9Of0ClTRIpwuf0erUZc4AZ9c="
									"! cue export # package x2":                                 "JE2hoX93faHTu3OXsbXCZWh/2qapohazVIbxOU0/ShI="
									"cue export . # package x1":                                 "AlULdMJ1x1kdoBb9LySDaETHvZ+Z/TRxcgUbSu4eC60="
									"cue export .:one":                                          "k/li3wfnrBTi6idZsgBkSCSFqrie+3s/D7Se1QkYRzQ="
									"cue export data.yaml":                                      "n5yCLDIbyal1wPiC/JwyPdt+Zmx6z/jqqEEmjzfHrVE="
									"cue export yaml: some.yaml.data":                           "1b6Xqh0NZzNh4FRMhjvwpwfBgLxR/0p+gLAhinK9TQ4="
									"cue export .:one .:two .:three":                            "F5y85GEaKHB1ANabHR+RF0kniZKFBAQKV4Tt5ohzyS0="
									"cue export package + package file + data + packageless":    "LyQ6pQtqb4qRKUwRgAora8nl4sA1/bA49eXSAqZcg+Y="
									"package file + data":                                       "x2AWTKiod+fP6GwM3z6f1MNsR25/8FkFOCldRRTFiVA="
									"cue export package + 2x package file + data + packageless": "zrlpsSYKdMrUGPcYp9HAc58E2z49+inEIFimbifitXw="
									"data file inputs":                                          "5CGYleHGUnpt10wyTNQFxxA9Bup70s+TIXqQeWbs5G4="
									"data file inputs failure":                                  "GCLJNTuelRqNDNxgBuxoVqlyVjNu3vLV604MO/v4IOk="
									"constraint file validating data":                           "cut8WWzeSmsxUBuNVRzSdvyx3l2huEUedVbsoz87msE="
									"constraint file exported as data":                          "0nyIpToSNCSJ+d5qNDUeUd2lUVv34XML5ED9lPOdOGs="
									"-l static single":                                          "SOap8Lu+Owma3L1dYUdBlOrZOr07GzI9CilvMVwcm9o="
									"-l static multiple":                                        "Sux6PpmY0l5sxOV2igEpe5OWA4H4RTFeyelzGTF+Fig="
									"-l static multiple files":                                  "quLPbKw35UkpRNQ71VB3PDOEyGBiUH3QL9Wl9awCAG8="
									"-l dynamic single":                                         "a2Wea3cPqmXac+boO7BZfLf95nGCQum9ihADbjB1pBk="
									"-l dynamic single with function":                           "tCxTrVJorsQbCLXK9TJYmrSKLyCogff8YEWS5/CPt2E="
									"-l dynamic --with-context":                                 "01pf0A33fn49fQHhVQaXRnJzpGPYZ5jMr470fv8WZmg="
									"multi-doc merge":                                           "QvSqvMZCuKQkEQM64vQiSEyXhnqLKEVZ1wKGSNqfDlU="
									"multi-doc list":                                            "U24mqx6EePnGGUNLEQofGEFdIXdTvZCYh2jjZC9VrBk="
								}
								upload: {
									"test cue package inputs prose":              "okZS34OL52eDMGrpN1IEpofI8YmcRPP+56fmJx+iC2A="
									"test multiple cue package inputs prose":     "D3g8va5ivC5ux4x4QhE6LGOaNPLQn/6dZA1bCL4ymDE="
									"test cue package + other input types prose": "tMAXCM+hvsYjCn/hI1xaShcbTxX8pUrDBhKTDsvO2FM="
									"stdin data":                                 "eIfTXVro8WXVAxWbbb3vnh6kLPXUJhAshqj9RxBmFWU="
								}
								multi_step: {
									hash:       "JF5JPAUA6178MHKJKTGM6ESFCDG1S02B9GPTLAJCIF6V33H1HSGG===="
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
