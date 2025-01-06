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
									"cue export # package x1":                                   "vE3BxQzHEoB53RrOgDZxCuGxEFMJkE+GmWBs0m7l3zY="
									"! cue export # package x2":                                 "Dgbivpa1JbTsekLwJf2Is1MTJKPvHYX7zKGsJIQhafA="
									"cue export . # package x1":                                 "x7U5rlEYh130bkMSaDZrJX7UnfAR98VYdrWWqX2PbeA="
									"cue export .:one":                                          "EqewcpsrA2q080pYqRL1wTRuPJUUeb3+jpPewzAk78Q="
									"cue export data.yaml":                                      "HZauQJ9N0KV7+VniT8pTfV/JI63mPKry5bN1Ei5Z0VA="
									"cue export yaml: some.yaml.data":                           "EOmX6Q4BZZoZ2RcaLDcRFJ0V+WJ/7GQLmviTqWsHAvc="
									"cue export .:one .:two .:three":                            "yGnT7H/o2StSAXvGMdvolCYVp0t0bd1OixvFnvM5RRM="
									"cue export package + package file + data + packageless":    "Oq5SfGhwAxULYP9O0tFNmkpAfmH+4rCW/roFeLLVjjM="
									"package file + data":                                       "qowi5x5GpABTMrHzHFWWkdtgOJSvZn2yKniIwpUkjWs="
									"cue export package + 2x package file + data + packageless": "pSlyNdYC6Wm6d8vbhX+hiLBR4RgDy+FXUsKvjifmAe0="
									"data file inputs":                                          "/snFDj3SNAwNfBoPMoHDApcSmpBspmf/hC68QOA0UKw="
									"data file inputs failure":                                  "yjuNcxn9kp6ANgAHtkcM/P+hrxYdQF9DE/RS0FDeTTw="
									"constraint file validating data":                           "Q8YPLHuAMnxRjxCp39iWvCYMZ5AinemxvVhYk9m29R0="
									"constraint file exported as data":                          "ys/BG0AY9riaTKG19pKFKX1bCglxEoco7VQDebxYmiI="
									"-l static single":                                          "Ol9nuDQeOZupjONsStDnhWm5fU1Be9EL1Z8nKSuixzI="
									"-l static multiple":                                        "OASN9CvNYeWfH3ysLMAz0aP3Kj3xgn00T4NLkXX2tJ4="
									"-l static multiple files":                                  "PHg39Axd5mMDSmZsxOvoTyS10sR7+krNZy/og4IJ3Hw="
									"-l dynamic single":                                         "VPbZQx7LKZWhY/lCACTrEGPREKp72O/tvQYtKS2YTzo="
									"-l dynamic single with function":                           "on0kdVe7t52wado1UH7q+evexjCVvH4XWc5n8BovXeo="
									"-l dynamic --with-context":                                 "dO013mfkoZVjsjQe70tyCt6jCDxBf1669dlBA2eSuls="
									"multi-doc merge":                                           "eerwZtbtEpiQB9WR8QK+9sEDG4ktfjlkWY00FNSuWAg="
									"multi-doc list":                                            "+KE2qbC/RYhjHxRzfprR9on1aTIVQWWtUHDArjDWykU="
								}
								upload: {
									"test cue package inputs prose":              "PQhSL9KVzG2PxsTWCh7NZjMFWUQP2+dJv8FZClwGL/8="
									"test multiple cue package inputs prose":     "BBPeZRSMukx6+DS5gLwLetEIe7vpb6f0YEGK1hNe/1k="
									"test cue package + other input types prose": "aIbslXdHDHu/xKZSdM2CuGGijdODLXjCMq2lY/cJl3w="
									"stdin data":                                 "QHxzzn8WMTF6Y5O1Q54VOUDIBWW7jt/9AQHOdbpGXWE="
								}
								multi_step: {
									hash:       "DAU9KSMVU5T8JV98TUHHE8G4NOCF4IIG9MTQ56S165LP4S3BNAV0===="
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
