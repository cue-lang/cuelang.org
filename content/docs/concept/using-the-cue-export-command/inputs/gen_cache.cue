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
									"cue export # package x1":                                   "ufP8GhNe6tT/84ghKaJ56Pqe48rW/yztcQTm+cExMos="
									"! cue export # package x2":                                 "TcRfQwGyN14iLDe3yV5lWJ0kWQdCVJ/ndvyubmIeUug="
									"cue export . # package x1":                                 "bUdHsWv1QThqESgM1zQQM5Md1x3TSPT++Psg/nmZFTM="
									"cue export .:one":                                          "taqaa1jzVITshPbHpVwvP1+8IwFSVqkAYrj8TiWOUt8="
									"cue export data.yaml":                                      "wvpmS+8w7ygQIWUzobXr2D0q/S6TLjDjN1AftrzllJs="
									"cue export yaml: some.yaml.data":                           "JTGzcNpSeNILc+6moPYYa5Ay1PvDnxCOW+KJKSaV1Wg="
									"cue export .:one .:two .:three":                            "qq692ryxLyIZZKmmcSq5Q2kMMDLN4xTnlCTTzLsuEYE="
									"cue export package + package file + data + packageless":    "HrWarzVhIL+JXMJX3trjcEAt+/njuaXgOn70Bn8h6Gw="
									"package file + data":                                       "2dwsgSXLUm+kIQDhUwejcxML5lvpczivgMFkK1i6MSE="
									"cue export package + 2x package file + data + packageless": "j0iB5SzGWgwAR9aMFUM+ONdsk7X3zqvyMVdr5g42Nog="
									"data file inputs":                                          "fKXGj7B+u4q4n4BiERNTGHr68+4n8riqdw3yyz2dhfs="
									"data file inputs failure":                                  "eRd87IuVUteFeXTf6x75krvLzZNy7qbtB0i9Yy9UyD8="
									"constraint file validating data":                           "Cl3ST6+2eWFlSWV39o5seI6UsYSP1LzI/gsNVzU/M/I="
									"constraint file exported as data":                          "o9gUBe1j4fM7Jh3RqkCwmwHEcAbHf73KlqV6IjfbmIY="
									"-l static single":                                          "G+Ctgl7kGn3RpDz/ig35/hLE7tem9vFu83MskGqJyyY="
									"-l static multiple":                                        "lagz+zq0y8eGejLKF/FwDiMdz2nAmkYZ4Lw7WOxDclQ="
									"-l static multiple files":                                  "FnYip+CSVeweTLuYPpE88iARG85EqXtZbPjKbTNI/cM="
									"-l dynamic single":                                         "uPy2aZxcmCXMn4CTG0sV61YBU5qLK42k85vLecgKJ0I="
									"-l dynamic single with function":                           "XyrQZR0ZbOvYdgh4LZ8upUjNzqyGa1Nj/tPsc+eE1v0="
									"-l dynamic --with-context":                                 "Tz8wx0Y6lGoDNOODJHTPu89fcH5WRmR1iGgd6FaywgE="
									"multi-doc merge":                                           "q6KZ39oo+mQgEQUSn11kLf+4zarUQ183FHn17X8ntXU="
									"multi-doc list":                                            "gljYK6ctp/+8ZOw3b7Ib6YRngt+bjfh7u72bYHCwVA8="
								}
								upload: {
									"test cue package inputs prose":              "4SQU86qnclZ7tKHwyTF8EVcP7Ue+5Berte4WUgRsixU="
									"test multiple cue package inputs prose":     "v9aFmnCoWXWuhqhmO0pclOmlTjBRsJkLasKAPDA8GTs="
									"test cue package + other input types prose": "DeAMQ1Uc8ECqGRdaxYqO5w8GBApnD3NaNDUMjanqiSQ="
									"stdin data":                                 "39tP3lQhAR1beoU0VbGnTmSfQWeZ/n2bnvqTu2aFF5E="
								}
								multi_step: {
									hash:       "6UC3DLQUO2T9EDV0HTCPVCJQBON4800N1TL7ALEVMMLHH1RHUUU0===="
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
