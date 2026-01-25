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
									"cue export # package x1":                                   "ERi0XIiJ9vmIb15/PcG15yKL4pj5JBkJGlV/uf/FqaA="
									"! cue export # package x2":                                 "3mYtUtfY5Do79Fk4JlVHpzTTjSQrlM3Zr4CQnIteSV8="
									"cue export . # package x1":                                 "rRJgxFcsZaJUZ9O2FQrglBIVOgrDlM8EZB+dr5WYlWI="
									"cue export .:one":                                          "9BExesxGjakJPaB1yCM/IA48vjU7lUFakCwiac0DGbM="
									"cue export data.yaml":                                      "/L4r3OFohV5C2sizLWyc+CAQ14DbvRCDvNZ2J247E6M="
									"cue export yaml: some.yaml.data":                           "q0QOxb0FBMM5nElTHhmzzGf0JYmIske3dbarXYbqGMU="
									"cue export .:one .:two .:three":                            "Cuah4ajj7t18gmTpxpL0te0472UeUEHnL0VzqS8rbgk="
									"cue export package + package file + data + packageless":    "KKIfuKm1INfmv1w/umvGyKIkH1t1plaUvxstZFIUBHY="
									"package file + data":                                       "1eHbaQCwXjF/OJGbIq7hhXxa7SL/sPwywE+cC6pDowI="
									"cue export package + 2x package file + data + packageless": "UpB5Tn14xf3s18Re8aZX+rbo8waoOWkq/pxn/5ijhac="
									"data file inputs":                                          "uf/5P8Fj6PmpjUjX/fb6OIP9yncQDd+J1aHBcWYLyE8="
									"data file inputs failure":                                  "AEdZM907TOd+GJE6NytuPcfzTyaqKymvbTmEQktTEdE="
									"constraint file validating data":                           "YBahCEkGe11cqVMr8Bk4BL61A8YAbRkA9BRTfSzZviQ="
									"constraint file exported as data":                          "uaMIlMw4pRJi88xYqDsoWWW0eW/mqPNlgc0RLiFk5q0="
									"-l static single":                                          "1JO8QdNJbRk0osaHKRKS7xmsiMR/7x9KU/KINAjZ3i8="
									"-l static multiple":                                        "y+Mx3KKbpT3pGrVd6Nny/ZfiQFMC8TeM5wTU7dLMVaM="
									"-l static multiple files":                                  "VjJy6WiEdc0aSCIEwycpVkPa4uDtblmPtAjmq+KAjkU="
									"-l dynamic single":                                         "EYg05h5ervhXn5XQKhDGXSDIs//bX8kd+KQxbrErwsI="
									"-l dynamic single with function":                           "Qnzz/WwS0A6aZquGduRUvGBCTvD75rXsuPRSiz+yrng="
									"-l dynamic --with-context":                                 "uJepZvCMQuiZP0p4aoZlKeDJiqgP6qX//OjiOoxdhxg="
									"multi-doc merge":                                           "lcqaPKHqGkPWBkHj49ZcummxcF37689nvLPcC1QjU7E="
									"multi-doc list":                                            "Rk50bnupMxajWTb/b/qBSAnVLecgkcGoONNyHgX6zVc="
								}
								upload: {
									"test cue package inputs prose":              "cxnfVd+YDtyMHr174d789Qrh48VcxdDCpvyPAFXZy28="
									"test multiple cue package inputs prose":     "5HqwixF/XbkAS4I7YN+UoXDiWNokpvVlRt+buj0izUw="
									"test cue package + other input types prose": "4Kec6nk+hbraZcc5aREB52zCuJP7tBJVB7rMJbYyWdk="
									"stdin data":                                 "Mw13JTDRTHIxrimyoljBTqHYNWP45l/mp+ESMHVIIps="
								}
								multi_step: {
									hash:       "4M7JBJISQJM3RF3EA1OJF2IUTJE42JR0H8A5HD6SLAA13L3SUAEG===="
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
