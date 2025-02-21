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
									"cue export # package x1":                                   "V5lo1O+/mqgL5JtlP3qeAl2JfKQUpmKJQkOIUjKy3xs="
									"! cue export # package x2":                                 "qAHi7767hNiSMTXIjVjJHFGvth3JTZ/8TwIOUMkIvFI="
									"cue export . # package x1":                                 "CHZdJ+MsthETgiq25nPbCIX/IG3a37xGQ+FO39ueuOI="
									"cue export .:one":                                          "4BLW2k/lcIJXiP8OjZgzMQcpVM4/eS7OogWPEl6sdKQ="
									"cue export data.yaml":                                      "2EwLydiCN1hSdGn6GUVgwU6/7qJemFFI8YfuJyHT0Eo="
									"cue export yaml: some.yaml.data":                           "BL+XoZUetsOyvqa9VSkC7WziGCpF9yYT6Dmdmo5lj9o="
									"cue export .:one .:two .:three":                            "p2lkG3n8q9QBd3K8JCPODmP0xQ2fF3yaqKyUUXD++l0="
									"cue export package + package file + data + packageless":    "Z3MspkwtKSYtYcuj5UtCrcV5D5oJModYPA9NLG+yI54="
									"package file + data":                                       "GsFNz5o/uGGsFjKTaUpCg+jK/gicAIeCnxCUFWf6few="
									"cue export package + 2x package file + data + packageless": "AagM8Faf3/NujbkR2eUt+l8tJcUc+kPVk/Y33Mm5cYg="
									"data file inputs":                                          "LtmBza09acRyU2MOBWx9um3bQpyFJsuA/3NynmU+C7o="
									"data file inputs failure":                                  "cWGX1LW07BTl+8E/1inRd7eTY9JN/XFooyL9O9uutR0="
									"constraint file validating data":                           "9bgH5QCXblIja/4A7Pt6PGPtYN94uFBvEMIAjoSIQJ8="
									"constraint file exported as data":                          "eAOrDihWVcZXii6/lM7+kxyOtrREWuAU9mNeu33oUrU="
									"-l static single":                                          "LKDAVnlAEm5AytBPMcTZlrv0UnsZzmw68h7T85zA+uY="
									"-l static multiple":                                        "A8I6s+sUMUIszglN/56yZ2/TLNkL4f/bSPayCEGNIhw="
									"-l static multiple files":                                  "EetgZoWiUg9j4iho/pwSkKBYjJysh6rbbV2C+9fl8Do="
									"-l dynamic single":                                         "75Od+qDwzw3uSF9DhPYxZWGA7sJAVwe8h3HcHJf6G4w="
									"-l dynamic single with function":                           "XIQlvYd2yOqR/rHYJZwLqXecSS1LIs8RI2bes5MYnqw="
									"-l dynamic --with-context":                                 "fYESEhOFoDwCVBfyG11DeePKdumYD+qh4o5wfNrFXww="
									"multi-doc merge":                                           "gXUiEVpOnYDWYFcVMhlMF+SQt8L604Ne6BwIw3zSkvU="
									"multi-doc list":                                            "gKxTHg4o3E3d1e0KaN/U5XRxmDkBFX29ISOzOC54UOI="
								}
								upload: {
									"test cue package inputs prose":              "rp+waViFVMmhhAribSfz+fJ9zMHhNH1L+zFRKjCcfuA="
									"test multiple cue package inputs prose":     "zw8xi/SZw6h3UQnjNq5odsrQKceetEeBOMgAsRZtgzg="
									"test cue package + other input types prose": "azulC4TU9ZF01F8MMarQWULIWW+wdH/EaJyDnhPBXCQ="
									"stdin data":                                 "YKzrUauNX3PbFiL6s1zxoiILS6iOv5kJjYxbAi4VVkU="
								}
								multi_step: {
									hash:       "67CAOV9EB51PMCJI9ACRRJCKTBC61JIDI4AN109A35OE9093NR70===="
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
