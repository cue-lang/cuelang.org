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
									"cue export # package x1":                                   "MJTwzs8wXOYa+zYZ4ktVaGrHfSc313e2L+fDqWuTtJE="
									"! cue export # package x2":                                 "ogJ1NR1OlpptY+DL+fQvCbHpmlPWZzV3C/mHr4Cos0M="
									"cue export . # package x1":                                 "t3Ktwulh+sQtnLw/VeVPKKagUmZLsBKbi7PcWoMjTbY="
									"cue export .:one":                                          "4dPWACNRLPXb5OtduIOhOHP8xkYmvmrnrtBJum88Sx0="
									"cue export data.yaml":                                      "ajTxuhERkLHUR00fHgQNn0FPNPlEc8B9khEO5+hWa7c="
									"cue export yaml: some.yaml.data":                           "vke4cuIO0mooT4bx4Oy0RT2OvgaXXNThfwDLB5d5zvs="
									"cue export .:one .:two .:three":                            "rNxWQOaP7CSAXGvMkMcfLA7hVFoFnVNyYOd6zzpBQSM="
									"cue export package + package file + data + packageless":    "bdsW2hxQ1Owbekvr8ellyA/qpRc/3m/WjQLCS1X0vSw="
									"package file + data":                                       "WVQGTfZTN8U0zUrdsfq6+yyAOzWCDkpsbMp9KT/9IjI="
									"cue export package + 2x package file + data + packageless": "mYE1D0IIHtX6qboHWm9RFVpn/VKTVzhX1QFsROCPRfw="
									"data file inputs":                                          "V4fZetacszZ5/iuo4L65FT9uze+6m9vnDXr1ddsJwj8="
									"data file inputs failure":                                  "7ohUl3HZOZaO5Kf3vbwjgVbHdJIm/CHag/gjG/L8Aek="
									"constraint file validating data":                           "W6+QElqVHneqiFnUcf2dG5paEVys/sDZoEql5l6k0+Y="
									"constraint file exported as data":                          "1gBWi8Un4hVs07Fn+iqPOkvde4S7dfjrVKUAAh67BaM="
									"-l static single":                                          "r1Hs2An9qruyPvWVPF+K1Ehct5YBCeCKHUsBOyhtFKM="
									"-l static multiple":                                        "+7yi0bA6CC2CW1lIDJcY/uom+iXLSaxbmP1XAJgCHd0="
									"-l static multiple files":                                  "XFs6Gu0luH9VSi1kl11UyUv25dWD5+ofBQvDKnG7QAc="
									"-l dynamic single":                                         "L+rgQi3qKqcXolryKtr0djAq/eiHHvsbS09ObOfwnUM="
									"-l dynamic single with function":                           "JCRu0veJ291Or3aJ2tXYQ8S0HZ275Bc2KD0mH/yK0L4="
									"-l dynamic --with-context":                                 "DMxPcR/8ZVm1QLfO9/3DPvA5KALRllb52oqxYcgsFIY="
									"multi-doc merge":                                           "AlCccJFT2Tznm6D6S8WSv7cmL5F4R39yCfFzvuapduk="
									"multi-doc list":                                            "Bbjx9xZGYyvQ9TQksEFaSF4mHuk249ioaqSzJLFZ56M="
								}
								upload: {
									"test cue package inputs prose":              "JqweoZp8S4/B0aX5FmXGcPfbTEQt/YerlhXKQ1QK5MY="
									"test multiple cue package inputs prose":     "4Sa6bUIODKQ5VQNwF8xEJG0btZ45O4UtToCv6Thhdgo="
									"test cue package + other input types prose": "UMrCykwCfW9+NAiWeerOX4l7RlBRuuEOBQ4fJb4BtOs="
									"stdin data":                                 "M3inyfVwB165kA7FaWjL8aYG6SK6Bc/J+70OT/pxJDE="
								}
								multi_step: {
									hash:       "Q281S0PGHNVALOAJK9GK6SR6OBLKBLT60NDRG4PL4A1FQAFU3G5G===="
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
