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
									"cue export # package x1":                                   "M/zuX9vY+KRlV6g9/jm8qJ++veqmaaeNsDLvpY6ekFY="
									"! cue export # package x2":                                 "4v3YAhn+QbiHHTbjLJteAARwCScrxWyEWmycgCytQFA="
									"cue export . # package x1":                                 "boPDFkhE4ZaSrjErTsX8P4PMt9pHhnrh31PWbdioQsI="
									"cue export .:one":                                          "+bEQhG7AQemNbQ8p7YTVnRcLZMohuPEjyCLV9dbGSzg="
									"cue export data.yaml":                                      "R+Kl2vOaSZJY3lRTIUA4hiDrHNtoEm9Erye+bes6DW8="
									"cue export yaml: some.yaml.data":                           "60Fmse7YQBbGoagl2BQEzUv6nOnqsJ3Vy2tYApwxfcE="
									"cue export .:one .:two .:three":                            "3OEF2JvgmvekEyW3zI9XOhOtDOEMKgrGlnulpGBbrhI="
									"cue export package + package file + data + packageless":    "G2/+NQuYn9ooj/mNej7ZCfOnNIK9rpwxoDO0snTWB0c="
									"package file + data":                                       "AEbXn3o2iP2uCsR1mw/kHQQWIRHYres1fI+l9OWI8fs="
									"cue export package + 2x package file + data + packageless": "y9o7kiT6PWTbGiaqzs2nYlvMWOw35J2ZU9FD3hpu4aw="
									"data file inputs":                                          "OEEWwLAnQ0vDQ4cnjpmOU3I9towfHpwA/KUtsREWGAY="
									"data file inputs failure":                                  "cjMG+X3pUC9jL7jvjQm7x5OqF5teqccDjf/dta+uMvY="
									"constraint file validating data":                           "GI4gbTNy5+VH+fUpoNzMPmtbet81+YIR2eABAOsuJ7Q="
									"constraint file exported as data":                          "H1pluNsn52/qhcIzIpy3M1R4EACmL7arSCghmS9LCPU="
									"-l static single":                                          "UZjmB2R5qzAp7c7xBn3Rz8KRbDU+bxWrESS9pxF9YHo="
									"-l static multiple":                                        "Wgp9qpKz2MUp1mLzGBl51vAH+D2EePHSKM50FUh9O78="
									"-l static multiple files":                                  "CQ4h1l3vdVdSDQhRqILuy3Zgj24MPAg+883scl0DEOk="
									"-l dynamic single":                                         "X/rylcG5THYfkZtvfjRJ5HU8CA+DWB309zs4QguDTvI="
									"-l dynamic single with function":                           "WsL9ZDvJXnJeIMmj9k41zAWHtgTvUWpd3+ZD3o7mbWw="
									"-l dynamic --with-context":                                 "q4wvSqiEJgmiVzssIIJYxXlNqf/Pl9xcIUqwH5DMt7I="
									"multi-doc merge":                                           "HNk2p6mkLbvNbZLZeOwt2f6roca2c/Z/+ma5nbZeA4o="
									"multi-doc list":                                            "qEoqSGTB8dmpusUpiDuJHP5XNClmSty+Oh1MI3lbkkk="
								}
								upload: {
									"test cue package inputs prose":              "/MfHwBe6LEQuwi3+sFdBsGWlw2dzhO9po54mLkwCVgg="
									"test multiple cue package inputs prose":     "plg64tJZy0ajER4FwLleVJ/fud4P8re1oQNZzBTBDO0="
									"test cue package + other input types prose": "e1Urdc45tu/0XKPWPV9jH0mNP1n4txSdYPkB3emPKJY="
									"stdin data":                                 "++vdYIe2tKB7HjoQAWpWGlvLekyMnY3zE/yyIj0NyTI="
								}
								multi_step: {
									hash:       "RQ46OORBMOI8RDJ9E2I17FLJHG21N7PLCJRDILMGANL6RA9P2110===="
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
