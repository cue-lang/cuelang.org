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
									"cue export # package x1":                                   "h5+gToxUQad6f9HhFW/DXFGgtd0aL4e7IhN1u/mAaoc="
									"! cue export # package x2":                                 "rnx6IXZqGJPauE+SXEto/9Dd0ht9H59IbU3PqtFgm8Y="
									"cue export . # package x1":                                 "E3YVtXQ6UPSxnHq2WFfnH+dj8TOAyQX3G1FWD8E5dhg="
									"cue export .:one":                                          "KUK9G7hEk5m0pdz+nENuhRGplMBLTAXL/uHtjfOFw1E="
									"cue export data.yaml":                                      "anwEnOeixcViKpEHOfrx7WjwPjU2Bg7upQoWqkogPd0="
									"cue export yaml: some.yaml.data":                           "/MymKVSaYVfQKed+3qn4C5p99G7MkR3AE/2pFyOT4g8="
									"cue export .:one .:two .:three":                            "7Z9xtiqNFCej51EkwvRtMzHe2Al/6k5o1RkSHF7Fmyo="
									"cue export package + package file + data + packageless":    "tgBJOlR2KCP0lClWQEf1w1fbqQ69By5QGGqQjAvpERo="
									"package file + data":                                       "dvlpFQeKDgwaTi+zo4EMAPD5Z2MBDRKWI0UlxUNwvcU="
									"cue export package + 2x package file + data + packageless": "skeTQpJZEOZ5GAIBwXdktoHTMzwjpe98quORKjyAYQ0="
									"data file inputs":                                          "LrjPykcDEwAENlxoV9xYgXO9MfN+iDV6IWNpK3ozloI="
									"data file inputs failure":                                  "un4AEiCWqkvgUDYnRVWIOqUfegCMJv3bR9t47hkBX7Y="
									"constraint file validating data":                           "n9L1jJfS/UsiFH511BuUN1bLFlWhIVz5R6V5E4JQY84="
									"constraint file exported as data":                          "XxIjpHDDw9FubV09IedIgMh5k9krBSUdAdviaOC5gVY="
									"-l static single":                                          "NSqiYIjOOlXuypY+1u6XeQjQTtB0AkMF6LlYcLcLLio="
									"-l static multiple":                                        "D3x174sg1C0GEiiHl4+DSgCNVQPolMn/i17mX2caa9I="
									"-l static multiple files":                                  "gt/7xMQ3gkC1DwEnBulR5e5Jdz8DIakUuIkd2gPJfWs="
									"-l dynamic single":                                         "nstVRITNBuJRIVNscBLaSn3Ffi6GxyYjVr3Oh8HTNWw="
									"-l dynamic single with function":                           "0B/PbOWyxIcmlYiGKa/XFJL5/488uAEESfwg4s/Ubuw="
									"-l dynamic --with-context":                                 "Id0huqyUGrY8oFjqqvWdQp6xTSltNh00zGCbGclt0eo="
									"multi-doc merge":                                           "11hTRMK08oxHa7HDT17ge3rdRJFiGPoWw2jvlX7J4LI="
									"multi-doc list":                                            "PWtem4rMem/yV3Ggj6yEJYMxCDyUCTWKbcI498g3BTk="
								}
								upload: {
									"test cue package inputs prose":              "SD26bHoYEkpNkMB3JlPotP4i2krlRD5Gm6JVTAivN64="
									"test multiple cue package inputs prose":     "fcKXcjeaQLlFLDxrQnpzKE/b29MS4Qrk23+6Pp+iqRc="
									"test cue package + other input types prose": "84VdGEVLLlz6ANKBjdoPb6OdB5DMriHzZ7h5CM96n9E="
									"stdin data":                                 "jS/aV6KXdCdzAgYj63ctMauEXTrv9YCQfDI7UU3HJIQ="
								}
								multi_step: {
									hash:       "5H24DO69KJB9KJQ8R5S6LH83P85Q68893T6TO6JNPHR42H6M9NKG===="
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
