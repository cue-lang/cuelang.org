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
									"cue export # package x1":                                   "tpNdnLKT8OvO/32a0z6sM6epnE02xG91xpk7Nd/t6JI="
									"! cue export # package x2":                                 "x22vfwizvnRw8pKuyjTJRkYmE4zHBFq+DQjZGTIJk1U="
									"cue export . # package x1":                                 "pz5rq2aj9TRLqHIVBpWQbIAmmESIZpwtsAW4FMDtVH4="
									"cue export .:one":                                          "54Ai+1UXUDHq2iE40oBQWhRYb20VVMB31ocN/Y+zT4I="
									"cue export data.yaml":                                      "0zs2hkx7E8X7lRODSXurIdj8wKV9ScUxLnNCDrEOTkY="
									"cue export yaml: some.yaml.data":                           "JTsOaDGzPMBb8mrjt5+lljObJReXRenzp4S9zIrJpyQ="
									"cue export .:one .:two .:three":                            "pBaTz/idRZLh68k/ccf9DC6USREp7awwnICMWqKhKEU="
									"cue export package + package file + data + packageless":    "JAA9uXWLWqxzUySFrcyLQo6NEwkDRIORlyrNf51eXaE="
									"package file + data":                                       "VzIUuXOoS+wwqFb+3pirMO265bL3bCsnNfVLhemFo8w="
									"cue export package + 2x package file + data + packageless": "AEGqdJhKik6M2k65yPQG8PgcwxG7DZrNdmgOndITVMU="
									"data file inputs":                                          "ViMEp2PjFBkgFAXaACJ1bkuI//oH/8a45VP3t7dtizM="
									"data file inputs failure":                                  "NLLteMEI634+NmbP7gSjoxeopRqfia+0T7luJc7W0RU="
									"constraint file validating data":                           "b+LThWC7mP3VR65b2nM7sjwW3rT76nAKlQ+pCqwi8XY="
									"constraint file exported as data":                          "c+1/jv3lpzOOcFWCiIccrdSICXFxftRXzlPBymUnoEg="
									"-l static single":                                          "KVuXhyrAVDUOGToAdVN1ecB/iWrs+sNWsuDeDrekFts="
									"-l static multiple":                                        "SvKgUG6OjENQi90moHCStRcfbgn2cqDGzmIJyRlLoYM="
									"-l static multiple files":                                  "8rb5OY2ni33Q+8GlKHVcrNYNP9Hm8nyme0Oi/Z9O3gw="
									"-l dynamic single":                                         "YTSLYCU9I2rC155BqCzaN5kj1TR3gIhrtq2xW1H8ceg="
									"-l dynamic single with function":                           "e82rmEkYNFmxof5Zf3yKAfqiZALbFDGXEByN/Z1DN6s="
									"-l dynamic --with-context":                                 "DxhOQkYrHksai7eFzeGmnWNuHApDIhVZrMcYRIUv2p4="
									"multi-doc merge":                                           "O2DnpuEGxpZ1r2Fx2K2ZMpnUekfIPFEjlWTlEmE07xM="
									"multi-doc list":                                            "Ek9VK+jRkjbWeIG8XEg9VfbBK8gU6sbbFVxKZbZzohE="
								}
								upload: {
									"test cue package inputs prose":              "VeeWrz6ZH30cpBnabwMTT3J3aJTBEbwNxoi8fK//NSI="
									"test multiple cue package inputs prose":     "DIoCZlkbzmNTnf1M+IidM3pWo/P0LdVM3AQ9kgTkeJo="
									"test cue package + other input types prose": "6gGlLmp5MjafTHwkqbSJ149zO87G8kANCOVwROltUCE="
									"stdin data":                                 "hWMNjElbQH0asFL8EzWkvuB40mOrnq/xYp/WYxQbOvc="
								}
								multi_step: {
									hash:       "FR011FR9SQRD6IAEAQEAOJ7BDOGM11K44SSF7V9T3BBS8SKMMC4G===="
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
