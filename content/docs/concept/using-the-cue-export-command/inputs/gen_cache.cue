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
									"cue export # package x1":                                   "iUarPyfg0QaeWgd3e8HwZ8tz5Y14qs2pUmAOA8BkaBQ="
									"! cue export # package x2":                                 "NUZV8gpqO/hXL+rwqhsEvuQnp6zopYrfNbuBl1MnluY="
									"cue export . # package x1":                                 "8JYsibhri+kMUROl1ma48JNK4JyHB8/9euap7tFaJ2I="
									"cue export .:one":                                          "mCXbFVEnoXS+0Al94RuS50FI/EAKW3BFJnEOfV3mUVY="
									"cue export data.yaml":                                      "iEhmOPSAWHrmg1S2c6gqyfF7bBYQdXNtc5aLpdgRpDQ="
									"cue export yaml: some.yaml.data":                           "MwN9k5v1f9dhUyoQEX/O5e5hFxAmCM01/weeLOPTrqQ="
									"cue export .:one .:two .:three":                            "JMFWE6elUuLkDiAquwKoacVfyYBtWGZ2MjvPMeg+uz4="
									"cue export package + package file + data + packageless":    "HjrF5rQvn3bZ40NLYHb3/SHc5hQlO075mzYuc2vi32E="
									"package file + data":                                       "jvUhPDFo3qVpte70sunab2OAxP+OGXdk66xM2Zm9k2k="
									"cue export package + 2x package file + data + packageless": "a5A13awJTZ4LBmwyf3+JsYY6+/gnnWZKFqOeMw0mTjc="
									"data file inputs":                                          "MFw9XIYlC7u8XFLvtB7+PQkGtaAGaIo0emvmBKiYEnQ="
									"data file inputs failure":                                  "FUeE9M1/6ClIZTU1RSbkwngGa/+/9G+mLukDVXshMgg="
									"constraint file validating data":                           "dokWnDf5o97msnxqpwjYYce/xaEaO6+YiS4FpIXXMI4="
									"constraint file exported as data":                          "RBz3rCdaNDkTCPQg92CkwhufiLAGqv1uaH8wpVxWYP8="
									"-l static single":                                          "cpZUaV+Ukf8mmK+TTjsZzyOlvpnduMgZjbmCFmQuPQI="
									"-l static multiple":                                        "9xP56jqcRjFBL1Bwj5XpDumA0gl0xOhwl8k+tWHfgUg="
									"-l static multiple files":                                  "sxzSIjA9vn0FwICuvk9siLFnbtu8q+GXk+5kUc1LRvk="
									"-l dynamic single":                                         "SuhwPOZ4kppTX/VvfKJZj62wWf+8Ivz+LC6OvD4B6/4="
									"-l dynamic single with function":                           "5lsWD2m6K79LwdGrQsqa7cQSwmNsod5lBaih4Zm0iQU="
									"-l dynamic --with-context":                                 "E2rj8L/F2sWjTGpnBi19NkbF+pUFtkQZcmKvisQ0QZg="
									"multi-doc merge":                                           "UKKfZYc9/His8i1Rsw5S2jJkn9xBSipoof0lFvxQZ4Q="
									"multi-doc list":                                            "zoPNQbmsgFqED/0hAOFQrz9jEWlbYcThbe6s6XRYCEI="
								}
								upload: {
									"test cue package inputs prose":              "AxYiwrt31x1Y9vF6N6BSd+bWFn23Cuv6nYU1FiN0oCo="
									"test multiple cue package inputs prose":     "Zh8MuEijOq/RlF/4IKpWaO9jD6XU8vxNnmzQdVOrnjU="
									"test cue package + other input types prose": "T/Bxt/YVZQIDgY8h6w78AXlEwejA9CWrNaPO1VihmJ8="
									"stdin data":                                 "/deiq4gZcwrNy9+5lSFw10E4DF23TeRu+PxLgC5Y23M="
								}
								multi_step: {
									hash:       "9D185ADDDQU9C69OQA12MAS334D6T7OIT7LK5PR5L2TRL24RCC2G===="
									scriptHash: "8M2BR6AKAE9FNP3DHB8JD628IAOH3AD1CBOP6HPP0SP6CV7DTNF0===="
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
