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
									"cue export # package x1":                                   "c8517ppKhBUQamnf0uAU4p8owjMZBxE+rTjsd0lu1ek="
									"! cue export # package x2":                                 "varZPN1ganMVejRjs22OvGwtVlmaERpCItAXGzLBlkw="
									"cue export . # package x1":                                 "SVk+NoHkJO0N/FF/Oy75pJk70D+AeTdxATTk1POBYCs="
									"cue export .:one":                                          "fg+SEx37wp75yf1YD1LUtDUBw7iw8XUjj9QYO3a4RyM="
									"cue export data.yaml":                                      "s4PzQAgBvFQ/KtePkW8+qRM7EJuInSrRuv0CI2MqWAo="
									"cue export yaml: some.yaml.data":                           "SDsqcRPBB9D4sPL63su7hRg0q2DDDVym1jFAHnD98/E="
									"cue export .:one .:two .:three":                            "NlSb27GHaUfJ2b1AkWJhBatGZWt7J8SG6A18z234y44="
									"cue export package + package file + data + packageless":    "QRgoiVWR3M16LnqCqDEVL2vg5ye6LpwDoxFOL0STp8M="
									"package file + data":                                       "8yDKljmvYeZWz3EoWjJoo3KDjwcvHvb7B87asL1xHEk="
									"cue export package + 2x package file + data + packageless": "cn6+UVd/BpAZsTCJdLHOMSycIbIYFUdKXBaVOmM3ujY="
									"data file inputs":                                          "IlpEuFlVUmldCjBKkCOU+luS8Nu0v0PRw37SSfqRhTw="
									"data file inputs failure":                                  "1091DL5prDXQlyc7bIvIMbZ1wPQCJihI5KHBzcQHJOA="
									"constraint file validating data":                           "r7iXOfFeRMloyIz8gDHiuLQWuUDcdeXBUIvo0FtEhx0="
									"constraint file exported as data":                          "cnlJsa9KGT+Q8JjeouLlCmFr5sBRDMlSFm36o4EhL50="
									"-l static single":                                          "UG9dazP9rvD/ujSIv5211XEl5zKLPh3FxLZsLPkuUQk="
									"-l static multiple":                                        "75C5aKInE8IHe0+4HkAvdW1LlD/E8bvKmIlZyajqmlQ="
									"-l static multiple files":                                  "e4VK+uwkjeNIWfyzzFqyXCh0nsi27uFvvt5E0bRucOc="
									"-l dynamic single":                                         "p5KAT7xMIXsjYrENaR9szwy1IcIjoE3pVKoP0X3Fzdc="
									"-l dynamic single with function":                           "FxVx/HA+9BXv1rFqIP8t2Rzo0qcmWhfs76GWIfu8bIs="
									"-l dynamic --with-context":                                 "dCPepcNCdYJIjVkphCDsNlXUb5SzbYhcb7iCMru4XmQ="
									"multi-doc merge":                                           "IhC1NqhdPKdxzYTZxhy+mNNrtNRC5QYQy4or485WAfI="
									"multi-doc list":                                            "xbNSPv5d0W+5gkCuyiPcAxfvZsNnb3BqTzwZHOo+ynY="
								}
								upload: {
									"test cue package inputs prose":              "SLZC/4FZutdb/V8dHioMETVocUYfLlL/p1fd9MB1Dcg="
									"test multiple cue package inputs prose":     "NHDPgvWRnrYJIs+R3tEnF5Ps29vRw2t79937ZwGh/WE="
									"test cue package + other input types prose": "hVBk3Iol4ClZ0oyHjh70s5ous7mxifUQQbP/zk8I9mM="
									"stdin data":                                 "oZriEsi96ttWe3WGJLWkuz3aExbrRfDeZ4wh3yNTksA="
								}
								multi_step: {
									hash:       "94PUD2CSRL3JT1EF9452NBMT4IU2U89EVTFFGHA7656TC95U0LFG===="
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
