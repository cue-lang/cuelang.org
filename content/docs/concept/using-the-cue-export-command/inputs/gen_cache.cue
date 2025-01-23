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
									"cue export # package x1":                                   "sgvKKbQQq26/l3ae0Dh/jJP40Wgx8TX0Hh9367F1Now="
									"! cue export # package x2":                                 "8g0rND1+tzMeWI7CBgyEj8YsNYOD+G7LXbiWc5iDCCo="
									"cue export . # package x1":                                 "dtoDn587lBUG4o2xiciOM3mcEYdQc4cH/KmIZfmBWfA="
									"cue export .:one":                                          "cuPFc/VPfHp/r0joglVZ6itiLrPMNxPSu2TVVJc0FNo="
									"cue export data.yaml":                                      "TF1LNCjlC9SBVdsjO694EY6TGdnCL5OnVugYJsTPk0E="
									"cue export yaml: some.yaml.data":                           "TeH5MiM4/IWrH1LegO2Cr51hN0wvj7WGqG/h0wen/ZE="
									"cue export .:one .:two .:three":                            "T2HcAQQIB/brhgpNwyuf2qUxfr9oMm0Hz6xfTjdimJQ="
									"cue export package + package file + data + packageless":    "NDeRDcZUX02co7ihoPvQHi738RmvD/FxUlT6e2i7Pug="
									"package file + data":                                       "cFT7+J+4q1dNfXadqyhN1dCBS+yRlwptEzGToQDke7U="
									"cue export package + 2x package file + data + packageless": "bM9r0FeqKKkQRB3E8oWfPViTxH1e7kCPhL4DEO/iQnA="
									"data file inputs":                                          "d4mUL7f1N0sYfm9gnl37JiiJUJY9r7dhbFJw2yBEDOQ="
									"data file inputs failure":                                  "GnSAIZcd7dakWHzTp8vRmXuM1wi45jh1IGhZCfWIryU="
									"constraint file validating data":                           "vGZTyspqbu5BU8XGXOzLrSMGN2PZXygcxTb3pVR0M7k="
									"constraint file exported as data":                          "5ikFNaS2TeVaBQUAS3wg6jusXwFFrgWHSwvl0zDUqMA="
									"-l static single":                                          "6h0NNa0uogozKAmr0pegKZefkpyv9RKRl6X6GdsnXIo="
									"-l static multiple":                                        "lOc6DE5I9gq9jc7RMrvxgJwwwI8GFft5QW8+WU+b4UQ="
									"-l static multiple files":                                  "hWdpl7HSpm/e2KmBcwac59ASX1RQib9dCgyCzuIe1p0="
									"-l dynamic single":                                         "SKwxqYEI5+elg9hOnKC+quOCPvY6PPJNJZ7jVqvjx+w="
									"-l dynamic single with function":                           "Jh4eH0BmGbBWKJPzhjxXfkFNtSVro+eD6QDzpebcToA="
									"-l dynamic --with-context":                                 "+nrqCkjZoknsvJ0PAl7yU+XJMWaQclUi4UDy4JINJJY="
									"multi-doc merge":                                           "oW31zGgPS6BaP+IQJpzeXSYvrapQbAMx4l9HSeWbX84="
									"multi-doc list":                                            "hDiN8wKKTC1b0jLKnk1729u6batnKrswpaE6wt+fEuM="
								}
								upload: {
									"test cue package inputs prose":              "k9eNEAgGWz4rOAbp9yzNoVewU7dEgyPZMFXx0QOqK/U="
									"test multiple cue package inputs prose":     "5SU3sCfHg4L39HLL9c2NPY/rJYZ3cvFizckqWoeOXwc="
									"test cue package + other input types prose": "nfp0rnIfipMC3yMxClmBTDmdYsDZHFwcDwDwftutWOs="
									"stdin data":                                 "vDgv4P1YOI0cwbQ1t680f1W3gJFJ1QjjYLdIbcI+na8="
								}
								multi_step: {
									hash:       "1E2CLN9L80DQO131H85N4UFRF9SFRTCE43RLRP89K2FRL6QD0EMG===="
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
