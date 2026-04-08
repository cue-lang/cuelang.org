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
									"cue export # package x1":                                   "wcrrDgdc5Pgn4JhfJqDJF0kKo//YzCcW75XRyAaqqgE="
									"! cue export # package x2":                                 "uv/5uH2/sYH2EEeNnFzNOtPByvgAS5u7xS3o8XyEGFE="
									"cue export . # package x1":                                 "prWk+iaDxbDaJUYBeAUIOykiTyVDf9UcTAlSpTdMYT8="
									"cue export .:one":                                          "Yp/ctBoAPwAuHhflr/sTai9OIH/RGaY1C0xc4ojObbA="
									"cue export data.yaml":                                      "zVLHBN4eh2/Q2ox03CIlw2Yg8FIcx8VV5XCCdvcmzis="
									"cue export yaml: some.yaml.data":                           "pgzuWJH/kveRxDrRjENccWJNkBui6pX6OX0pQAG8pGM="
									"cue export .:one .:two .:three":                            "C+ygkPb5xSlAPZjThRmdZAeJNok04DcKYQPpi6rBEeg="
									"cue export package + package file + data + packageless":    "Lj4lpsR9R81b8iAfNqZpHFnk4h7cIZB8YwQTmdNV2og="
									"package file + data":                                       "QGE0ZYzD58cq9MRpQHLeFhHa5y3/hvXejXqx4oxwslg="
									"cue export package + 2x package file + data + packageless": "1KfvJY+dMwhr0Fy4UjdS0EnAQ0ORdJz32Tp1o0+KQXs="
									"data file inputs":                                          "SrVJAXr1IOnNnPXQ0xO+Db9a4pPEvIpZ0aBErso6Tl8="
									"data file inputs failure":                                  "WqyOFfTydkLGEBOOXzazRUpeo3vP0KMa1pNKPpLledY="
									"constraint file validating data":                           "2ltmA9l4YYlNSO/JffMCgKjk2TjH02VXVePdVeElQnE="
									"constraint file exported as data":                          "2t4qJKWpR7nzveLB/1JcPYROe9H3STWSKZytG/7qOws="
									"-l static single":                                          "A8Li54QIkvApR3DgmgaakbIz7RPKM+s71ZkjZGWsPGc="
									"-l static multiple":                                        "fmKGXj7vVbequs2Y9UGhLR34eDqo/zognKTSnpeVEFg="
									"-l static multiple files":                                  "ZF5nSQT7LbTU50el0sY7iUXwD/pBSMMLDkj+aB0NmJI="
									"-l dynamic single":                                         "gJsuKJ27xOLoHCpZM2AU0jBruj6N5CFxqrlLzWZ7yiA="
									"-l dynamic single with function":                           "Qzbe4+bQKdnhK/uhkSdNSMql72jsH8iDRRScGoPJnd8="
									"-l dynamic --with-context":                                 "ScLm2XBXRX8UEgvFYsrx08/4DGetVcJn3Sec1fHDkx0="
									"multi-doc merge":                                           "bwpPu5A8xbs4E55Ns8jCzLEWbxyCfA8itoDI5KjMKPY="
									"multi-doc list":                                            "FEyoqWD2GVJX6gQ6/L9CC5ELZO1OCJPcXiP0JdUo/ag="
								}
								upload: {
									"test cue package inputs prose":              "JVwsyih6k83tktFaC4zl4rzIh/17mK27FuSKgaS/1zo="
									"test multiple cue package inputs prose":     "OEg6M5uKH70pGtj122HJlPAViJRzHuDmyI9oxtyK24Y="
									"test cue package + other input types prose": "Fk7+TonUV9EBDX5Qf8LS4xvixAZoCI9Zz46VS8BANCA="
									"stdin data":                                 "/2m/zHj6qqGLaM6iFOo9vsXkmhy/FEVMd+3uKBPqqf8="
								}
								multi_step: {
									hash:       "KF4RLEDBCL7AUIDT8FV6C2GBTN88K9VTV3GPC5700K27LJ1GQOV0===="
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
