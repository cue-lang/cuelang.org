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
									"cue export # package x1":                                   "UwhJX7vNOaYiJDlkBRUqAmlVAqVElooUmhpEcNA6b2M="
									"! cue export # package x2":                                 "sE2TdJSIaygl8u2Bu77L28JgRWl1cBeoEt6sFv0UVRo="
									"cue export . # package x1":                                 "1dfb4umK5Bq04HVkINXk5qUGnDfHMLyB/Ondk5tsOa4="
									"cue export .:one":                                          "7A+PVyoniMHbh3zLOXvisZs2QCY1Wv7x4SgoBIyNBKU="
									"cue export data.yaml":                                      "3JSy9lG7LNma1Z8FXlDeIXYiQpgOWEzDGKPSJlT5xE8="
									"cue export yaml: some.yaml.data":                           "iIOp3qKsaO9qGuuyazvodW7NS2KPQOBLOMHBt0DAIfA="
									"cue export .:one .:two .:three":                            "lSpkQp6yhB2p6HZEW6+BcPEEAFQypcioU/VoTEdSes8="
									"cue export package + package file + data + packageless":    "amclZG089x+4E8pnl7sk+Fj36Vrhjq1MU0BL2M3awP4="
									"package file + data":                                       "ii0Tw7S0+ssukoq1Up8w5SM3JUnfjnPZ1ZY8LYcZLOk="
									"cue export package + 2x package file + data + packageless": "mcUofMuon64TxSR7Pqd9vtRQkpPbY+LrsXQ/gLfVwoM="
									"data file inputs":                                          "iq/dh/ak1G83F76wrNR6luGQzbL1ai2QnqJVpgiYgrU="
									"data file inputs failure":                                  "BW0vRcYGETyLY45QTdTWnxauZCrbqEYv5CBuPgyvFIw="
									"constraint file validating data":                           "s2mr+zo847JYQ+e7R67VKYFec8Bg3Eu4XqRr5iHq9wM="
									"constraint file exported as data":                          "P/kBHnZcvRy+6AwwVZoNfAyu05P/3cK7nag3i9lHGok="
									"-l static single":                                          "SXDtfQtHWKeKRelcxDq4MHFayWvLlYOy3gyU8VdjvsQ="
									"-l static multiple":                                        "Z5idMgU2bbIj1suvTSaxiQQx03DI6R2v4X3S4FK9IG8="
									"-l static multiple files":                                  "Yxaw0mjlSeuu3ndTwO4r0yqGCA/pR9Ff17odQwyCTfU="
									"-l dynamic single":                                         "Ds7ekXo1HgRss+Q+dIEmEWSaCJP/pxDjEs96mDQVAdU="
									"-l dynamic single with function":                           "sUUbTgiM/GZgHroCLwyprnJ/2hjhA9JkB1NyW/WYWVY="
									"-l dynamic --with-context":                                 "7tpZuaBE6qEiQGunrReHV4bTGntw1adpJrdJuE9n2Us="
									"multi-doc merge":                                           "JTCyQHaectmPfgWiZ0GmyoqJTZ4C/mJcad6hoewPAYg="
									"multi-doc list":                                            "s/58evclK9UMtpDPUrYT9gtOeg1Oe7OgMSR0aOwU2g0="
								}
								upload: {
									"test cue package inputs prose":              "4/Ewyyke65asd5fTecesFj0OsUYwfsES8a3cf366JU4="
									"test multiple cue package inputs prose":     "SYOFrXkJBg64DVVUrDAurldvENcUatUXpat4e/Sl7dc="
									"test cue package + other input types prose": "xBI0NFk/jqlBMGoduqs2V/66T/nbFUBCGct0+jpfowE="
									"stdin data":                                 "5C/Tf7fF1WZsms/pFsnNXMlFoQ0MmamX+NvfvsBocq4="
								}
								multi_step: {
									hash:       "KF0L1KIJI26VO48P9VJNB4FRHSJHBCBP7LKKSSMUA8J728LC6LLG===="
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
