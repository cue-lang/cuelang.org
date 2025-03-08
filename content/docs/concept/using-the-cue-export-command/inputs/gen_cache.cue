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
									"cue export # package x1":                                   "yLMBzdbjX2a35XLDQF9puJZXtIq3eDBcxPCSQCsKhXc="
									"! cue export # package x2":                                 "yX+pGH14Uac78oLqdEWZhW543QYNjU9d7ygEa5aFs/I="
									"cue export . # package x1":                                 "sW0xGXBrf5SARj2kMQFRGOrokhQwBskV9zwP+TZGDUI="
									"cue export .:one":                                          "AzYVKIy452pjiJXgLo4XvE0lor/D0wUn0MvjOaJPleM="
									"cue export data.yaml":                                      "JRJJ1KuW8yYYMHkXYCpZvlO+GSI3aTvkgKM2lMK0Yag="
									"cue export yaml: some.yaml.data":                           "fjCxq4B1Qbx2otA1QkQLcrRaLGagVxPWK8oKuEqomdQ="
									"cue export .:one .:two .:three":                            "l2OcdbNF3InRkq1rLZZc+e+UGe1P61Khq1XBIAE8q54="
									"cue export package + package file + data + packageless":    "UbAfZ2slrDUka1voMH5aWTXLYUNbGVDylNpVbTWuLz0="
									"package file + data":                                       "HoxCM53reu90aiB3UF+iwVEMqGiAcUWYWCSvrrF4BPo="
									"cue export package + 2x package file + data + packageless": "ywz3/aDQ1nhy7Ia08D4QfNuf1IQQ5ixQ9CZG8cUltDo="
									"data file inputs":                                          "nMwRNZSivPltDkmrJiWFYB4vpWNWzR9+kNaGJgDZvT8="
									"data file inputs failure":                                  "1DoYLq/RghqUHX6d0gvRBi9Lk6IgrRLWssaWSLTXgzw="
									"constraint file validating data":                           "IM0gvC8Pl4GNyjoVI+WQE60yao9tLoxqRavwel8c1tA="
									"constraint file exported as data":                          "IQKj2f9a/mZCE3uhIWyXUMu2TsYrYyf3WKL9N+r46Wc="
									"-l static single":                                          "3lpflDVU1/7iQ8FOOTgi+PHWhCbKrLsGzYB1/jmSfkc="
									"-l static multiple":                                        "TLsdbw9kUgH7RSIVfZXSGYsUDtqarE9FHiSk42KCGPE="
									"-l static multiple files":                                  "CppmVsFlfn68cFwM7yEZ3FtiyBe22IvylU5iNI4Tt+4="
									"-l dynamic single":                                         "9YFwALzhUbEBFVedMGT1gfaJk5cFnYnszeK8qPGMGMg="
									"-l dynamic single with function":                           "HWo5hAbU17+qQ2TUWON/zhDy87dTkua4IFz0+D1zWaE="
									"-l dynamic --with-context":                                 "f84RpJsDH4heseCIcofvuWH/u5R1/qBL+jX5B8pCP6o="
									"multi-doc merge":                                           "PHQ8eNhuDea+Mj+emOn8OVPDfMX0W2ioQWb5nkQGT8Q="
									"multi-doc list":                                            "1m7Z8HWlZFUzLyQhopszoqL8kx9yXC/Mpb/OLT53q4c="
								}
								upload: {
									"test cue package inputs prose":              "uGQ1rzn3fMxvOPknqQiOSIB8NlfQZeo338TX6QZqHww="
									"test multiple cue package inputs prose":     "z5CINQMcX+6JrtDRH+El5EicFThmcqTd7nR+EJvUBbU="
									"test cue package + other input types prose": "yIsiegNS+Zlu39oMveJZ+wpuAZCJyDJiSNeQuJ2YFqM="
									"stdin data":                                 "MNl3Fo5FJ1XWd4MM+gWZN8JnRrWpXnFfQXRiWxE2+hs="
								}
								multi_step: {
									hash:       "JP8B2S2Q678S64JC9Q0PCC142AQCOA8510MDD9SB1N09D3AEAKFG===="
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
