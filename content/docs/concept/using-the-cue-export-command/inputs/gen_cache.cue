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
									"cue export # package x1":                                   "Qo9ZTaSQRe7HXnPXzqBLoyvmR4I+XDMjUPT0o/qGn0o="
									"! cue export # package x2":                                 "aQgCqyQ5i1eG5F4Q0EMMUTq7OYv6FLDZ5MN12+mLRPw="
									"cue export . # package x1":                                 "nhri1PP5kUJHQQ5hD5WA9fcYRiYKBpkumJ6A73F9zvw="
									"cue export .:one":                                          "Vguobg10j0lINtdxm0WONTpMbTNvkadSPlZBzPHCqC8="
									"cue export data.yaml":                                      "hurIhR9jvItt4jtbiULUE2UBTVNkH4Z3lOG5G4Jsf+g="
									"cue export yaml: some.yaml.data":                           "ELXFCQ2dAfmvSNZv5gh8qb2MRMDo39JF9LuMc7Jj7sI="
									"cue export .:one .:two .:three":                            "jopZDZ/RBHj+tG/MYT9grmcCEgMj6IaddjBlWTdFhNc="
									"cue export package + package file + data + packageless":    "rhesYomylCFD+cAXx+TXAORGu+ohBUzFV5YGRgVQ9nU="
									"package file + data":                                       "SwN5j3HK7WXzU3Ey7Mjgwu6+dJ582RVwQ15M0TU+ciI="
									"cue export package + 2x package file + data + packageless": "rW0acXRihS8aBBVRW/jOMdy1H4F2a3eMEZ4r3sxIbAI="
									"data file inputs":                                          "XwtJAk6LJ8SyufmG4pd9dPNOFSwDITLvoaYstdz0EOA="
									"data file inputs failure":                                  "Korqxx3CxSGhaGGCbfi87KuWk1sEheZ+0g9h9gePJtI="
									"constraint file validating data":                           "M1vqa62bBiuKud9mU4ViE3talJ/ehAIYP8cQAFNAkY0="
									"constraint file exported as data":                          "n1T8UKzm0ege0xQKHU8XTCMrgObCoY34ZZH7tPPzK6I="
									"-l static single":                                          "YpDrAHNGhPjK5hW787NomO3NWCiPuLHrylNxb+ipnxk="
									"-l static multiple":                                        "bkbrWV5WIII1kmOou5pE0OkKzyBxRsdX8gKB7qN422o="
									"-l static multiple files":                                  "OmppM0aG73zfbQOWVNGUoGKzRu/6Z5tza2TjAQkpWPQ="
									"-l dynamic single":                                         "Z1lC+jr8GbuuBGA5ECU1sCto+LX5NArfBz64q8Z+MKY="
									"-l dynamic single with function":                           "t9kAFSCklVI53MqCJPssSB8guzPpjqpHT7uKEX65ML4="
									"-l dynamic --with-context":                                 "CRolG+x+ZMRs+BDfjefdUePSRj94Iig/vnapfeRrHek="
									"multi-doc merge":                                           "p8x3evMdef7KjW2b11lwyvw14BX8je9H9QuwRpZCn4g="
									"multi-doc list":                                            "h27esyLMcmTLQ7H2T25wOCa0BEb6cau8bbjVX+dy2Ug="
								}
								upload: {
									"test cue package inputs prose":              "/RjBslaczdy5EqgBxkKudj+cNbOkTgme+hLwLPjQlMk="
									"test multiple cue package inputs prose":     "cjQBN4LLJ7ZkmdSG65sWA/vxm+yjsLxWucwLq04brT0="
									"test cue package + other input types prose": "8fZqUnIgcBdkkIQa/YShyIyj5z30gsTIN4blIIBJSJ4="
									"stdin data":                                 "CsirTP+H92pP3HDwA9lyaRLuZpDUg4TujVsG16rCkNc="
								}
								multi_step: {
									hash:       "2BOEU3ET51QF936PR2I3KN3RCQ37LI99F0FK2HJ961UM0VTE6C3G===="
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
