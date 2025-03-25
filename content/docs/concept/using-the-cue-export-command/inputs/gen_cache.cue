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
									"cue export # package x1":                                   "gflVBBcSIpC2950PR7ZBpvHfdiuKAQHtkjH+xGj184U="
									"! cue export # package x2":                                 "v8tp3ZR7G6O2o4FcMwasCFJqQxIgtIp9lI+9K+NmxzE="
									"cue export . # package x1":                                 "sLKJ5+tOpe1u2Eex9eODZ3+SK9rkzB82AEfs2oMVfSY="
									"cue export .:one":                                          "psQIy+dkqbHLP0eW7Z+745nyrx8cXKQJu9B2jvB2BIY="
									"cue export data.yaml":                                      "JpeFjBabLmkU/yMbW0egdTW+t+l3wtBUofSU3bCIz5Q="
									"cue export yaml: some.yaml.data":                           "gmWvAYYXu+uPQU5SoFuB7JRENgxMgdE2qLoFaEgPt7M="
									"cue export .:one .:two .:three":                            "H2Y0gG1mehJsa/UFPkn0eVqOT4LNEDq0ISE5ZD9QD4A="
									"cue export package + package file + data + packageless":    "u1LQGAN4qsUbswMtKiUkNnWNM9CPXy7WRKO3Y19vENI="
									"package file + data":                                       "xo8zcgpwy3ZY2OiJLDavrngqHUaLbJFuUpYm4fteEhE="
									"cue export package + 2x package file + data + packageless": "YWeNgGYdM8MejWCxE7GtiI/QM1oKEHpWfmQuhUOEhVw="
									"data file inputs":                                          "agnMxLAt5TjdsTHNlsXIAyQJR7k73hiq9WH38Fnwm9o="
									"data file inputs failure":                                  "/EaO7/Rz4ZTqISK94ZjKNfLvdZiDrrxmTsXm4QwSeHQ="
									"constraint file validating data":                           "cbCtdMQ97rgKplML4jKkpQqr/urd7BkFGneWu8pME8U="
									"constraint file exported as data":                          "x2E3liFS8MZ3y3jITZhkfTuOgevaIXCTSwoCND6xfTM="
									"-l static single":                                          "uC6unKFRcJePa0Cu2X4t0uB5Eruz3LzNLVgpT06EO7s="
									"-l static multiple":                                        "gPyM1jQRCnwLkR6My31O/pHHF2MuMueuDIbtXbibv4U="
									"-l static multiple files":                                  "MpbSzdcRHZpyuwaPMy2GW011IVHSJ754jg7A34VnMO8="
									"-l dynamic single":                                         "QnuKF/Kt9o6oG8U+5lURtT61h1aIiW5/rn+XhCgfsNE="
									"-l dynamic single with function":                           "HNDRS3BJFwJiBcXas/FPazdwSHD/HffKoHPqLYtoMmk="
									"-l dynamic --with-context":                                 "/M2VteU27d9Hz9HnBvQxcYrThK2qBFZPj6areGnezQ0="
									"multi-doc merge":                                           "An9UybN3CyzevMFQcleFyDzqwCWr1lyeFnfyCXaArk0="
									"multi-doc list":                                            "glDx4J3TyScwW7s23LPVUoPwZ86ZcWfA2/yJ8DrzGEM="
								}
								upload: {
									"test cue package inputs prose":              "mlm4OrzqU21dkuLkslwfQwgA4XRHeZRSog05ufCSyR8="
									"test multiple cue package inputs prose":     "TLIosjIqN/0zo5fSmiyXLMCobt42SVkvocZSIA02hrE="
									"test cue package + other input types prose": "IhDwpo8YzVoDDBsSnvU6sNAyKKYAPsAyH7FeATlAIzA="
									"stdin data":                                 "MNhXzLY/3jtGTDRVh8lVDaVHn8y8XEpLBJvdIBpJRZ8="
								}
								multi_step: {
									hash:       "GRUBQ5KSONPU3LDL9MBSGRCIGAG3BKPC36LRMC2F50UFGPAJMNVG===="
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
