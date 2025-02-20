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
									"cue export # package x1":                                   "ZSrYy3uBDlKJIKa/O9Pu1lkFSXE24PtCl2mAjCAwDxI="
									"! cue export # package x2":                                 "D4ZSbe2BU//8V8KPkZXpExsJiCkuFRRcy0M+81HpAe8="
									"cue export . # package x1":                                 "UMxuQ9Vw9L0h7F9J1SDSzs0xCamrluIQfxVNYLfyrX8="
									"cue export .:one":                                          "88FvM5eWaetNZSfUO/qUxtbLMwdJ82qaiBd3olmEee4="
									"cue export data.yaml":                                      "MdbcRFugZ9phAvKxRxn1Yr40YWelVFjCIwhNxjS+Hzw="
									"cue export yaml: some.yaml.data":                           "iaj+TyDsg3EyXqKyIwkhlXYUjAyYWYyYH7gjdGk3+3k="
									"cue export .:one .:two .:three":                            "+ajhNr5hHxJBld3gnxg239yxT5ilQXIKZznXu+wV2S8="
									"cue export package + package file + data + packageless":    "IvWYVgRX2UnY8R5/Ls4qc+FQ7Do5ZdkDoKve/9L3mjA="
									"package file + data":                                       "6HcQal98eGgqFIOEqs35u6B/7JVW8ystoPrpD8BXVag="
									"cue export package + 2x package file + data + packageless": "zhFAO7nmZGadkroUsyPGaFoGLfyAv39FyW/6LL6JXjo="
									"data file inputs":                                          "XB+/gW9iHxPMfcFi0byi3wtTo0myv8g6FgiqPkNqjHU="
									"data file inputs failure":                                  "1tXFZy8Bt26oOcGmlCdbhw7qvkuxkfkAzK4UsP3Bimk="
									"constraint file validating data":                           "job2rUcywkjqxk+Lg/AzNUgQiYYEahfqKvPSzpRySOw="
									"constraint file exported as data":                          "xmU1SkgBLox0RUJbpin7nTBxjPSmaV3Bd0Kt/T1x25k="
									"-l static single":                                          "YzZzm6wAUTlNEOsN7CGljO6czZKuswd41Dlh4qEAhUk="
									"-l static multiple":                                        "/VIBBHeLNjX+ljeHF/0kEXTn1j81GwkWqHcpU9rjP3A="
									"-l static multiple files":                                  "FntAemqPdkfw7XeTzCCZsB+gL2vdiJ/Wfdtlx5oETbg="
									"-l dynamic single":                                         "8iO3/rolrDQ2MzYPc0VGEu/lz8CQ4dFv5GsLpuV6ENo="
									"-l dynamic single with function":                           "l4G0jJtQpPvTwZo43eRvSUSTCCLcl0ASBKVS9BlVZQk="
									"-l dynamic --with-context":                                 "pu55wnmEv+Zie9yWoAp+Mn5etKIpgQntEzo6QGrSsvA="
									"multi-doc merge":                                           "uj+c9HojyawRTf+OQ0LP+QSjv81L0eLcMgc2UESqlxk="
									"multi-doc list":                                            "SIPSrftoxxvpcKUF2jTGjAkmSo46gEK/yL/+prfe7nI="
								}
								upload: {
									"test cue package inputs prose":              "9B8OxInkugJO/6gEYxuCpakvQ72tTWnuIpVyC2iC9sI="
									"test multiple cue package inputs prose":     "VZ9V25KmjFYDdi9BbBEgI0E4A200xacELf75rdfyNlY="
									"test cue package + other input types prose": "dcJ5Cir2ctjIMSlQmqdn8cwD2LZr5zGOBn+y5LM9jT0="
									"stdin data":                                 "QqfhA+T00xSuZaLcsvWgocqc6FmK+OkaXPzFoskZVo8="
								}
								multi_step: {
									hash:       "PN9OLG34E8FMRG98S551D8GLAEQBMGUNLB7C3RD0R3773VOI5T3G===="
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
