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
									"cue export # package x1":                                   "drAygU1Und6hQdqll2J6eW49TroysWl5P6I2S2p3Yww="
									"! cue export # package x2":                                 "0evGXNNp6xwPrBZCD0DmwL4HugMahzUjW1HKiXashBo="
									"cue export . # package x1":                                 "qCUeGmi961uOVNPEe4uO4rS/lxvqsWY+A2RMqdt5LFQ="
									"cue export .:one":                                          "KnjGaN2NsqOkZoxoiJ8j9EmnxdBGx8EVs7w7kDzyCjc="
									"cue export data.yaml":                                      "VMfhGPZuVPd+sMnN6NlAA+3F1iG4W8AXUsMQWz9lfzw="
									"cue export yaml: some.yaml.data":                           "9RYoVfwqyGUrU07Pb8XFhfR5FvF6hCdT0KYcIgs75ec="
									"cue export .:one .:two .:three":                            "a+6/LW8kQFMRdQYD0D0grKovOP5PHqgyCg7PB6sTsKk="
									"cue export package + package file + data + packageless":    "CNDaECiWh0GU+idzCLaSmlDBqB3XyBSakr3xZrOXtKw="
									"package file + data":                                       "oUWVNtCcB8ZLt4XlwC8ijsbV15ThZbWe38z8u3HpHTc="
									"cue export package + 2x package file + data + packageless": "RRknA5YT6ruheYufVOfz+97vhSiBjgye3q9Qb8Ywu7M="
									"data file inputs":                                          "r9eCSooNIT+/Gk46Si7ab8Vo7sWXUplKd7wVBK7qUKo="
									"data file inputs failure":                                  "Q2KB2p40JMO7kZLSHW54GSYKLSP/8gYYutiUIiIonK4="
									"constraint file validating data":                           "SnqcAGbIfa5UrkaxbC94jKU5mOP3ssefFTgFpozhc2M="
									"constraint file exported as data":                          "At8YSA1GruG1lZeKfpd6UzNNqLNJcIF+4Iim4taL774="
									"-l static single":                                          "BPjBUAN8wayCiQ76r/sznv2Ne0cGxS2qUEoZ+Gru5mU="
									"-l static multiple":                                        "J2tm8HKXcUlZN0Fd10F5o6qOdnUqd5G/EHoFrRRWQC8="
									"-l static multiple files":                                  "POy+Ft7djpoTzSvv294N8TuHT2v2V0JZG4vEoyw3jYE="
									"-l dynamic single":                                         "J42rkf4D12vlm19Z2QpgqYguoxholjf9vmewkMprFF0="
									"-l dynamic single with function":                           "IOqNSrD7V+4Eer//h4Erb1bm+oQeOqnz/CRBEiOu6co="
									"-l dynamic --with-context":                                 "HrnWfO1MZ0fWTZJfq95sJEI3Sh5o44T9Q9Fs7yUVlCc="
									"multi-doc merge":                                           "UPcebiPwmfcTOUL3qLbExxqJLiP3wiftTzopNrER76E="
									"multi-doc list":                                            "tJ0/CHpwvGPMp+cPkIDV/irgMHWpxxQSgDPLr4i+xcU="
								}
								upload: {
									"test cue package inputs prose":              "cUYuscpHeRqvqKXzIzhGcM5HB9V/nprv5xB0bBGxtyU="
									"test multiple cue package inputs prose":     "3a7TBqKlIZKFtAoJcnhlhfN+3gSjzHYcOWgCbihMWMA="
									"test cue package + other input types prose": "wJaM7hX40xJf4MVi4QoG7e6aKn+4moaFEv67dXqRcVE="
									"stdin data":                                 "vg7wAuIzeh0sZo4pmkRUixS71IEQHs4S15zxou9BWR8="
								}
								multi_step: {
									hash:       "IVFP79TRNFJA44A0G4AJFUNNT39N3P7AUFAHRSRV2BQMI6P3IS5G===="
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
