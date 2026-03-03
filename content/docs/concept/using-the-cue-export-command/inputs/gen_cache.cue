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
									"cue export # package x1":                                   "GF5oQk3O8DH1MIv9UYip9YEOfzRn4Dg7uA7l6hIK7s0="
									"! cue export # package x2":                                 "WExAAtfyqg9Jze20/HQMSBoj0HScXuZmVgeWdT1ZGA4="
									"cue export . # package x1":                                 "hgeEs4uSmttJbgP2ME7pie9thTi9kPwow21auuTC/ok="
									"cue export .:one":                                          "WehEQjXqoF4/xp4rnSHGPGkTzfq1+o+o+4JNY8wg5vE="
									"cue export data.yaml":                                      "1Bsu4PGU+nsI+9kEA3JWSF1auL9NlWID5jWCULG0w7s="
									"cue export yaml: some.yaml.data":                           "0UWYH2n6Ke0+VSl6h3ER5MaGnpOQ37f2eITFQ9g8Zy8="
									"cue export .:one .:two .:three":                            "c1l15mBMRzIuNUmnA1Jeku6iwheI+DqCKRDYniZ2iyQ="
									"cue export package + package file + data + packageless":    "hU9dbNAD5bd/gPlE2J8Ov1Yd0hr1F0LPKyP6zBLXQgQ="
									"package file + data":                                       "zfHSxhhIglhNLoOK+UY8ZkyHF0rl89Jku0WrMUD6tKo="
									"cue export package + 2x package file + data + packageless": "kyVIHkNY0SDI9dmUfAw4iKqXx0an6ESI0CXFUNxoo/c="
									"data file inputs":                                          "XuQ0IJg1fY1Eyc0fPyJb3esBNRE0IGycuT56lQrNP1M="
									"data file inputs failure":                                  "xyH8RHCLxVR3rChflxU5TI5ZqnGcdHJipzWM40MgCKc="
									"constraint file validating data":                           "1VBx9bei/MGVb/FWl+ZvRZBTnGQZDSfugQmB1qhQPHE="
									"constraint file exported as data":                          "bR0nUYtgQz5dj4SCU87jDRlAodIKBHv4bgikznNhmbE="
									"-l static single":                                          "bJpIqaHHz5p2PrUGJZgCFGZ1SpdM7sQj1/hgvkEjh+A="
									"-l static multiple":                                        "pBUze1qyKM8NtUwDUqw9LJ3nK0PQBBY469zhxQ+jjFc="
									"-l static multiple files":                                  "b9ETbGxRWjXz/UtOGBiVmirlSQq3IEZRO6kBnvkZPCQ="
									"-l dynamic single":                                         "k7hG9ylFb0ayhkWDNrc+o02v9DkK/cEGPPfOnjHwXQc="
									"-l dynamic single with function":                           "D+wrD0P2Nl7yOFCxh7O8LEV0FyWsRW5one+HmfWzTtA="
									"-l dynamic --with-context":                                 "TjXG8goImP04vB8uHdouVD0VMhSAUpONYee03czwDTI="
									"multi-doc merge":                                           "nLX3O1JTbN4nckmDQ13Hy6wtSYLicLu6u7ln0i+x2tY="
									"multi-doc list":                                            "pPfogtqgUacaou2538h5EdAPQEU8H8gK/NPRQLyFxjA="
								}
								upload: {
									"test cue package inputs prose":              "1Ak3JKaXDL6DNRVM14bGyg+HgVMs+R2uKUovM5B5Tx4="
									"test multiple cue package inputs prose":     "1HJQDq1f6Sg5uMX/AQtIb+ECuPrvMFA1mvZjChqPkmA="
									"test cue package + other input types prose": "K0chQnb+C4ZNt67W1LRRpqklnpx2XRugb1+Oo0OeXeo="
									"stdin data":                                 "nsj1duZL5Pa0cUNmIUWE1LNrswYdCCgiNqcsVXFAaHQ="
								}
								multi_step: {
									hash:       "M40G9EUHNGV4EJAOJH96RIDB08N2SHRD3N9O9NKJOJLVK2UFJ6G0===="
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
