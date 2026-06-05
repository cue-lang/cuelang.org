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
									"cue export # package x1":                                   "S2QT1Nds+Y+qW+SYm9sgYsJ4eYoKTYEld72o0sqQUcg="
									"! cue export # package x2":                                 "L6rAnkY7ZRcQ6Z50FfupBcWQGsDpj7mSecoQoqnOrB0="
									"cue export . # package x1":                                 "+wC9SxGmQcqUqhmTADt/qDxSQ9RY7M6HBp9kaMleVxM="
									"cue export .:one":                                          "w0DHS/tkk1noks/kwpSqr7QHs7nqTgXiZz0k4AxdNI8="
									"cue export data.yaml":                                      "HagVgaR1sAjHc4bPqZFb4Au9R4nBGRQ1gd0RZ4eYaR4="
									"cue export yaml: some.yaml.data":                           "E7d6UQyPaY2888qVNK07ObsHr0+zG/lgJypFloQ5YpE="
									"cue export .:one .:two .:three":                            "Oylq54od/+E+Z6jI3veO45bvl7oVXMI0xhoJ4sqX5Ps="
									"cue export package + package file + data + packageless":    "g+S0wOsobspn4KgWno5uL9HSb/hC82fMoGq6H+TokoA="
									"package file + data":                                       "IE7d6ATSAy5Nye2HSdBubYYVYS59of2SWb0DcoFGaUQ="
									"cue export package + 2x package file + data + packageless": "X2Lxqqo2MWe/xMpinlP30eJ978Rze1mGiJP48i7pJNo="
									"data file inputs":                                          "NrjovbnXdfEbuQPvOXWIQFUYb2gI7aYfxfK1L0CwA60="
									"data file inputs failure":                                  "MsdHHn3zXcoUTIxWq5UZ+BHYC4j90sAqELbx6Umlklk="
									"constraint file validating data":                           "+5znFmPy0KKNH+FLjyiVfhrHbuR7cnkAd73Qe7O1JWI="
									"constraint file exported as data":                          "iqTDEBYFI6sTEFRY14uG49kdbE6FGr9XZBFf2pZA1qM="
									"-l static single":                                          "flqmZSD9KI1b+cHmjf/f+6G5xo6WwENaXluG2vA9Nj8="
									"-l static multiple":                                        "+0nmpjXFTefmQ6USzkZQXGRkL4aVV5BH6IT1fTu+1z8="
									"-l static multiple files":                                  "mW9fpTAWKzFZXElImtVQQ7hG6JvueWXKVtB3xGyVNFc="
									"-l dynamic single":                                         "OQZCBiXxEpm1z1jq62dGzk/IQ39oOl4M6l1z3hyUlyk="
									"-l dynamic single with function":                           "TTKCI7dbtadFaloeji82ERxSCHbs1cyWIPIwqPpyBvY="
									"-l dynamic --with-context":                                 "JST/D19NczmiqvCrZdXhqxGj7P+uv67Qiad1GHFzoJY="
									"multi-doc merge":                                           "hiWV7nmFELrnfJxKEIxODeNVoZ4Nle99ttPbkwn7RU0="
									"multi-doc list":                                            "amEgECVzl0/BIZUX/SF/1BXdhuTvbho1Av0voiRRbMM="
								}
								upload: {
									"test cue package inputs prose":              "GrD2BZxYQ1X2t0Bije98uibwlNeQiVBsctJhYOAuuiA="
									"test multiple cue package inputs prose":     "aabXnc4Wu3QOAL4cr+uhjZS2OL8H2XsUTRaja9JUrws="
									"test cue package + other input types prose": "52O+COQYH7ONEY1563shXRmYFdVSXYT2p+6ySaMzIP4="
									"stdin data":                                 "oJCHsGiqOxDqhFXCABjAL71mgD9Be8Zm84QwB21Ebxs="
								}
								multi_step: {
									hash:       "VH85H5M4SJULU4P88ETOJMGMU2F6SSM069AD1P4SUF9FHQP5IQPG===="
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
												cannot combine scope with file

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
												cannot combine scope with file

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
												cannot combine scope with file

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
