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
									"cue export # package x1":                                   "7gvYdXNhkX1pRBrWx47Ha6Ksu0lG5PQtQLt7C1e7ijU="
									"! cue export # package x2":                                 "04qpWvAJ26jgqmlPdaOqlULY9CNFaFCVsU3Ybn94hik="
									"cue export . # package x1":                                 "fMyF2VL9CKmUCEsSKdiKkb5Vzwr/ufRM8lJk0ZaEsvs="
									"cue export .:one":                                          "TL3gws047hEiswQEG4uJ4vRGw4JHTI1hBwlVYb6ZbWY="
									"cue export data.yaml":                                      "Jajjhl7C+s9MLoms2la11hfXY1IInqbvfDEyzuaXxSU="
									"cue export yaml: some.yaml.data":                           "oBTZRCIAYz04YrooHM2hEzT3M61BC4/EXpI8UMMyBzs="
									"cue export .:one .:two .:three":                            "QFWnX1vnL8xe4FXi9UENJP34VDIsA0vk7+It0iegdhE="
									"cue export package + package file + data + packageless":    "dxVZqXblLZrMUvRJLpSo9jEABejsUhAyLVvY1nXwTrw="
									"package file + data":                                       "BYgIyK+pfCrS15cVJycvQqt/d25kdn/YVl4gORk5ZcM="
									"cue export package + 2x package file + data + packageless": "nzipFm80qFXAwG+xoQ6KaTlB9lWRdqkeQv0vTPu7cCE="
									"data file inputs":                                          "1HQ4U+sl/hopKhCk0OJ+HIfAKawmyB6OO6+dVqka/w8="
									"data file inputs failure":                                  "j9QxxA6FAlADLvjt97DXsnKDbwm1+Q1tpbyRZwdbm7U="
									"constraint file validating data":                           "r258viAsdga7FdKy8nnmIy4RpcFIuN0riRWsh5J0+28="
									"constraint file exported as data":                          "b7sNfugQcgBuhViWVpIrG1U9SiRtOCcyCfp+IpoE0yU="
									"-l static single":                                          "mLrfl+aRrY7ZeTjePwo8fNtmfVkRZZmxSiGaunjPYic="
									"-l static multiple":                                        "4R0L7v/rdEiu/x1HeIpF9FUl27HmaKif6/zDLwq7x00="
									"-l static multiple files":                                  "oRObDcL1flQJcutGktu/dFRKA03swv0x/02CVNykZqk="
									"-l dynamic single":                                         "kXNzKKJ4l3fCZ+Ub7uQEK0tr5V5MR2fjY+FfEkgqM0w="
									"-l dynamic single with function":                           "HmtgRzq6mT2VBAWp0gLA6nG/RrQcHMMZe9PYcFHrXJ4="
									"-l dynamic --with-context":                                 "UNbmwGJZUUgvU2SFr/vl9cOrCbZ4e/yAcgrDWyDXFoI="
									"multi-doc merge":                                           "xKl9qDI0NY+InqrffncUmvsY234+x3ugu4Gr8jNpQ8Q="
									"multi-doc list":                                            "zW06Rdlp1aWjerrlQkpS+Ckew6yl55YLnJKw7L5qx+k="
								}
								upload: {
									"test cue package inputs prose":              "ukANpkl0n6P/NB9hJpXdcFRw1XSW0FHG3EcIbORzbz8="
									"test multiple cue package inputs prose":     "t7GN96+UBx3ijM35yZhZkAC8XObFm7DC+m7e/SMcHBg="
									"test cue package + other input types prose": "plLmZmPF7BzAcyXlxe4XwF8/QM82GD61N6kKQkc1Pxg="
									"stdin data":                                 "8NdQB3+btjzF6eE1a1c/Wc0fz57YscOX5GZzwADTSIY="
								}
								multi_step: {
									hash:       "8AN4EIF7SNJ1D9GUS96GBCLBSS5FEG43NG7D5ATIAPVG2PE3D2GG===="
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
