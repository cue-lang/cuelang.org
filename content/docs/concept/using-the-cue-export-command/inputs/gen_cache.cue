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
									"cue export # package x1":                                   "bx5cz7Tj6gBoCD+NBH2z/TnhJgH0oGkd+un+EPGDJCs="
									"! cue export # package x2":                                 "irlo+scUZKe180TTkj+vdwkiM05doC5VuhrjFCUQQCI="
									"cue export . # package x1":                                 "ZmWLbiKWQXX92lExF1PfryOpQLXEYRpSYwlwbOE14Zw="
									"cue export .:one":                                          "nyjd9rla6L3rqON6+ujbe0+Ur3OyYhJEf1MTXi+Uqzk="
									"cue export data.yaml":                                      "9v00C6s2oJqYd0I6kcN1IwSWNdXJDhM5TIbQXgJG5Bs="
									"cue export yaml: some.yaml.data":                           "aSz4TReFDBg/yDZPvt6vd4MluF9QIWme/EsX3bHODU8="
									"cue export .:one .:two .:three":                            "7cHuxfkwAHy+9vQIKwDEKdBq2fjW4gqjjOOoedBz7E8="
									"cue export package + package file + data + packageless":    "oSwUvsYsfg8hmmxXKXdhM/AEJ/iqDRDfhJGgbE1r+eU="
									"package file + data":                                       "OwBFR/wK2uF3nJoKHA3ghSxW24PVC/5N9rVp1UF1PaQ="
									"cue export package + 2x package file + data + packageless": "BqJqZOanfYwzdwYtCnY8ffav8hfFDwPhIVKXx0MrwRw="
									"data file inputs":                                          "n+jYf+6noyujr/OHj4KoYhecXiO2FZBfOmtGEykl6H8="
									"data file inputs failure":                                  "Hwfw8DbnsLDfWPSb/6Z2miLw6V7thpIEfaqTXgvO3j8="
									"constraint file validating data":                           "97Eo58E1ThZNxyQRMaXdtJ0yFilcHsgt650jWp6W+Eg="
									"constraint file exported as data":                          "U03n9gLhxPTG0D/P6asoHtkwpFHft9qxFbIaeTApmVU="
									"-l static single":                                          "YjRs7szi4ZS/sW69uO6KDLTcPxfqQIXlVAzqYRmTqkY="
									"-l static multiple":                                        "tdRsEV4jYQrUWnCRASdr0Zn6vfwu1pOJTQg5gvtWC14="
									"-l static multiple files":                                  "KkS2+VDNrirPZD3GEa9jHN4tmvtDnh1K0yJ9S3MlVz8="
									"-l dynamic single":                                         "9xwMZ+K8AynpynvPl/qYNxHkuPSJDXZg2A3U/Q9n86M="
									"-l dynamic single with function":                           "9uuhwxV9372ErVVQ4O3V7C19WulfsBHGrs20sVpiRXs="
									"-l dynamic --with-context":                                 "NCFnSSd/v/e/dq5gQIeVk9MEC0RJ5xIqBeVbCs9ws8o="
									"multi-doc merge":                                           "8CAOZ7fnrDE6V7PW8BsGpE6hNfwrBAA8m7+pk6TAkIc="
									"multi-doc list":                                            "ci0/kSWBKEEShFGn+BWaxrmMQsP+VhMAWPOlGUapEeQ="
								}
								upload: {
									"test cue package inputs prose":              "5wFW7c/eeVewNUEwFxlZS/8ybunuCKw3GvThV8vbg9s="
									"test multiple cue package inputs prose":     "fxqO58hRCJgtKgS7VugteyPl1acIaVeQDAoVXl5eQSE="
									"test cue package + other input types prose": "Qv4Z/FinWhCwjX8YXNSFBzksaVAAMgmc4wfvgbI3CY0="
									"stdin data":                                 "DmtUXZTf/uIJncGYDJQSGbMJIDbRuPJvfZxkd3YmErk="
								}
								multi_step: {
									hash:       "1NGNQKDNN1SF7O3OQMUVPG2O7HEUNFFC4906DHQOJE3JC1SULTO0===="
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
