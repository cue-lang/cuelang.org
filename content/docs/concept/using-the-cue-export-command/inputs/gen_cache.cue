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
									"cue export # package x1":                                   "yNnn4S7wpzSbAUgYFbZYHSv9A7m9OxcrWue6fcCu1HE="
									"! cue export # package x2":                                 "OqmO7bCkV3wakjE6lOcTPmorqRdQDDEnp0c6i0IL/xM="
									"cue export . # package x1":                                 "9wlAFZKUSJV1w6R4XeIozM2YG4u5dGtyvwlS+53M0hU="
									"cue export .:one":                                          "i8XGYbWxJT9CAzxw9ehHVgLq4HUw+hZWPgI5bNjwxkw="
									"cue export data.yaml":                                      "ToVD43zRqB6qlEfhl8qU1D2gNDetiYqjBJgOKLRk1g4="
									"cue export yaml: some.yaml.data":                           "kAL8ulhCqiXB3TIKJiisOyBUtTmrD3Oio6+QxuPH1K8="
									"cue export .:one .:two .:three":                            "6sMu89RmuMFFn6gLrr5fWO3OBSuNYktR0Z9YiSZ4yOQ="
									"cue export package + package file + data + packageless":    "3RplZ0p5oYlO72kuJqKorHqvvDX6oqsAnOIhXqDSB0k="
									"package file + data":                                       "k3DSvTxxloipHfI4DXeiI3ZDR47N7dVB0+LvZqq9w18="
									"cue export package + 2x package file + data + packageless": "KICeMoNop19sCCBDcYrEa8ScqdyjtQa1pHCUZ0lHxWk="
									"data file inputs":                                          "AbMgcKydDLrNz5HT5sk+MHE4JEspvM9OKosf5l1GEII="
									"data file inputs failure":                                  "6ZAXtjzouq1PREw3krLrK1lIKWULymmFJzhuoRRYTwM="
									"constraint file validating data":                           "ZzyfqyHaGFXymUXPD5LZAxrDgxkAKvQzPl7wNdkAWuw="
									"constraint file exported as data":                          "gPi98v1jTlguZaqiMOoKlmmvMVM96W7ERaL0vYJuSlw="
									"-l static single":                                          "68jufOHXvJZiAsZT08k9uVWDj6PWdKKp2CSgL33XwP4="
									"-l static multiple":                                        "F66mEc8NcipQgPGEwWRAo61SvUbJtL/0paw7kc+vwV0="
									"-l static multiple files":                                  "bLP7ZXUUmz4FuniMW/bW3JLyUtfnBy4NtmFqWF6qsM8="
									"-l dynamic single":                                         "1n/ft8xHHCrRzq4NH3h8ugDWPcWBPRpNkwrSXIePuUs="
									"-l dynamic single with function":                           "yqnd4MwZExDkwQVYVpBWQjj9/dHdP887X97TICsf5OE="
									"-l dynamic --with-context":                                 "nUt9LjLkZoRa1nK6O4KRMzUeCy+TTW/gQ1BNtk6/yyw="
									"multi-doc merge":                                           "mRI7jD8cUDeypIL6I+UKKiPZBfljiLYlXqFt8Jg0vfU="
									"multi-doc list":                                            "vNUbGiVLSGm+3KQPsVMmwJ8RSgmp/dT7M95tPi4zNf0="
								}
								upload: {
									"test cue package inputs prose":              "P8Wo4XWb8TZK5b4iinbH4kZuFORMdnCFbRCUI2UPYa4="
									"test multiple cue package inputs prose":     "+IcNIdyd+4J5b/OhNFiUnCP6feP8O12nHybTsLSZTJc="
									"test cue package + other input types prose": "oRszS+wZXhmDYuPWjeMOamAnXdv8xFQ4hEcUdJH/7P8="
									"stdin data":                                 "BQMixUokr/FHgXNUVRprWM3g/Qdnxnvle1ZHUudGc4o="
								}
								multi_step: {
									hash:       "PFV9CAJG7GQBACTP29L0KB7LCDHOO2OQKHS85S2QL4987M451J8G===="
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
