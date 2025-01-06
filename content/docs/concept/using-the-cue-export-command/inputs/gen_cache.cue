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
									"cue export # package x1":                                   "4dfS+0qlpJ1V4Rh09f23OL78oZkDA5ajI7Dy18pbedQ="
									"! cue export # package x2":                                 "dem1aZWiiecwk3OJCxChTR5tz3mvOviAuSA0gzuRU4M="
									"cue export . # package x1":                                 "yLYWtMdY9V2a5lsCPC1CWwdCEVeE38uL++0DXXuQyTk="
									"cue export .:one":                                          "AumARPFhKiB+xHu4B/YMTevYIKzNgFrbP/eRttVv7Mk="
									"cue export data.yaml":                                      "XZTB6BqZRLMozGG+vcPLOHKtuiW+10RcviwaVNGJJKU="
									"cue export yaml: some.yaml.data":                           "+AsQga8cUCTpsKEZo1ELVrG1UfUYaZTv3Cdinq3KCi4="
									"cue export .:one .:two .:three":                            "4jwGifK6DxOEgWkgZVTdg/S+Ixto/37uvQKe/MFtAus="
									"cue export package + package file + data + packageless":    "fMYOHc6VdrGH2ppSR3ezF8tbALc+XL/HxNd+FFsnpmE="
									"package file + data":                                       "rBx+Nw/8PWHtwf/kSHfdmBeB5PjIoq0C/dqSzGXHNpw="
									"cue export package + 2x package file + data + packageless": "81HmcghqjM/0XrY2pQ4HJT3RxMP7jrLkk1fLa2PhPTs="
									"data file inputs":                                          "x5xVYaM+oDfFbyrj4Z02FtmfZD9QkNoWpGoBfl3dYUc="
									"data file inputs failure":                                  "H9kNXSIBcwcTa7JZcwrTCI5q/cwE/PM/bfX0cJeqHYk="
									"constraint file validating data":                           "FrwSjvCwT8ed2tIEBHW95ap8eZ6if5Lj1Z5FwJvtL9Y="
									"constraint file exported as data":                          "bqc8FDu9hfb5VKc4AWALpllnKX6ut/cQdcD6zIioNfo="
									"-l static single":                                          "RT7LIHKwuYY7e6x5xNtB9490SNEqGO9df+bwcqab6Xk="
									"-l static multiple":                                        "dKZkaJloIMhdV5RKUNIw1j9QPaqPYdj5y0gSqjI5UQ8="
									"-l static multiple files":                                  "3Hbw3IWLb+E911WCdkzzzUKapy53lBjtsX//zPwG9iM="
									"-l dynamic single":                                         "NVjzAbP3Z7EekjfxSCdr7SxGUiWu01+y4VEp4pJvyf8="
									"-l dynamic single with function":                           "PFhQ+IaFvjIIdQ9BrHOKFycCH0/IDAQXvaDLRgWcRaM="
									"-l dynamic --with-context":                                 "T6Sw+w2+e/jrLe+cKFO3GcmwpxF2MLqijR6GVUUzAN4="
									"multi-doc merge":                                           "a3gJn+EQO3uemYtRC1A93gTf/Pyu7ql59sKpNSvAL2I="
									"multi-doc list":                                            "TG17BInVhBhIRRcmkrK7JsDIi1rkf7DBrx6KG4s+8Zw="
								}
								upload: {
									"test cue package inputs prose":              "5xqWw+1ID2MPX+p8pYtP//YwjKu/S3h3W5GSz2Q3Mtc="
									"test multiple cue package inputs prose":     "N/+e++7MjCzBZl+m8OO44lVcNwJbuEWbT3WarNDGasQ="
									"test cue package + other input types prose": "s5epZuCQeuRUZGFacAuOFfQmT0QzNYA2xAK+HTabyM8="
									"stdin data":                                 "EwbpgInRUlwqrlajYHBxyLUiOa7SBiy/MSjHuGUj0kM="
								}
								multi_step: {
									hash:       "RASD8DCILAKE52H4O5J4OH3PSH699T01NDKHFMH6DSC6U2KERIP0===="
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
