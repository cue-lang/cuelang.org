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
									"cue export # package x1":                                   "ULo4n1Za69NPdVxtY4YvnmbFT+YMGSsczqSBM60tqFI="
									"! cue export # package x2":                                 "CAbhNfAxgxUBpsqCb/0j/8qkMoc+HLZ1bb5Eyg5QAcU="
									"cue export . # package x1":                                 "z/nIhdkHDECGR296Ks6Hc4ToX9PF9P0hi9xZHzySfdw="
									"cue export .:one":                                          "YHv/WRBCsvzB1xIYNGzxQdRDf8AImeyCKvld+H+ypdQ="
									"cue export data.yaml":                                      "RRvm2nCKhaMMK/UOIUR8Qld7CTgXERlr7ID9hQyK9Ak="
									"cue export yaml: some.yaml.data":                           "AvCB/VNgBHvwldqyENd4JgpPl/eEx8pDtX0zJqteLWQ="
									"cue export .:one .:two .:three":                            "EBv7XuX7K98HqJrfmgkpnbswvV5FhNJfBFkLoearNv0="
									"cue export package + package file + data + packageless":    "dEkcWj8R5nkbR6OML0xYEXuHo6vhW1Ot4uIKN8ePZ4w="
									"package file + data":                                       "AMbmGzVeoUd5G+UURgkiZK7KvcKgeqS7jv4u2PUC2Tc="
									"cue export package + 2x package file + data + packageless": "j2rNUcz9S0dbs63ayP6tuKlKmHINIrRKhvYAqLg0JZM="
									"data file inputs":                                          "+8SlsNuMizPmxqgb7dPGgP8LjCPB/FtV8qJ0daXe6hc="
									"data file inputs failure":                                  "qjLETvFMLoAzZ/ka+tM+fGBPN5DLrHpUhVW2uJa1Knk="
									"constraint file validating data":                           "tJoNnJL2lDzucou6LdNiIAwGN7a1h+LWKgXAbYNmTyo="
									"constraint file exported as data":                          "aYs4YJrktEfR2Ke/6dyhBwKlseSLnEo2njkTHbQBfGg="
									"-l static single":                                          "SKHiHnUzzx4RZIXbAu1rtW/ffelcYkRgys4to+UGaF4="
									"-l static multiple":                                        "Kw5FGrkQa6ptq/ojxFV/SdI2WkCgq/pM5wp1DlSej+4="
									"-l static multiple files":                                  "0bXuWWbJMLxluIcGHvdaETq/tfaL8CHUWWCLsVr48Yk="
									"-l dynamic single":                                         "Jz6fTY3nlPs9Erx0QjatUTD1EbnHDOTCDY6Urgmsggk="
									"-l dynamic single with function":                           "H5pgq9q+7zqEk2Tt5GXb2L53fCDMzd2aBPnpD1wxpFo="
									"-l dynamic --with-context":                                 "n90F5fRwkLRJ32ivWWF/T8c8IV9b189AzIp4NidXXRI="
									"multi-doc merge":                                           "B2wV5y2gAMtA8G0E9P1KOW/Jm5abcvO96fhk2uAtYoc="
									"multi-doc list":                                            "16Ny/Dzw1ynRrJDgyrvSPWn+U3OhX9592m1QTQzTFFQ="
								}
								upload: {
									"test cue package inputs prose":              "YlYU/TsXenWaaNQgEEFeAid/RIQlDonymlXqpuwT6gg="
									"test multiple cue package inputs prose":     "x+ARQK0bopqxlO6raRkvMDkhXyEPVbi+Gh1U5i0DCYU="
									"test cue package + other input types prose": "y4/X3QkicL367ErPX5Jr713yhhX7+jeNLJRAvrlQPIk="
									"stdin data":                                 "ofpFhoucPbSAPpPQVS9e3NbeZLHjrGtwHZ1jIhePRRk="
								}
								multi_step: {
									hash:       "1I86EB19I62OAGI40H2PAE451722VQ84JAJOOK92EFIQRCJ3CF2G===="
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
