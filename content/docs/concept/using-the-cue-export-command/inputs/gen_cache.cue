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
									"cue export # package x1":                                   "ajrK33ffpq71e5h2iuPLnASpzmD76uaCvdImpGIaIdo="
									"! cue export # package x2":                                 "7DhySLtYhdZRLCAZ0hSF+p8gLaFHl4driHiDSQl8U+s="
									"cue export . # package x1":                                 "efesS9WflyQ3/f6qxU6x5CqmSwyD53JpkCvgPAAc6s4="
									"cue export .:one":                                          "Ko/7FcTMzB3F4At80IZfCl/hHzW4EhFDT+m0xQIveAg="
									"cue export data.yaml":                                      "QZMkvX3avw93X1UzSJw8lZGz7zD84SWhAKilzYMVdVM="
									"cue export yaml: some.yaml.data":                           "pihOR/f05ElupVsUxlSpcHtt7REWGVTQJxKV9ONkGsw="
									"cue export .:one .:two .:three":                            "Bl/PbwDNyuzHGdCoUu3EdY58cdIByCuA5Ip9oTa7SEo="
									"cue export package + package file + data + packageless":    "KaYPtEc62tsaM/pjWNrXkBxwe8JdXhj2SxafRlMMMeU="
									"package file + data":                                       "vKSgLvG8NqSJlCoyUItB9nHtu9pgIjwZ2tmHRq+mGE4="
									"cue export package + 2x package file + data + packageless": "mrgOq5HjP5LIc3LqPrNXIcyfQVsNwOtuf1QMbQ0KcJo="
									"data file inputs":                                          "R2gqT7ayXL+YjPCV8dtxrnIIqPI2LNFxr0oG1NvVFyM="
									"data file inputs failure":                                  "Rcd/ixqd6ZDlivzbHdo6TKmIyfbpUlLDf9VE1ubD2iY="
									"constraint file validating data":                           "AmRqbZ8hvHv/nVtqP+roWLNNdyQzsf3Sac/Jdtizgds="
									"constraint file exported as data":                          "vM6D6PcErtNDN1g2yinu+HJTrzJP3m2RpgaDO3UByzI="
									"-l static single":                                          "rI5kLFhWYfz+JRywsKOaPMgN+JaGwDjY1McHhEmk5YE="
									"-l static multiple":                                        "qq4dPcN9lp//iZ11tP8i7ub8fnyejZjR/wbISjPJ98U="
									"-l static multiple files":                                  "DYlvbpOCoIZAbTTgtI17+1OkwgfN5VC+aSUQ+PnNnZQ="
									"-l dynamic single":                                         "P03qBm9+oJUQgn6jEN6wYlE2ESnGgmHAqC8VoD4LUho="
									"-l dynamic single with function":                           "uYDPCG5qbyLjs7HOJ/FsQ2MuWa8Oi+sDMjJzHVamF9Y="
									"-l dynamic --with-context":                                 "LEq+U3UbionMaRfAp1PnZccBKqPkRWWlZCPpCl/IYPA="
									"multi-doc merge":                                           "5JFhb0sQHEkBqL7qDEG7leulONT6jhGcesHDJDYBBKY="
									"multi-doc list":                                            "gdvF4brqq/pEVbw3WYu8Eu5cEyn+1aJgFKxnCdc1Caw="
								}
								upload: {
									"test cue package inputs prose":              "NHikXhRY/U9l56Kq/+3R/X1QdTVij7cyGMdAdqdN5Mw="
									"test multiple cue package inputs prose":     "+WFmCXvCIQW2BXPe16GOD1erhVz6/kfTZWkRN3OLr5w="
									"test cue package + other input types prose": "Bq/d1/1t7PwuIGC/MldJ+dKfU9C4i04TTjGR9rwh59s="
									"stdin data":                                 "qhRKaRsgCjsFBAuYM5Cy3h3k/MlkuEEAwc4yFbQS0cw="
								}
								multi_step: {
									hash:       "2PU9BL81GUUIEILLI1TTFILBA3M3COFB5LR9PR6K3RBCM66A4AL0===="
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
