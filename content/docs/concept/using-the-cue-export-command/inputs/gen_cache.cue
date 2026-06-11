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
									"cue export # package x1":                                   "n9X38/T1dBE18ihU6gJzGSHsBVvLzg9ySmCuZqkW06Y="
									"! cue export # package x2":                                 "lgsDuY+YM5r5Wi08W+lnj6hAEm+Ty18G/31K7w1udic="
									"cue export . # package x1":                                 "n1VEpOCACGFNkmRKL1vRZSU24b7PO652wVmsdQC4Y4g="
									"cue export .:one":                                          "FrRs1JRwC7hW/jF1TESsvgpWEAlW6LzXRAaL+RQ4tFM="
									"cue export data.yaml":                                      "9+l2ZmyMpVBlcQS+o2pPLksJJGk16MaRsFlx2Ogag+A="
									"cue export yaml: some.yaml.data":                           "ilC5jzgIEbiPFm6GvSL9bMIvlhA9bxSnuT0i1/tOb9w="
									"cue export .:one .:two .:three":                            "w+bNkGSnPbWZf7lzLZOkn0a/70NH3Zj9dznZfsbvycs="
									"cue export package + package file + data + packageless":    "tT3KVk0pt2rTeZKTeKKsCoPry0Me6qfGbsh3D8S/Bbs="
									"package file + data":                                       "GMHhWxujwrq80YI3LtP6ncr4apqurcvVkB8MlcHQAsk="
									"cue export package + 2x package file + data + packageless": "VFwE3nb+Y6QnSijXG0hUidVP+nMG+KXJXNd+i643BzA="
									"data file inputs":                                          "GR36dW27KQXYnBFYN6qUiGSKSnf1FaUtGW2t6a8DzcE="
									"data file inputs failure":                                  "ehHU+rbrbxSxZEh6QeS9ve6TYdwgsfeLjn/afkA5j2E="
									"constraint file validating data":                           "bCeIrFbKW0Cr5jlCasYrcldH3bPwbpQnp6Y24joCnek="
									"constraint file exported as data":                          "VOsQZfTIZr27qyHj2Cb7SK+UV1nm/mu3ySBed316OSI="
									"-l static single":                                          "5kR37ldu04t+Affw918aoImCPcdUqcPFIs/o7JiEIZI="
									"-l static multiple":                                        "SCT1YZaDy7veJ+Py6jhczz+8L+4Wn1HeNiklZ8X+mak="
									"-l static multiple files":                                  "pD0sXBWuYjofbgDsW9PZ2oh0krHdfdyl1hz0C7nqgno="
									"-l dynamic single":                                         "/SYymx4QOZRqzYNdKVi5+Fl+rZpCuscWE6dKkqDdk/g="
									"-l dynamic single with function":                           "NVtLIISJvC5WFSuc65Dq+IThtWgB2Tb2v6qHq0pjri0="
									"-l dynamic --with-context":                                 "4zv4F8lmk64rSqB4gDy709ch/6A1RRCKjboj3NY5TA8="
									"multi-doc merge":                                           "1WVa8nGY+pwkp/mxLHAu0/9e4JHTKBkpUmq1X9I7azA="
									"multi-doc list":                                            "vIKpL174ZCfP5z5jWHF6ADUrkeuo4919aZYx+ZpumDc="
								}
								upload: {
									"test cue package inputs prose":              "e4kldd9OSFRLAv1vSVpWBEoKyBvF75YCHz9elNdV7cw="
									"test multiple cue package inputs prose":     "ZX53iqqCIAoj114pr00GP55XBmv3pJHTFCHK7r4opvQ="
									"test cue package + other input types prose": "ahv0TSklPNRyEoAI8jXUxq0g0wADh/xxs2IwWyavrRQ="
									"stdin data":                                 "QixrNnkn5vycB0AtJCgcmrDYcW0U/EO4m+smPLBFvfw="
								}
								multi_step: {
									hash:       "1BBJ2STBKEARM71B3PAQNOC0D62RDNQITP2C3BFJDH69D3EMMIAG===="
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
