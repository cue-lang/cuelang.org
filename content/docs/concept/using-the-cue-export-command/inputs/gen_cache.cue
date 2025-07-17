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
									"cue export # package x1":                                   "SvFIuNYbWPQSuY161W3LyD8naO6GWl6ygxWKV2csYks="
									"! cue export # package x2":                                 "D25wr9am8zRAekSYTXtSR6GsRWCMKLZsoKbFPR3UCUg="
									"cue export . # package x1":                                 "nSm/BZHEEg6QmxxcRrs/Vfh3N4k5zpJmBR+qNdHZqgs="
									"cue export .:one":                                          "dIBW7nfuMAEO2XUBqH1e9dQbPR7Vm78TaFfKIdqMpAw="
									"cue export data.yaml":                                      "JPxwLIeSsBFMAn5ZDZIywBXFRrZEz7HTqktVE6azD74="
									"cue export yaml: some.yaml.data":                           "RGThPX1IqYKZ6Z94/AlyTPTGcxYzBIHEQfevAQEAV54="
									"cue export .:one .:two .:three":                            "THwa2JjB2u3beiSauLiQP2HzsSUjSzK+EcwzpbAm8Ss="
									"cue export package + package file + data + packageless":    "0b4Tk64qalPIoD+eHHGy97ZjsqOIWCGvOjcB0ppb+4s="
									"package file + data":                                       "OL/kTt24LBJDnd3apNakAjTmeQiCA/NG4o+3LXlCHYI="
									"cue export package + 2x package file + data + packageless": "DqL0jWC+4J3I5O1nxQNb2qhWdfPqXHA/6PCBXKE34E4="
									"data file inputs":                                          "ldO+HTGQuu2hSnam5U3TIu70iHHaCBRZE52uPuvwFpM="
									"data file inputs failure":                                  "Crt0q7+tnTGO4P/Qz6kl6QSQs07rlyFqOoUxrI9RiO0="
									"constraint file validating data":                           "yBcxCCkJiKrkRbq9zOdYerIkFj6ctWyOTrE4J9KJp6M="
									"constraint file exported as data":                          "cribJcpvfv0nmKhNg2wFTH13dkTbf8b9Nv4Ac468AfE="
									"-l static single":                                          "noBdCkStRvzTGac1nZ4HnBDVWBd26gtOB/PUW/Ldmcg="
									"-l static multiple":                                        "XUNuBW4qgyAXUK00ndxRYcCAcbw3/FnwBlzYIM8Ifn8="
									"-l static multiple files":                                  "E62/HGWTm8sEA1036H/9/XTozvIfHwiincpPLXIsGE0="
									"-l dynamic single":                                         "BeYkYUNQ7B3WYE+09gCFSn5jx7ojNBT9/ctEPt606qE="
									"-l dynamic single with function":                           "WuI95ZXBDomiaMszAPU469etAnOJAB0GYUhv6/903Dw="
									"-l dynamic --with-context":                                 "YMCYnM7JJhCId3GrUC1St/ZoSJbRUSnpHK0X0SFBDp0="
									"multi-doc merge":                                           "Ii7HQHNGnzLm31y8Hjj2ZdWyJnShywiZAEUG28dLrzg="
									"multi-doc list":                                            "Sqx+/m3tk2TgBj+0OTHIy68drBXlxvqynwXrVcus7zY="
								}
								upload: {
									"test cue package inputs prose":              "4L64vAlPxm3U9V9YjPK3KE6kn3fJ/PNR6aidy+ZhkM0="
									"test multiple cue package inputs prose":     "YTfv59ULwdySw8ib19Gtnkwoons7P8IST3g3XT7p1Ns="
									"test cue package + other input types prose": "bOkhQuNdx9iI+IUDNaVHLLSob7gxJHTpJyn9aX12Y84="
									"stdin data":                                 "i8Vyj8nbmbVf+avSyKOCAdj/nSYPBBDDOH91Ma/fuAA="
								}
								multi_step: {
									hash:       "FKPNL40NFNPTSLLILIU60APF7LGEM447EAFMT3V615R7SGU60O70===="
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
