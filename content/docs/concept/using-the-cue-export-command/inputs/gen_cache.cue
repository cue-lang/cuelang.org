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
									"cue export # package x1":                                   "RC7TbWZCkZxlAG7L/XZ0Y4QVEFpgLcyrUGl7ElxMm2c="
									"! cue export # package x2":                                 "UpvlEdNDZGnE6UZUwi3u+P8jziu7rsUM28authIHdgk="
									"cue export . # package x1":                                 "ZlP1TV7w6svSwYbF1NMuUx8o6kr/iETMUNTyz3c4jR0="
									"cue export .:one":                                          "u+cwFDVlYJMGVfX9fs7GtGG1rOsE+V+jev3juC4Cc5c="
									"cue export data.yaml":                                      "BrMJA9NIebA/iRQ9/HijVR4PaVvWGSEmniLHvSMmseo="
									"cue export yaml: some.yaml.data":                           "32tHla5vi1hUIgBl0NCxPr7kVMo9qLONbQWAt2O0jHM="
									"cue export .:one .:two .:three":                            "Y1SvFFtYv8INQIWPv7Ub3RUiKF0F0Sb8qanpWUpRuFo="
									"cue export package + package file + data + packageless":    "+TKq/H8W/hhHShH3ZI88ZhFaLO0TBww1g7x+zVGycnU="
									"package file + data":                                       "ttXQ0r+Ad/pOg5SrWBeMGQo95U01BFZJh684u5VX1d4="
									"cue export package + 2x package file + data + packageless": "dHIplAtWDD0bLUxJEz5s4VjYa2Yddsg3gvu2nJixc9w="
									"data file inputs":                                          "7iqzRjJSfEMBzotBmE3V59f5fpTK4nKXVVFbkLLtnEw="
									"data file inputs failure":                                  "nPvwkpXJhc//q3iRTf0QoR7pusJmY6fFOrivwYx/ICA="
									"constraint file validating data":                           "s4EAc/nkIOEFDoZrfwBZQxvxNInsstPdz8ppDHiN6eg="
									"constraint file exported as data":                          "YfdkHrN5SjgXhq96Z717NfwvU0ETiWt5JyfzLTc9GXk="
									"-l static single":                                          "9GBMHUFaC9/GQPZcLKA+FirY2ei9MwesYwVljC/LnEs="
									"-l static multiple":                                        "u4F2iVnkEFfoupeGNMU41zcZLVV1tRP72bCt02+Bgpw="
									"-l static multiple files":                                  "oYmIiwN+oF4WGGE+hTJFIWEKiAJZc5M0gKBNqqpFUO0="
									"-l dynamic single":                                         "aA4wv31yNBYMoiq4n9hYaJSG9UFOs9LWoa69WwyYuzk="
									"-l dynamic single with function":                           "f4RD74xIf3/vynFTNBDYGrtcUv5XBSL3bopFktEG6ao="
									"-l dynamic --with-context":                                 "uTPVcyM555ypVVySLJa+YXNSEmxXn90GVrWeYqkUZa8="
									"multi-doc merge":                                           "kgWnRwpk4xmJ9QBmDgLB7vanhp+pulVOqL+sDIaWMso="
									"multi-doc list":                                            "gRw7LwRGslcnZbPjzZzIe7DttbWp9sdj+kVvnwZjR9I="
								}
								upload: {
									"test cue package inputs prose":              "i3QAw3bLshXSDgUuPYpfgCPpvAcsgYxViMrqnS1S+SQ="
									"test multiple cue package inputs prose":     "ZA3Z58beRS+E4qMTvf1In5XDVR73jrYs9Qg8ICMIeoA="
									"test cue package + other input types prose": "PUF1jr93926pm9NpRNWvS+mQgLyZ7WxMgkiE3dC5yqk="
									"stdin data":                                 "RDFGYwQLnncFE2hnrNzHgoeTwbdciV/PDkKh9tHMSrg="
								}
								multi_step: {
									hash:       "C2293UGPJHF0S5297OLU7CVR1T9UTJP9BTGSR2EUHDEBSNJVQN6G===="
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
