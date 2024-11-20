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
									"cue export # package x1":                                   "Us9oT5j+W8ESxUktENzN+Jq2xRc3MJf8U02Pr9pgMwk="
									"! cue export # package x2":                                 "eNhY6s1jRBSxCDBzsZEJvw00PlPhBj4jxeDLyVlHafg="
									"cue export . # package x1":                                 "t48TfykxzMbUiANmpHjnACyAPeKWh+8bIucoa3PgTGA="
									"cue export .:one":                                          "yXlkTiNp8GZ8B4HOXiQcjDlfAT1EqoRUHLR1oNeEdms="
									"cue export data.yaml":                                      "XG8LNF8+4DQzSZ9cHh7HVuV3nPW5JboCCYVtqVJZXME="
									"cue export yaml: some.yaml.data":                           "FHrQ/YYRn1+iFluXfqje4nM4HcLSeBLAkigjcA9CW44="
									"cue export .:one .:two .:three":                            "2d24EQt0bfz0WFOgdqFjMPppLga1SV4W82lEI+5sVOA="
									"cue export package + package file + data + packageless":    "FYjhXl3XUpI0qkouiPzCuS+qni0OYNUofcYqwgGbM/Q="
									"package file + data":                                       "xjTQkRQf0N9QVbVfbapoZX18nzDjMy/Maa9R2saIsTg="
									"cue export package + 2x package file + data + packageless": "5sZ6T0MHFiHYqGeab873Faqslbqp1zglszDQvZQiN3E="
									"data file inputs":                                          "z1qIYV8dW78WurQFhIslcHm36f2zpQ+BOlGE/1ssZU8="
									"data file inputs failure":                                  "MsTnUfr4vYR7JDP9KAt+MnsSzK33wL96Q+mU2OaM3RI="
									"constraint file validating data":                           "09Ou80GrdzlwUARdkBlOrTGIVWBNZLzTPYj7tnPdMA0="
									"constraint file exported as data":                          "0Qzhmdhb/tIcJ6cmaCVFHTncv0g/D3KzVZkisPFQtUg="
									"-l static single":                                          "9n9c/TGI4KDiQXfrLTRFgCfHeCq/QD+6UgYdVnZHff4="
									"-l static multiple":                                        "SQIbNsi1fjRcmFzjliMlNhjkwS6kC8/vJUY58qdGxlY="
									"-l static multiple files":                                  "7Iy0MWCAnUcNEerKju4n38BlghDUx5lv5ndgYhZvcf0="
									"-l dynamic single":                                         "plpfqhGgZgTWLsJtj17VWGfwZxDFkIwwH40Moo8RNU0="
									"-l dynamic single with function":                           "v4XPmlkOthjm1j+/YZNYOMLv5vVfLHktKrToet/AjRY="
									"-l dynamic --with-context":                                 "mT/LtFHBGE6OtijM8ztnurKtiT7mb420wnWEa7Jssdg="
									"multi-doc merge":                                           "OhaOyDNcRfszOQiLNO7ohz1jnveFMgGCXfLE4gpCAU4="
									"multi-doc list":                                            "gRem7gwGJn8QsPP0itzDIf1YZLH6trYxVAZovTSnJ8I="
								}
								upload: {
									"test cue package inputs prose":              "l0UBvJMHicfuvLBxGxKNa6h//5a6ygFKEEb5qXfGDZI="
									"test multiple cue package inputs prose":     "JkvegM6Pl7f2R0ucG/q6yKsbwGrk9xbg32+OhBxyTPA="
									"test cue package + other input types prose": "9lCabhjUAhmyCdIMz6op8x7bgERJ5KD8aPAP1RE7Du0="
									"stdin data":                                 "jbLhPUbCojL4YCN/O/7U9t8Ivmle+xfu6zL3mT7m6N4="
								}
								multi_step: {
									hash:       "MQ3M647P1H60QCHL7EEUMJAUJCC2IFIPJDMTCIQ9P4G3NEHURDS0===="
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
