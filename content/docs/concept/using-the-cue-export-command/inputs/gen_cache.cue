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
									"cue export # package x1":                                   "UN9yDwNmFgshIy3wzdireBj3UgcrbaapquvEwJMKgks="
									"! cue export # package x2":                                 "nbaF2bfjsRj5JR8W90ILnZHMsO+1hhVnLhFSMttfS8Y="
									"cue export . # package x1":                                 "2tPVLZRxD9i4xyhpL622vabx7LmOvamLS0TVxUIEglE="
									"cue export .:one":                                          "1XwSS9953CxxDqCxEyc3rUOABuDZB67ByW7U2bvPmZ0="
									"cue export data.yaml":                                      "A0VU5fZUtjrefBoohRuRNxmOtpQLC1Tv396zagBrIEQ="
									"cue export yaml: some.yaml.data":                           "G6yDtOCN+8rkp6WbU7lMiUAI02E34dM2b4HaBHq5FKM="
									"cue export .:one .:two .:three":                            "JbEKYxEKivPU0JjVlgQcyHSir5smGVpxUY4j5AAdySY="
									"cue export package + package file + data + packageless":    "l4n0H08IMXxZ2DvGPRAHdmVqZqECKJ9wGZEQUpsG7aE="
									"package file + data":                                       "hj2AR7+J6xS+CWkroITL9TQiEzR5fRnppkFwl/fdw1Y="
									"cue export package + 2x package file + data + packageless": "lloR4nXkj51sL1hqr8FRTQJrOTDunM5koHpmOq0U7FE="
									"data file inputs":                                          "YXnX7SS5HOZyOPWkf5t5T/yXfQqYnCXEy2NipPC3lgU="
									"data file inputs failure":                                  "9A2J0yCngmEUDco2gOLjBZTJMkcX9ZavDczwa3Npces="
									"constraint file validating data":                           "hFHr0zeKzyowyGvI8enehdDjh/QurNWlCFbto4GPVoE="
									"constraint file exported as data":                          "xWqj/qhfx6Z0OyxSfnU0ecst/oxIylu0ZGSPWjIim1g="
									"-l static single":                                          "oXUvCcGZo+V9xwFMCogJb+EbuVh9lApqOnFgmw2tRJg="
									"-l static multiple":                                        "/m8GRdqdzMAXUGctJiCijrxMXN8uLlko2lSfM3yanDk="
									"-l static multiple files":                                  "/WwCFaIKTwosXYFVXeGM5334gUUldnAi6ik4sZU9eDo="
									"-l dynamic single":                                         "szYkw/BFKcQ4FTySq6pTnE4kVwitxyY+dp02E5rAAM8="
									"-l dynamic single with function":                           "Ac9hanwXSWEyqm2hcidWhJfRCuj/7aiIz2wGkav4XIo="
									"-l dynamic --with-context":                                 "5TpteR4IIwAT4s40a/rQi4Z99enZpnB+W+i1OdhAOWE="
									"multi-doc merge":                                           "k3SQKcf+nWO1V0YhlBzWUVN38RqIDefwp2VFqbIzogw="
									"multi-doc list":                                            "pjdn+KWE3N5IEE5Vqob6TnjRw0Hx0fhXG14FZcBlaD8="
								}
								upload: {
									"test cue package inputs prose":              "UWUdtxCp3efvmA9s/CqLo2ULyTJtRAT86Zamp3Lp1aA="
									"test multiple cue package inputs prose":     "VANU/SuQDcqk+shxefYPRfIT2LKUF3ZVNWY73Q9rJWs="
									"test cue package + other input types prose": "pXR9pkkw512jM4l3K683lPYRTf6MtkXILdmYCn7rD0M="
									"stdin data":                                 "SjpI2svJwDhhRECNJUfBT3eW463yRmTq/qvtMtGb5tk="
								}
								multi_step: {
									hash:       "6INQNB2E7FCA954D5SP14B29VUVEM8IPQCJMIUESCQTROHOA97N0===="
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
