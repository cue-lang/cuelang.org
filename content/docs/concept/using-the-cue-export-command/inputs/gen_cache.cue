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
									"cue export # package x1":                                   "cDzTp+3DVdZviML0radcF39Jm9y6nJMyO9/Gj7dUhyM="
									"! cue export # package x2":                                 "p5SGzmp+ovG1n55R5m4SFzV5/MiFWekVXpAawnS1n3Y="
									"cue export . # package x1":                                 "ZZlUirg3bb+hOWQk13OncSxv0CRkNIn2Gp2Sq9xduuc="
									"cue export .:one":                                          "Groi/v70u1we/2OuZKNqnUevPaXyRYOHh4S54sJn5wM="
									"cue export data.yaml":                                      "l6qBLPKYdvooIYqjAxU1Q+WSHkh7mzgrztfR508SJlQ="
									"cue export yaml: some.yaml.data":                           "jV0ajrtbeifyHk6wZQ6wR9Blg+k+UrtRSXbnskXhboc="
									"cue export .:one .:two .:three":                            "p8cA7KXmHqZJW2wBTAq6Cqj4c47gQNKe4lOG6sTPqHM="
									"cue export package + package file + data + packageless":    "33g3oyxohF/gjNu2g9jkY+mPxLTB75gnie9cjgIyTCQ="
									"package file + data":                                       "VKqxf9GMV6GtqBtsBnqRjcupetmqzoBg/SK18biEI00="
									"cue export package + 2x package file + data + packageless": "dnJfyvoqUcuYUXMsLKe0t93gI3EGaSbqwLT6KwU2z3c="
									"data file inputs":                                          "+tVsux4BnV3+atS847EaIPwjjrv/+wBifILI6IxQGIc="
									"data file inputs failure":                                  "IGCfp2DKodmA4M3RMXIDxv2HXNPhjnsFqTUghRUyIzs="
									"constraint file validating data":                           "/bST9B905x8mkcy04npnCAWAugsXD5RMv11De76kudI="
									"constraint file exported as data":                          "SCKLRQ1YjRVAHrDwA6An2VKjE0OBIQeblSvrFPw00hU="
									"-l static single":                                          "ZW4ypG9mcfFlMk/bvnZjASh3MF0OqstUHSq/D67zzQI="
									"-l static multiple":                                        "7kLZKNpvTvXS+cw7L/0ohFv5ysZmzgYTB7aUKdjVFJs="
									"-l static multiple files":                                  "Vr+ht+k+fByClAjv2Df1C9yfyoLexvn5dYn7HPnXJ9o="
									"-l dynamic single":                                         "VvTIf1dScLzFX3Xbg93kjJAVUonV/omR6WzXkTmEr6s="
									"-l dynamic single with function":                           "Zn/cJCzrVgB13DX4cD7UxrvEDYIOOpkQXMkYWF7mpYo="
									"-l dynamic --with-context":                                 "F5mmrFMWu8urRH/zTG5uhO22Li2huiDroSmeJzfkdNc="
									"multi-doc merge":                                           "VuxSJ/jEFf6run2KRggMtczdcbp1KEF6yBkqcBsBAF4="
									"multi-doc list":                                            "m0gIfspKuiENQ5fhd33x7SLwgSWxvDGHn1JxBshkY0w="
								}
								upload: {
									"test cue package inputs prose":              "pz/p9/L2DlGXBzaDxIs6TL28ZVtn0VKOxbyFRUVQkvg="
									"test multiple cue package inputs prose":     "M08dBoI12cKfgAT/4txdBzPvWASNjyfw/gPRjo7xKVU="
									"test cue package + other input types prose": "GfU+JSCGKflXDe/UQfwsKEjPtE28etHwmxQ40Y5Z2zw="
									"stdin data":                                 "dX6f29fCYyrixn+3znOhU4pg3yLzvWkZLM0Vkj1gwhY="
								}
								multi_step: {
									hash:       "E0S83T50S13QBU9CEVDNA0LR104TOG86H4IJH24AFNQOACHSASO0===="
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
