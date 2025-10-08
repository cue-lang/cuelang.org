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
									"cue export # package x1":                                   "UU47aU86oOpOL12idN3kHnKR1Dz94oE34Cz5qRJuwoQ="
									"! cue export # package x2":                                 "5rLvApLNlBEShFaokyLbHxaukjwx4UX2Jd+rcODQ8qU="
									"cue export . # package x1":                                 "DF85iYfPRW7ZNirPkVf8TMeEGkxc2WdwVX2Dr+aFzkg="
									"cue export .:one":                                          "BUHpqpbFw0frofy8p+XQn9ZfS6XmaUf8sxC1CnngMnU="
									"cue export data.yaml":                                      "X6nllKPmV0dGvTSW2sq2464/ibFrHTz4kSyNVHvIfyc="
									"cue export yaml: some.yaml.data":                           "oqCjzVpYVGhJV6g3J1ZWejxRxrgQN0GtzgwixQnHHC8="
									"cue export .:one .:two .:three":                            "NvcjP/WTVnyMUovEXM662dWPTT37rg8a4Shjn8rndK0="
									"cue export package + package file + data + packageless":    "7DrjIcT6BWA9IsPisGTTxDPighCIaM0O4lhW5LwUS6o="
									"package file + data":                                       "rEZKOQ8BU8q7wX2dZja6ufemyucaQKiO+gw91YfmnIw="
									"cue export package + 2x package file + data + packageless": "UU87lWOtEb+rNwbHAN+YrMjKsOWFafkyhy5xd2Y7Tmw="
									"data file inputs":                                          "wWQExQDRMtCJhIicIFULu0sJIju9gseI7bs/o68Q/LU="
									"data file inputs failure":                                  "I+8In6KUurESS/733iEp8hwvbjG+meZj85AA0GCFj3o="
									"constraint file validating data":                           "vZTpO/wo19DEgthN/B63wAh3kG/OWTzP9Ol8rG2Yug8="
									"constraint file exported as data":                          "/HnKrnf5GS9SfWysIOhZBKNdIY9BLGTCD94cCGbMPRE="
									"-l static single":                                          "xm129Y2zNO1YFyxFk9soeDnnfkwfWvPAQ89RXaCyWXo="
									"-l static multiple":                                        "YDzqrNal+QrHdhcQg3CWM16Aul0NsptSt9gR+ysa8MA="
									"-l static multiple files":                                  "h7RcqWCvnCZTiB9ugf5m8F7r2PwoPob30KtlHZoZrR8="
									"-l dynamic single":                                         "09UT7WViaAx0nP+OdwTqpwhI1Q3QnhPT8ryrsuAJOB8="
									"-l dynamic single with function":                           "cJ42DyH7W+Yz1nncLZRah5w1Sb3eqXrv3+VvbIuRSIY="
									"-l dynamic --with-context":                                 "DTSL3MEt57Fhwf7A+8UebsjxhcYXJIVvvfn/CesZiCg="
									"multi-doc merge":                                           "LmfpBt25NhlYCokkQn19rj0+LedhQ9lzbWvZxWo3lSE="
									"multi-doc list":                                            "Gxw6dNDMdHda7vcdgOf/fryvJBWKsQe9pI9rGyXWQ58="
								}
								upload: {
									"test cue package inputs prose":              "nhANkIi0PwBPqTwthsus/hS+x7lBPtS5InodS7C6WSM="
									"test multiple cue package inputs prose":     "BzfFSIJUBN757TM1xswdHpZSF++lIoHcxp1mxMop69M="
									"test cue package + other input types prose": "Vtej8cQdLVXcTUDw+185fIac9Ts/uUqfs67h63JOcDk="
									"stdin data":                                 "RBuQZl49iNmlbttXZAyWi5NFYe3w+u98Q7M9ir0xPmM="
								}
								multi_step: {
									hash:       "FVBQKDBCDR15EEOBAOLBCN9843E2L8E5TEFUHN5TQD9DOD33D9M0===="
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
