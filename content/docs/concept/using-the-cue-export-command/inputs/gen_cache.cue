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
									"cue export # package x1":                                   "LFu66DkO7bBQ0dn5hRyLmxhkhOYbhHmM4OuISJZlquI="
									"! cue export # package x2":                                 "SNXIXKxCB9bR3Rldnc51naJLP7l8GTjOO55Pb2ZyN/0="
									"cue export . # package x1":                                 "wERswXS2cZ5nnAZotEfI2gNHqsiYv6Wv+Gh/mFACQf0="
									"cue export .:one":                                          "FbsB9VwBSjf5UlLpP2uTXY8YN6CiWJirmb9okmOL5Xg="
									"cue export data.yaml":                                      "Lyj7QKVO1y3u4qmhpwksN9LuBUBoNk97zMhJoImoFlk="
									"cue export yaml: some.yaml.data":                           "rvr+xHVz1jE4VX+hokar+eIhHvLwbXZrxUUTl3ope9Y="
									"cue export .:one .:two .:three":                            "0UBs9Qsw0W2Ms/T2EcrYdUBv6e1yjjjEyzuTbKRUtpQ="
									"cue export package + package file + data + packageless":    "rddNg4kNY51WNpEl8/Cug4FDqqNBfDDQSw8a09Hzxro="
									"package file + data":                                       "s7nyr5lOzT5MqA4GX06iXgO7ltsx5P2OxPhVswaYI1A="
									"cue export package + 2x package file + data + packageless": "qjpJ0zkM0zzoA/QjEuRhabVBL+Ylk/o3QJ+bYiRYfFo="
									"data file inputs":                                          "EtG8DxjW6aUpEU63BTg/1FYKLMhKTt17upW49lgN5Ro="
									"data file inputs failure":                                  "ShbeRMEqQnBoueW1ulNJzwufzRyJ5OCVMMwBiEGuwWY="
									"constraint file validating data":                           "WWb4Lgaf2EnykLlkvb48A0VRi3DZh6TVrg39AP3DeEU="
									"constraint file exported as data":                          "lev2VOks104tgaY8OlaXv8hTV/nwDDsgj6H3oOsuD/k="
									"-l static single":                                          "qLm3hfUprUo6LLbOKw4UAf9DrbI+S2GgLstUF2ggjUs="
									"-l static multiple":                                        "/medZ4BhCcDZzuOSUP41M9Q7Dl4QPK2DF+RiD0vzDqM="
									"-l static multiple files":                                  "6WY6S8MGyldJNCIejp/+Faal+E5rNgeJ1TTyk+XF1b8="
									"-l dynamic single":                                         "X2L1kKrteKnvTN/7ZmSFDUrOJkxLAs6Yo5CONFkOr7k="
									"-l dynamic single with function":                           "WBgwd7/OiCn/xPgNpbNwla3yvADbXmP/YnkXBp/jEW0="
									"-l dynamic --with-context":                                 "EDQeO8/CrRXLI+diBaRJswa+HJNY7vOzyBRmvDNXCRc="
									"multi-doc merge":                                           "9yzqVp+cw1ZNA9/LXo/nDTxRSiSpMHFfZNdlpx4eJZs="
									"multi-doc list":                                            "/W9MftdIcttu5ZcP45vhOm6mofl2wPXJMz/KIWVmtGo="
								}
								upload: {
									"test cue package inputs prose":              "KkZRPZIGGdfZHmSkpjQ7zHzUn/WhZj+0269oYtkpxYs="
									"test multiple cue package inputs prose":     "beOiXLqAIpEX6OiYoZg2Y4GLSjVWsevQyspXjGYbKB4="
									"test cue package + other input types prose": "IGpcGPCLP2DrUBJRTtSVZHrXsvwLlIRsR+1nCBe7NpM="
									"stdin data":                                 "pRe20Vjyskm5kpjLDqGZT4mzZwP/aPutbU3pIUTd+pc="
								}
								multi_step: {
									hash:       "3HCQJ61H0QMGLNGGLARDTP16BNVGPK3OMDQ48RMG5T4S8ACO0NVG===="
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
												cannot combine scope with file

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
												cannot combine scope with file

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
												cannot combine scope with file

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
