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
									"cue export # package x1":                                   "/ObypUhrjdxFlOP83uyqMm92dTMYs9DkDAuNe2vugT8="
									"! cue export # package x2":                                 "mQEe+HGV5ezpGvKqmwAwpSnUjWBsdKuDRNvYEhzBV3o="
									"cue export . # package x1":                                 "GoCm3y8ygFHNMYnLWpZccbmdrRl3PIpoc/Y0mrp/uUI="
									"cue export .:one":                                          "J07Gkuz26Y7Np6ZbTf118Q6jUVSJm9eunfvHcy495ko="
									"cue export data.yaml":                                      "ENFbq0pdTNfhGvlmtd9F63Z7VCXke/RKNLboxorh7Yw="
									"cue export yaml: some.yaml.data":                           "uNkwyzfKBlZimYHKkedFAb7VosyFta781ZNAT1cJ4aU="
									"cue export .:one .:two .:three":                            "fMJTYwhGsZ5px+yPvCpIK3W9+jgMS2pPfBjh+DLK6lI="
									"cue export package + package file + data + packageless":    "dtaWcyztMvsBAGQHqUM7RmgYbUYKUW0kuqpi7uktlCY="
									"package file + data":                                       "P1PzUnW5kwfLt5k4CQs9chgqVr7qmPGQv6rxd73XHNE="
									"cue export package + 2x package file + data + packageless": "Sey/zfaNbY3idfrd6Gz89TCT20y75g0cDkFuxDU2a+s="
									"data file inputs":                                          "lE6xy0y5gfAiVue73RQPFthBIHgRykFw7sl9ND+rDjE="
									"data file inputs failure":                                  "e5oQl3mEkxqXfcA3kxpq74cozxc5S9ZX+MrNhYzNI14="
									"constraint file validating data":                           "oMydTYL/1dX3Tn2pjX5oA8JU/DQKu7bM1yl6OsNfibA="
									"constraint file exported as data":                          "31Dc0/xXC05Eo3Cg311S0tTCQNHrUl6pEXFy5j7vyB4="
									"-l static single":                                          "gly6ueUjcPFcGA9t6D/UKF5ofqkToDgsyJyhjvwLHSE="
									"-l static multiple":                                        "JwEu9xjoD68eVT4AHV3lrceCNIrwHxVqH5vPYzyT4+g="
									"-l static multiple files":                                  "0l9H2M+IKaH8dnO7fhMEzKqeh1Agf1IwV20AyjCMldM="
									"-l dynamic single":                                         "GpHNrkzTNbp5OVWr1jK5U4YXOVXHxHxNnMvRJvR695w="
									"-l dynamic single with function":                           "4HoADCut5O+TlXSFGt+7eDvwB9einp3PuJyogOyG5EA="
									"-l dynamic --with-context":                                 "YfLtxtzP3qZp77CH3w1jlH6omWk+9wcjStH/W0tkdNE="
									"multi-doc merge":                                           "S3/mRSLcLwm87Ck8JZlAszqEm5J6RWqNU/KGOndUKYQ="
									"multi-doc list":                                            "EeNevlEzQEydkPdhZWjnHigCwKY6AnE/EBDgINMzDEY="
								}
								upload: {
									"test cue package inputs prose":              "M4+F+ASHWXOCyO738OJvMHQwqKc8P8dfD8omz49eORo="
									"test multiple cue package inputs prose":     "vAQX8mo95NpcE8b+FAFLdM82e7NX46aX0tc2kV8HKEE="
									"test cue package + other input types prose": "svOqQN/s/DcHAPDe4ivJzJIHdgcBMp04UFsPFTVtMJg="
									"stdin data":                                 "qqe9XvoM1IbihG/pK1FsMZPHY/7l/v38ldk0ZAYlpWQ="
								}
								multi_step: {
									hash:       "CBFR7RSPMSRAJ6O3GJ8RTL8RSO136E5HP8728JOOQHJPSOTF9QFG===="
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
