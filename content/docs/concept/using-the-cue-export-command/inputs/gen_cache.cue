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
									"cue export # package x1":                                   "UH3XFPA6DEBySfi9OQQuTyf6toZzGeY7C8pRKl8L4/g="
									"! cue export # package x2":                                 "QFgfCd6eWe+WmesbAzyCu3C8Gk4WhzeblZg1eQZU8kk="
									"cue export . # package x1":                                 "8ESpd+56K+A20OhkUeVHLumWlMuTzbgMDuAWtUJbIh0="
									"cue export .:one":                                          "gvK2HftYw4NG8NKEYdhNH7y+2czk0wMljVKGOqNUtp4="
									"cue export data.yaml":                                      "FCEqa3+a+KQ1R+8jucWkW2ijcKxL1JeH8g5F0nxDuBw="
									"cue export yaml: some.yaml.data":                           "t3ylpGOhjdEqfADY7JLqygAjYgoZXEXaAvDvGwBywt0="
									"cue export .:one .:two .:three":                            "4ekwy1i6W17qv9mMz1WpQbYbxthWJctGswty6bCS5N8="
									"cue export package + package file + data + packageless":    "96nwfjRPm2I4ZC6aDj3SgPFgbdS1NvDyXK5k6XEWBfw="
									"package file + data":                                       "yFhLFM8uG4HzaLuxwcjFp0fOc+36dRU2Db9SXXRQenQ="
									"cue export package + 2x package file + data + packageless": "IZMW9WABoS7j1M9MpFk8NZDVrp1lsuNTiGoUtM4fL9w="
									"data file inputs":                                          "iHoy8aHU/4hGDI5uKjorjWFWmDfnBxCe9hKLXLDgk1o="
									"data file inputs failure":                                  "XU7m5fwgITFv1ozzkzk1jLKD+wMjeQz9BLOkkwKhpFI="
									"constraint file validating data":                           "3WSuRkoOGkpX9eZv1oUo4dIvB5amgFVEgz20GTbdKuE="
									"constraint file exported as data":                          "kY4EioQg2ULTv8TK14aT8vmX1aKaYymhGZA/H4/Gomc="
									"-l static single":                                          "pZ5TW1nv9qawBHUXrRRimUD+Udzceq6PBuOd6eJtMzM="
									"-l static multiple":                                        "La3Jwm9t0sMzaVU+BE60kKsxmzGUXkCqNP8c/DYnhiQ="
									"-l static multiple files":                                  "mTNBsOfcdemqoGbs6b1x5Z1IUw1UYdir72bDhVbbHdE="
									"-l dynamic single":                                         "Nu0n9gSqVA68GoStyl06la628OEZcSz+pdYNtwl6fT4="
									"-l dynamic single with function":                           "YFUswaXcOlDrvsOlocr1WCgjlfiG1Fz1GIX/rmCEVn0="
									"-l dynamic --with-context":                                 "pvhlFQ++FXV0ECxGOdB7bqZUiWoUKrXhu3ZnKXz6g+8="
									"multi-doc merge":                                           "YEtiP6WZaPTE8V2ZhvVVsQzzxVqc8opvbKZc7K8/1Fo="
									"multi-doc list":                                            "xF5jFmB1sgJK90vop+nQGBK9AnU6IMXOenk6nxeXObI="
								}
								upload: {
									"test cue package inputs prose":              "mZGQ835Q769mZ41VO3It/iILVWKgnQ83gC7ilL17uCE="
									"test multiple cue package inputs prose":     "JAwk/hln/FvlwQ7CzQGqoJtC+d7kAeuS5pbPlq83Q/8="
									"test cue package + other input types prose": "JyL+e0q1N/p7fHbC2og5/dbTD097C8g9jjjSKgLK1JY="
									"stdin data":                                 "S+TfAGE4kf9XrtRKeybSb/ELA8gkSvvEyzN8ivg6sAc="
								}
								multi_step: {
									hash:       "B7G0QCNUILBIHEQ9521NUVJ9BGCJ8467C61VBHHB4BBD2P1CKMBG===="
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
