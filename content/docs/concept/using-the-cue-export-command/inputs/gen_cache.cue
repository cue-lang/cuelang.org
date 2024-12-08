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
									"cue export # package x1":                                   "gFLqXf5tTd/A/7fwojnhnr3TswQZc4oX5vIJEer2Sz0="
									"! cue export # package x2":                                 "nbnxwccQqvHO31buun3O6mZdg/LVvbumP+zYulxFu7s="
									"cue export . # package x1":                                 "PZ74DcNiEfFZdH/2xnCZ97WajwGMlIDuQXVFLpJ/ScQ="
									"cue export .:one":                                          "lEP9jNIXfnwfV2X2qLdOyetAVowcIapFFaEE0tNSs2E="
									"cue export data.yaml":                                      "BK9r9yM0qQp6+MLZBCFEENxAXF2Sl8gUdsE9YlDBm8M="
									"cue export yaml: some.yaml.data":                           "nQiH2wogNAju/littOd8giM/i2BqkZAG1Jdlm5UgbXw="
									"cue export .:one .:two .:three":                            "dZ1uVISU003i6CK9t+Y/XK14sF+bR1xHUWNwyfGgM4U="
									"cue export package + package file + data + packageless":    "71+jUjhVPky6GBsr+EGH2NJya3GImTwOmkCIjX6rJ50="
									"package file + data":                                       "xmcEvR/c/w9oE9VQi53SExp3g3K+Kaxp7z8enXwCyIQ="
									"cue export package + 2x package file + data + packageless": "lw1YIhYbOwrw38TxGhfTXnYeJxa/K62aDpe9Fhc4Qyo="
									"data file inputs":                                          "Feh8L4cvk+gLwUrN9no1cVdBdGpWNY1+quWHiGGzOkE="
									"data file inputs failure":                                  "3vGjeB4auXmozxY0g6hIyea31gNNk1mEFyStQDSK0nQ="
									"constraint file validating data":                           "f3O13Oi4BE7NVreAZqLWGGEXATQ1Nj5OPeHMFThPgxU="
									"constraint file exported as data":                          "iMAawdvxY6LTHQzq2M52XjpwWReUMKeaqKMbVSTSOfY="
									"-l static single":                                          "ooJcW+g/eb2Ts8CzADLm0ExiGtWFOG6Dhx6eySAhYBo="
									"-l static multiple":                                        "ZOQ88MkGsMnfDWauOjYEkE29zH0ipKvNRmBCy8XYYeQ="
									"-l static multiple files":                                  "/rEqeAfAPsp/u15mtmFeAwzaSAkwvLivmsTNNpJtHN4="
									"-l dynamic single":                                         "FVT4tvSjdt7vNSDuhKX0+6T9yodolUXd/QealMnVzc4="
									"-l dynamic single with function":                           "hav7qlI3RjxwiN60KdM22Nny1CsCQbawZBNDvid32Xs="
									"-l dynamic --with-context":                                 "b75QpMkVTtXcmHoCUR7lLshRDfxLYO1Zo7RnuWidPxI="
									"multi-doc merge":                                           "oJNok8Zrt6W4EwXv5vcCLkrPgBD4M+p1ER8/q1VUStU="
									"multi-doc list":                                            "wjstUKoXIT17ElaHLZxAovwl7tZ6xRhy3ndpxcGG6oA="
								}
								upload: {
									"test cue package inputs prose":              "aPRsSlHzywwl4bfZp/FxuAkjzrbw/z3RX2hN/Fn+Qm4="
									"test multiple cue package inputs prose":     "mNvs4CIl3bj43BEItNyB3EDjHsAFw0tiZTNSO+NRss0="
									"test cue package + other input types prose": "E5n/pWmRRJl1oe/EtohAz9TAGENvSR8uWzCTMWi/WN8="
									"stdin data":                                 "c5TnzKuzBOxU5Oa8U6mhazK3N+pdXBcKj3va+vhYgNU="
								}
								multi_step: {
									hash:       "TU600QG8L022NC6C80JG6URLADFAJ64GUO97BR7AL6RDSGK6FCN0===="
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
												    "y": 2,
												    "x": "foo"
												}

												"""
									}, {
										doc:      ""
										cmd:      "cue export .:A data.yml"
										exitCode: 0
										output: """
												{
												    "y": 2,
												    "x": "foo"
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
												    "y": 2,
												    "x": "foo"
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
												    "y": 2,
												    "x": "foo"
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
												    "y": 2,
												    "x": "foo"
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
