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
									"cue export # package x1":                                   "KeeiQWkJ8uQUFn99vMAa41kK8u5vvbiSKBSjvYW5dtc="
									"! cue export # package x2":                                 "KuZxRmSgS+Raf+gJ0ewiNa5iuD01Hxt4TsUc34bK5HQ="
									"cue export . # package x1":                                 "AdVWoGz/A1Jn4peOaMmZndR3r4aGWTDP4cVqS/9ibio="
									"cue export .:one":                                          "b/veWS/gCuM7+zZ+/uJaeLrW7nMAg7nmF0yyMzoB9sA="
									"cue export data.yaml":                                      "KsDbhhgkJPF3AFzyCCZQfDqPOvyrq7eBVia/j7iVbNo="
									"cue export yaml: some.yaml.data":                           "RlJ93qwdcZ2A3ziFKOOq3Am2s1sB0F5Dzl1byLO3Axc="
									"cue export .:one .:two .:three":                            "GiVwjwz3Y8FVDCXD3W0OJ4X3+4W7VvqMzTLZd/8hqoQ="
									"cue export package + package file + data + packageless":    "g6OtuBBMhqK3+VHKi/Ese9AnsA3/kHfreT7OWY6XJ7M="
									"package file + data":                                       "BJ01ANXNnZkzIQTiBhCgEaSkWdf6rUdAP+GowDSxkX8="
									"cue export package + 2x package file + data + packageless": "wKC0dQOT7U8mMwVxcJ9RC57MDFpXOGJJW/8J/GT35zQ="
									"data file inputs":                                          "TVmdnxAUkkqS9qTdDeXzKtszIgrtA5cvhK+zaina6XM="
									"data file inputs failure":                                  "WsGLvCq6SGG9VnwFlrmpNM3PAm+i6ILZX1b4flW0Y8w="
									"constraint file validating data":                           "EmeA5a4jy+B8dZVpnRiypdv66+klakBspy61x5ht09s="
									"constraint file exported as data":                          "PrTRbAyri6dzDkcIAhEVVxVyRxn0lDD1DG8N/366wtU="
									"-l static single":                                          "h5NBzz1fRRTIJtc17fxdtomyiEfcnbXuTfo+nxGSt5U="
									"-l static multiple":                                        "1W/oIJhoUpFQ6Lznne142l77gBWZUJu5tKgNPPFYFFk="
									"-l static multiple files":                                  "bVOSvb5qYhevZQuUIksb4HkSsJwSDyD6JSFUfagVLzA="
									"-l dynamic single":                                         "5Bf1JNPTKlaTfSEG0D932LJItfGID/eJGXJ1YJjuz7w="
									"-l dynamic single with function":                           "fuAyzuLvJzwyIquiHdzLQJYtYlSIwBVsPnWKw7mzpqo="
									"-l dynamic --with-context":                                 "i5xsfh6aJgFa3VQyNkTPU0uR+402I8OjtsZ2stDhzKg="
									"multi-doc merge":                                           "wBComux81xKimcyhxs5q/6VvkuANb6Xey7rxCObCDrA="
									"multi-doc list":                                            "AmgT1AoWhr5ftiSgEkdPdmNCKPW+MLE5/EsVmuu21cU="
								}
								upload: {
									"test cue package inputs prose":              "ipq/vPnDpnkWuQUKw1Rr8utyrsbmPHI/YrU/ORiA3TM="
									"test multiple cue package inputs prose":     "2JpzfYBfDBH3IeOBlNBcRa2aEWBZ30zBM7+ZTUr6+UY="
									"test cue package + other input types prose": "w9fAMAtRjvBIK0DWDfudZ0ifHLaXgwvZ+++1REGuWIw="
									"stdin data":                                 "nyYVmkVeF+J/Rt4wi7UyPrttr588WHEycUQ0n1iCPmo="
								}
								multi_step: {
									hash:       "4PVQSV2GKVKSFHO11C5ACT6D23AC4SBDFLMGNKVTTTG3DGC5QJAG===="
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
