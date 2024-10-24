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
									"cue export # package x1":                                   "6xKI6iMxmALGcXwURZxmtKC54u1jkELNpa7S27M18zM="
									"! cue export # package x2":                                 "8pQwYfMyBwXpPF9XkgWcWbxmeTjoS0fnDIbTJpZs1q8="
									"cue export . # package x1":                                 "pULuXf2DF26l8bFvqlTB93C9BY/o26KmLxH9udOHqsU="
									"cue export .:one":                                          "oVf2Rslk7QdR23Zgl5KkHi61gwbvdTe/lCSMqeVFHMg="
									"cue export data.yaml":                                      "p2hOMB+GiawSbfCndbpwt2g0FFMWQY7R+N3lXq9XsHo="
									"cue export yaml: some.yaml.data":                           "AioL3E2Vb58IaIDeCwDMA3RZijIlz+S38EdEsqp8UdM="
									"cue export .:one .:two .:three":                            "D8EZq9zXI3lyuhEhw2rCEZEkrYX6waGMeXhN68SYflc="
									"cue export package + package file + data + packageless":    "PVZm6HTdNaYKbBwhwZa2suIXl7yP90xb/qrZLpBNiXQ="
									"package file + data":                                       "vizuG2wJOiIwFu6W/0V10dfNURqIPIXFh0+ZbpWJyeg="
									"cue export package + 2x package file + data + packageless": "vtGnIr4N6RNkrxmSWrUSoAUf6NAI4Awkd2fsZW8yHvo="
									"data file inputs":                                          "FiTK21exMaAGK/zUKS5KihZ/j63GHi7I4OTJH1enRGQ="
									"data file inputs failure":                                  "Mkpqbp790SUqmsyczZfKPkyJjrc5V+09gnieRlOCu7k="
									"constraint file validating data":                           "Kb4NotwIY9Ot4HDPScFWGLlT8EKAQVLSiqKPdXNHh2k="
									"constraint file exported as data":                          "RUrUBW70/parp/pdCjE9eiS35YDHXBHzxQ/9DMTXnEM="
									"-l static single":                                          "JHayudBgxqOB/eIrGtr3gvxyVtFX2kIlL6l78NgM3h4="
									"-l static multiple":                                        "WTkL8nvAm6jIcTNI/0u32VCEH7iWhEgw4Be+RukW0Ao="
									"-l static multiple files":                                  "v6veBni/ZqSZAXAdrf0cI1GYz6d5My5tbo6MJFk+wTo="
									"-l dynamic single":                                         "3m8VIVqTnxqDJscB44Z5RZ/FKl4YeEwUmh2CjD7t/NA="
									"-l dynamic single with function":                           "vLQS3OD23/m2Xw9vgxBUSlZeA2628rLus6wvZBz4DJo="
									"-l dynamic --with-context":                                 "IEb5HOxIfnDG336suT2TLh4kKtgsYe/uuG9lRYK9m8Y="
									"multi-doc merge":                                           "Csui7x8Qo9kDCjeeiXygnpL/T2ieLo4SARC0nTR63fU="
									"multi-doc list":                                            "66sZ427zAWKiGSVHzuBSYsLjRHiw/WsPd7yIx3B88gs="
								}
								upload: {
									"test cue package inputs prose":              "tktX5AP0g5dmUcmO7Ekl+ej4e758tS2BiX8sj473FxI="
									"test multiple cue package inputs prose":     "yq9JwDpJKJQ5pM3wu6/A6IIzSnwplMi2vS48dKbMwBE="
									"test cue package + other input types prose": "msPg8ZkEERGouySCY1cfaKeOYYC5GARe3JVD2xKKXrY="
									"stdin data":                                 "Atm4p0wofJkeLMk7FYOSJUPQUnteN/COdZSVxduuBaQ="
								}
								multi_step: {
									hash:       "0T3TL9E2JK52F3K5R86I77J3KNVQL1OGNHFJ1AQ15LC4OJFKP03G===="
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
