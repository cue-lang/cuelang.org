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
									"cue export # package x1":                                   "5n2v68+9EpfoTmAam8k6ZSpE0sdiJ0xaSzNvbJncE44="
									"! cue export # package x2":                                 "BBnBCkOeQ7QnDrsduV2Ra5DSsO4mJnnGXCUc1rhVxAo="
									"cue export . # package x1":                                 "Z+l2SdrJOxAXS5GbL6b2AH3q6dbMOluBkQHJDQBAKdU="
									"cue export .:one":                                          "vtoebPbrrNMzKxtfYEQSuxFGZGYNQGwhjSZsyfBbKqs="
									"cue export data.yaml":                                      "W76mjTRs4fahhqEgVJSSOfoqDuYH79LxpP0vCUzyCuo="
									"cue export yaml: some.yaml.data":                           "YO0ucqyc/T72MDyGwG+lCA61VoFxSq+bN/VzFVE5NLQ="
									"cue export .:one .:two .:three":                            "8qS1+87qxFLXmeAvisD5VBZY3Wx/8MCimDCwL+bGXkQ="
									"cue export package + package file + data + packageless":    "bhttMzFtEJ/wJsYoYaIuP3MJxc6hCS2P2Q8VfO1xQJM="
									"package file + data":                                       "LrLGnmIQGT3cK/c3GKYMIoCxmhjuS01/NrEBUDjTHT4="
									"cue export package + 2x package file + data + packageless": "w5x0kg7RWSXscZrsmMvt5+F8A3gIj+hhVWugES97UGU="
									"data file inputs":                                          "wmpWb+pWgkR/TFsUgxqG/lekWiFyxmCUPVEb+XH5n30="
									"data file inputs failure":                                  "9LpbTLL4CHT1bXBXO/rTOPCBbvYmiDkncd57HG/wmc0="
									"constraint file validating data":                           "AG5sqt8Z1V1t6Pd41SPn7+QQoQw+diHvl4g9+MORy4A="
									"constraint file exported as data":                          "FuQ9VQJW+43SbzVoyttHQL60bTtmDoP0fKJRva4uwAM="
									"-l static single":                                          "WN9HPgpI7nuGAHhYJYirDQfD1WF2zRJ4ISQo4MU0emw="
									"-l static multiple":                                        "X4FKwgGDKOUzqJR04A2vXegJZybExZSs6u7tqNz5fYI="
									"-l static multiple files":                                  "eMSXZ80ZWVitmsQylEBuma3MkPD0FGR13u2wHvHV3TQ="
									"-l dynamic single":                                         "atBXICU+kPZTDfPWC+9JjX4eHFNuNevCsMkW6EMEDew="
									"-l dynamic single with function":                           "HQ/9SvfL3YL3Srvmin79mstlWYSMFWsJZzyQALke8GE="
									"-l dynamic --with-context":                                 "PRyAwE/9H07joEUWV24F27W39uuOSUKiAeWjpKfQte8="
									"multi-doc merge":                                           "m/WKU5dNqIgpVykOffwSRtXAP+5cbFNYSDt8PfSiQgc="
									"multi-doc list":                                            "md239NKULCvZzYMUN9L6vTCChd9AiKY7qoOocfO3+cw="
								}
								upload: {
									"test cue package inputs prose":              "0eOoZ30T8/qH92Hbt5Sv/Re6uirKWk52qAkMUZ/D+aw="
									"test multiple cue package inputs prose":     "S1wa4bD2QxQrnAEhHIPcaTPj/rpZczjsL0XmQCgUDXE="
									"test cue package + other input types prose": "hiDlByvHEqVAMoyso9GOA2ho/MfaMrHP/9ahwkjZ3xc="
									"stdin data":                                 "hlCwtV/HL3proAYme3VHUY8R2f2DYMUZxSvZ+H1nESg="
								}
								multi_step: {
									hash:       "7V2P88MV1RHMK5RTQQFANREARDC16HDCV3L4LP4O0HFFF75C6KR0===="
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
